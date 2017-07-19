<?php

namespace App\Controllers;

use App\Models\CheckInLog;
use App\Models\InviteCode;
use App\Models\PassCode;
use App\Models\Node;
use App\Models\RSS;
use App\Models\TrafficLog;
use App\Services\Auth;
use App\Services\Config;
use App\Services\DbConfig;
use App\Utils\Hash;
use App\Utils\Tools;

use App\Utils\GA;

/**
 *  HomeController
 */
class UserController extends BaseController
{

    private $user;

    public function __construct()
    {
        $this->user = Auth::getUser();
    }

    public function view()
    {
        $userFooter = DbConfig::get('user-footer');
        $cdnfunction = Config::get('CDNType');
        $cdndomain = Config::get('CDNDomain');
        return parent::view()->assign('CDNType', $cdnfunction)->assign('CDNDomain', $cdndomain)->assign('userFooter', $userFooter);
    }

    public function index($request, $response, $args)
    {
        $user_index_msg = DbConfig::get('user-index');
        $othershop = Config::get('ManyShopGroup');
        if (config::get('ManyShopEnabled') && $this->user->g == $othershop) {
            $user_index_topmsg = DbConfig::get('user-index-top-other');
        }else{
            $user_index_topmsg = DbConfig::get('user-index-top');
        }
        if ($user_index_topmsg == null) {
            $user_index_topmsg = "在后台修改用户中心置顶公告...";
        }
        if ($user_index_msg == null) {
            $user_index_msg = "在后台修改用户中心公告...";
        }

        $node_msg = DbConfig::get('user-node');
        $user = Auth::getUser();
        $nodes = Node::where('type', 1)
                    ->orderBy('sort')
                    ->where(function ($query) {
                        $query->where("g","=",$this->user->g)
                        ->orWhere("g","=",0);})
                    ->where("level","<=",$this->user->level)->get();
        
        $rss_token = RSS::where('user_id',$user->id)->first();
        if ($rss_token == null)) {
            $new_rss_token = new RSS();
            $new_rss_token->token = md5(($user->email+DbConfig::get('token_salt'));
            $new_rss_token->user_id = $this->user->id;
            $new_rss_token->create_time = time();
            $new_rss_token->save();
        }else{
            $user_rss = DbConfig::get('baseUrl')."/rss/".$rss_token->token;
        }
        
        return $this->view()
                    ->assign('user_index_msg', $user_index_msg)
                    ->assign('user_index_topmsg', $user_index_topmsg)
                    ->assign('nodes', $nodes)
                    ->assign('user', $this->user)
                    ->assign('node_msg', $node_msg)
                    ->assign('user_rss', $user_rss)
                    ->display('user/index.tpl');
    }

   // public function node($request, $response, $args)
   // {
        
       // return $this->view()->assign('nodes', $nodes)->assign('user', $user)->assign('msg', $msg)->display('user/node.tpl');
   // }

    public function nodeqrcode($request, $response, $args)
    {
        $id = $args['id'];
        $ctype = $request->getParam('type');
        $node = Node::find($id);
        if ($node == null) {
            $res['msg'] = "发生错误";
        } else {
            $ary['server'] = $node->server;
            $ary['server_port'] = $this->user->port;
            $ary['password'] = $this->user->passwd;
            $ary['protocol'] = $this->user->protocol;
            $ary['obfs'] = $this->user->obfs;
            $ary['method'] = $node->method;
            if ($node->custom_method) {
                $ary['method'] = $this->user->method;
            }
            $json = json_encode($ary);
            $json_show = json_encode($ary, JSON_PRETTY_PRINT);
            if ($ctype == "SSR") {
                $ssurl = $ary['server']. ":" . $ary['server_port'].":".str_replace("_compatible","",$ary['protocol']).":".$ary['method'].":".str_replace("_compatible","",$ary['obfs']).":".Tools::base64_url_encode($ary['password'])."/?&remarks=".Tools::base64_url_encode($node->name);
                $ssqr = "ssr://" . Tools::base64_url_encode($ssurl)."|";
            }elseif($ctype == "SS"){
                $ssurl = $ary['method'] . ":" . $ary['password'] . "@" . $ary['server'] . ":" . $ary['server_port'];
                $ssqr = "ss://" . Tools::base64_url_encode($ssurl);
                
            }
            

            $surge_base = Config::get('baseUrl') . "/downloads/ProxyBase.conf";
            $surge_proxy = "#!PROXY-OVERRIDE:ProxyBase.conf\n";
            $surge_proxy .= "[Proxy]\n";
            $surge_proxy .= "Proxy = custom," . $ary['server'] . "," . $ary['server_port'] . "," . $ary['method'] . "," . $ary['password'] . "," . Config::get('baseUrl') . "/downloads/SSEncrypt.module";
            $res['json'] = $json;
            $res['json_show'] = $json_show;
            $res['ssqr'] = $ssqr;
            $res['surge_base'] = $surge_base;
            $res['surge_proxy'] = $surge_proxy;
            $res['ret'] = "1";
        }
        return $this->echoJson($response, $res);

    }

   // public function profile($request, $response, $args)
   // {
   //     return $this->view()->display('user/profile.tpl');
   // }

   // public function edit($request, $response, $args)
   // {
   //     return $this->view()->display('user/edit.tpl');
   // }

    public function passcode($request, $response, $args)
    {
        $code = $request->getParam('passcode');
        $user = $this->user;
        
        if ($code == "") {
            $res['ret'] = 0;
            $res['msg'] = "请填好充值码";
            return $response->getBody()->write(json_encode($res));
        }
        
        $code=PassCode::where("passcode","=",$code)->where("type","=",0)->where("level","<=",$user->level)->where("g","=",$user->g)->orwhere("g","=",0)->first();

        if ( $code == null || $code->type == 1) {
            $res['ret'] = 0;
            $res['msg'] = "此充值码错误";
            return $response->getBody()->write(json_encode($res));
        }
        
        $code->type=1;
        $code->use_time=date("Y-m-d H:i:s");
        $code->useing_userid=$user->id;
        $code->save();

        $this->user->transfer_enable=$this->user->transfer_enable+$code->size*1024*1024*1024;
        $this->user->save();
                
        $res['ret'] = 1;
        $res['msg'] = "充值成功，充值的流量为".$code->size."G。";

        return $response->getBody()->write(json_encode($res));
    
        
        
    }


    public function invite($request, $response, $args)
    {
        $codes = $this->user->inviteCodes();
        return $this->view()->assign('codes', $codes)->display('user/invite.tpl');
    }

    public function doInvite($request, $response, $args)
    {
        $n = $this->user->invite_num;
        if ($n < 1) {
            $res['ret'] = 0;
            return $response->getBody()->write(json_encode($res));
        }
        for ($i = 0; $i < $n; $i++) {
            $char = Tools::genRandomChar(32);
            $code = new InviteCode();
            $code->code = $char;
            $code->user_id = $this->user->id;
            $code->save();
        }
        $this->user->invite_num = 0;
        $this->user->save();
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    //public function sys($request, $response, $args)
    //{
    //    return $this->view()->assign('ana', "")->display('user/sys.tpl');
    //}

    public function updatePassword($request, $response, $args)
    {
        $oldpwd = $request->getParam('oldpwd');
        $pwd = $request->getParam('pwd');
        $repwd = $request->getParam('repwd');
        $user = $this->user;
        if (!Hash::checkPassword($user->pass, $oldpwd)) {
            $res['ret'] = 0;
            $res['msg'] = "旧密码错误";
            return $response->getBody()->write(json_encode($res));
        }
        if ($pwd != $repwd) {
            $res['ret'] = 0;
            $res['msg'] = "两次输入不符合";
            return $response->getBody()->write(json_encode($res));
        }

        if (strlen($pwd) < 8) {
            $res['ret'] = 0;
            $res['msg'] = "密码太短啦";
            return $response->getBody()->write(json_encode($res));
        }
        $hashPwd = Hash::passwordHash($pwd);
        $user->pass = $hashPwd;
        $user->save();

        $res['ret'] = 1;
        $res['msg'] = "ok";
        return $this->echoJson($response, $res);
    }

    public function updateSsPwd($request, $response, $args)
    {
        $user = Auth::getUser();
        $pwd = $request->getParam('sspwd');
        $user->updateSsPwd($pwd);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    public function updateMethod($request, $response, $args)
    {
        $user = Auth::getUser();
        $method = $request->getParam('method');
        $method = strtolower($method);
        $user->updateMethod($method);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }
    public function updateSSRProtocol($request, $response, $args)
    {
        $user = Auth::getUser();
        $SSRProtocol = $request->getParam('SSRProtocol');
        $SSRProtocol = strtolower($SSRProtocol);
        $user->updateSSRProtocol($SSRProtocol);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }
    public function updateSSRobfs($request, $response, $args)
    {
        $user = Auth::getUser();
        $SSRobfs = $request->getParam('SSRobfs');
        $SSRobfs = strtolower($SSRobfs);
        $user->updateSSRobfs($SSRobfs);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }
    ### GA ###
    public function GaCheck($request, $response, $args)
    {
        $code = $request->getParam('code');
        $user = $this->user;
        

        
        if ( $code == "") {
            $res['ret'] = 0;
            $res['msg'] = "悟空别闹";
            return $response->getBody()->write(json_encode($res));
        }
        
        $ga = new GA();
        $rcode = $ga->verifyCode($user->ga_token,$code);
        if (!$rcode) {
            $res['ret'] = 0;
            $res['msg'] = "测试错误";
            return $response->getBody()->write(json_encode($res));
        }
        
        
        $res['ret'] = 1;
        $res['msg'] = "测试成功";
        return $response->getBody()->write(json_encode($res));
    }
    public function GaSet($request, $response, $args)
    {
        $enable = $request->getParam('enable');
        $user = $this->user;
        

        
        if ( $enable == "") {
            $res['ret'] = 0;
            $res['msg'] = "悟空别闹";
            return $response->getBody()->write(json_encode($res));
        }
        
        $user->ga_enable=$enable;
        $user->save();
        
        
        $res['ret'] = 1;
        $res['msg'] = "设置成功";
        return $response->getBody()->write(json_encode($res));
    }
    public function GaReset($request, $response, $args)
    {
        $user = $this->user;
        $ga = new GA();
        $secret = $ga->createSecret();
        
        $user->ga_token=$secret;
        $user->save();
        $newResponse = $response->withStatus(302)->withHeader('Location', '/user');
        return $newResponse;
    }


    public function logout($request, $response, $args)
    {
        Auth::logout();
        $newResponse = $response->withStatus(302)->withHeader('Location', '/auth/login');
        return $newResponse;
    }

    public function doCheckIn($request, $response, $args)
    {
        if (!$this->user->isAbleToCheckin()) {
            $res['msg'] = "您似乎已经签到过了...";
            $res['ret'] = 1;
            return $response->getBody()->write(json_encode($res));
        }
        $traffic = rand(Config::get('checkinMin'), Config::get('checkinMax'));
        $trafficToAdd = Tools::toMB($traffic);
        $this->user->transfer_enable = $this->user->transfer_enable + $trafficToAdd;
        $this->user->last_check_in_time = time();
        $this->user->save();
        // checkin log
        try {
            $log = new CheckInLog();
            $log->user_id = Auth::getUser()->id;
            $log->traffic = $trafficToAdd;
            $log->checkin_at = time();
            $log->save();
        } catch (\Exception $e) {
        }
        $res['msg'] = sprintf("获得了 %u MB流量.", $traffic);
        $res['ret'] = 1;
        return $this->echoJson($response, $res);
    }

    //public function kill($request, $response, $args)
    //{
    //    return $this->view()->display('user/kill.tpl');
    //}

    public function handleKill($request, $response, $args)
    {
        $user = Auth::getUser();
        $passwd = $request->getParam('passwd');
        // check passwd
        $res = array();
        if (!Hash::checkPassword($user->pass, $passwd)) {
            $res['ret'] = 0;
            $res['msg'] = " 密码错误";
            return $this->echoJson($response, $res);
        }
        Auth::logout();
        $user->delete();
        $res['ret'] = 1;
        $res['msg'] = "GG!您的帐号已经从我们的系统中删除.";
        return $this->echoJson($response, $res);
    }

    public function trafficLog($request, $response, $args)
    {
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $traffic = TrafficLog::where('user_id', $this->user->id)->orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        $traffic->setPath('/user/trafficlog');
        return $this->view()->assign('logs', $traffic)->display('user/trafficlog.tpl');
    }
}
