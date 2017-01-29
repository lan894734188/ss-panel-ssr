<?php

namespace App\Controllers;

use App\Models\InviteCode;
use App\Models\User;
use App\Services\Auth;
use App\Services\Auth\EmailVerify;
use App\Services\Config;
use App\Services\Logger;
use App\Services\Mail;
use App\Utils\Check;
use App\Utils\Hash;
use App\Utils\Http;
use App\Utils\Tools;

use App\Utils\GA;


/**
 *  AuthController
 */
class AuthController extends BaseController
{
    // Register Error Code
    const WrongCode = 501;
    const IllegalEmail = 502;
    const PasswordTooShort = 511;
    const PasswordNotEqual = 512;
    const EmailUsed = 521;

    // Login Error Code
    const UserNotExist = 601;
    const UserPasswordWrong = 602;

    // Verify Email
    const VerifyEmailWrongEmail = 701;
    const VerifyEmailExist = 702;

    public function login($request, $response, $args)
    {
        return $this->view()->display('auth/login.tpl');
    }

    public function loginHandle($request, $response, $args)
    {
        // $data = $request->post('sdf');
        $email = $request->getParam('email');
        $email = strtolower($email);
        $passwd = $request->getParam('passwd');
        $rememberMe = $request->getParam('remember_me');
        $code = $request->getParam('code');

        // Handle Login
        $user = User::where('email', '=', $email)->first();

        if ($user == null) {
            $res['ret'] = 0;
            $res['error_code'] = self::UserNotExist;
            $res['msg'] = "邮箱或者密码错误";
            return $this->echoJson($response, $res);
        }

        if (!Hash::checkPassword($user->pass, $passwd)) {
            $res['ret'] = 0;
            $res['error_code'] = self::UserPasswordWrong;
            $res['msg'] = "邮箱或者密码错误";
            return $this->echoJson($response, $res);
        }
        // @todo
        $time = 3600 * 24;
        if ($rememberMe) {
            $time = 3600 * 24 * 7;
        }

        if($user->ga_enable==1)
        {
            $ga = new GA();
            $rcode = $ga->verifyCode($user->ga_token,$code);
            
            if (!$rcode) {
                $res['ret'] = 0;
                $res['msg'] = "403 两步验证码错误，如果您是丢失了生成器或者错误地设置了这个选项，您可以尝试重置密码，即可取消这个选项。";
                return $response->getBody()->write(json_encode($res));
            }
        }

        Logger::info("login user $user->id ");
        Auth::login($user->id, $time);

        $res['ret'] = 1;
        $res['msg'] = "欢迎回来";
        return $this->echoJson($response, $res);
    }

    public function register($request, $response, $args)
    {
        $ary = $request->getQueryParams();
        #$regIndexMsg = DbConfig::get('reg-index');
        #if($regIndexMsg == null){
        #    $regIndexMsg = "";
        #}
        $code = "";
        if (isset($ary['code'])) {
            $code = $ary['code'];
        }
        $requireEmailVerification = Config::get('emailVerifyEnabled');
        $emaildomain = Config::get('emaildomain')
        return $this->view()
                    ->assign('code', $code)
                    ->assign('emaildomain', $emaildomain)
                    #->assign('regIndexMsg', $regIndexMsg)
                    ->assign('requireEmailVerification', $requireEmailVerification)
                    ->display('auth/register.tpl');
    }

    public function registerHandle($request, $response, $args)
    {
        $name = $request->getParam('name');
        $email = $request->getParam('email');
        $email = strtolower($email);
        $passwd = $request->getParam('passwd');
        $repasswd = $request->getParam('repasswd');
        $code = $request->getParam('code');
        $verifycode = $request->getParam('verifycode');

        // check code
        $c = InviteCode::where('code', $code)->first();
        if ($c == null) {
            $res['ret'] = 0;
            $res['error_code'] = self::WrongCode;
            $res['msg'] = "邀请码无效";
            return $this->echoJson($response, $res);
        }

        // check email format
        if (!Check::isEmailLegal($email)) {
            $res['ret'] = 0;
            $res['error_code'] = self::IllegalEmail;
            $res['msg'] = "邮箱无效";
            return $this->echoJson($response, $res);
        }
        // check pwd length
        if (strlen($passwd) < 8) {
            $res['ret'] = 0;
            $res['error_code'] = self::PasswordTooShort;
            $res['msg'] = "密码太短";
            return $this->echoJson($response, $res);
        }

        // check pwd re
        if ($passwd != $repasswd) {
            $res['ret'] = 0;
            $res['error_code'] = self::PasswordNotEqual;
            $res['msg'] = "两次密码输入不符";
            return $this->echoJson($response, $res);
        }

        // check email
        $user = User::where('email', $email)->first();
        if ($user != null) {
            $res['ret'] = 0;
            $res['error_code'] = self::EmailUsed;
            $res['msg'] = "邮箱已经被注册了";
            return $this->echoJson($response, $res);
        }

        // verify email
        if (Config::get('emailVerifyEnabled') && !EmailVerify::checkVerifyCode($email, $verifycode)) {
            $res['ret'] = 0;
            $res['msg'] = '邮箱验证代码不正确';
            return $this->echoJson($response, $res);
        }

        // check ip limit
        $ip = Http::getClientIP();
        $ipRegCount = Check::getIpRegCount($ip);
        if ($ipRegCount >= Config::get('ipDayLimit')) {
            $res['ret'] = 0;
            $res['msg'] = '当前IP注册次数超过限制';
            return $this->echoJson($response, $res);
        }

        // do reg user
        $user = new User();
        $user->user_name = $name;
        $user->email = $email;
        $user->pass = Hash::passwordHash($passwd);
        $user->passwd = Tools::genRandomChar(6);
        $user->port = Tools::getLastPort() + 1;
        $user->t = 0;
        $user->u = 0;
        $user->d = 0;
        $user->transfer_enable = Tools::toGB(Config::get('defaultTraffic'));
        $user->invite_num = Config::get('inviteNum');
        $user->reg_ip = Http::getClientIP();
        if (Config::get('ManyShopEnabled') && $c->user_id == Config::get('ManyShopUser')) {
            $user->g = Config::get('ManyShopGroup');
            $user->ref_by = $c->user_id;
        }else{
            $user->ref_by = $c->user_id;
        }

        $ga = new GA();
        $secret = $ga->createSecret();
        
        $user->ga_token=$secret;
        $user->ga_enable=0;

        if ($user->save()) {
            $res['ret'] = 1;
            $res['msg'] = "注册成功";
            $c->delete();
            return $this->echoJson($response, $res);
        }
        $res['ret'] = 0;
        $res['msg'] = "未知错误";
        return $this->echoJson($response, $res);
    }

    public function sendVerifyEmail($request, $response, $args)
    {
        $res = [];
        $email = $request->getParam('email');

        if (!Check::isEmailLegal($email)) {
            $res['ret'] = 0;
            $res['error_code'] = self::VerifyEmailWrongEmail;
            $res['msg'] = '邮箱无效';
            return $this->echoJson($response, $res);
        }

        // check email
        $user = User::where('email', $email)->first();
        if ($user != null) {
            $res['ret'] = 0;
            $res['error_code'] = self::VerifyEmailExist;
            $res['msg'] = "邮箱已经被注册了";
            return $this->echoJson($response, $res);
        }

        if (EmailVerify::sendVerification($email)) {
            $res['ret'] = 1;
            $res['msg'] = '验证代码已发送至您的邮箱，请在登录邮箱后将验证码填到相应位置.';
            return $this->echoJson($response, $res);
        }
        $res['ret'] = 0;
        $res['msg'] = '邮件发送失败，请联系管理员';
        return $this->echoJson($response, $res);
    }

    public function logout($request, $response, $args)
    {
        Auth::logout();
        return $this->redirect($response, '/auth/login');
    }

}
