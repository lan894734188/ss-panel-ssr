<?php

namespace App\Controllers;
use App\Services\Auth;
use App\Models\User;
use App\Models\Node;
use App\Services\Config;
use App\Models\InviteCode;
use App\Models\RSS;


use App\Services\Factory;
use App\Utils\Tools,App\Utils\Hash,App\Utils\Helper;
/**
 *  ApiController
 */

class ApiController extends BaseController
{

    public function index(){

    }

    public function token($request, $response, $args){
        $accessToken = $id = $args['token'];
        $storage = Factory::createTokenStorage();
        $token = $storage->get($accessToken);
        if ($token==null){
            $res['ret'] = 0;
            $res['msg'] = "token is null";
            return $this->echoJson($response,$res);
        }
        $res['ret'] = 1;
        $res['msg'] = "ok";
        $res['data'] = $token;
        return $this->echoJson($response,$res);
    }

    public function newToken($request, $response, $args){
        // $data = $request->post('sdf');
        $email =  $request->getParam('email');
        $email = strtolower($email);
        $passwd = $request->getParam('passwd');

        // Handle Login
        $user = User::where('email','=',$email)->first();

        if ($user == null){
            $res['ret'] = 0;
            $res['msg'] = "401 邮箱或者密码错误";
            return $this->echoJson($response,$res);
        }

        if (!Hash::checkPassword($user->pass,$passwd)){
            $res['ret'] = 0;
            $res['msg'] = "402 邮箱或者密码错误";
            return $this->echoJson($response,$res);
        }
        $tokenStr = Tools::genToken();
        $storage = Factory::createTokenStorage();
        $expireTime = time() + 3600*24*7;
        if($storage->store($tokenStr,$user,$expireTime)){
            $res['ret'] = 1;
            $res['msg'] = "ok";
            $res['data']['token'] = $tokenStr;
            $res['data']['user_id'] = $user->id;
            return $this->echoJson($response,$res);
        }
        $res['ret'] = 0;
        $res['msg'] = "system error";
        return $this->echoJson($response,$res);
    }

    public function node($request, $response, $args){
        $nodes = Node::where('type',1)->orderBy('sort')->get();
        $res['ret'] = 1;
        $res['msg'] = "ok";
        $res['data'] = $nodes;
        return $this->echoJson($response,$res);
    }

    public function userInfo($request, $response, $args){
        $id = $args['id'];
        $accessToken = Helper::getTokenFromReq($request);
        $storage = Factory::createTokenStorage();
        $token = $storage->get($accessToken);
        if($id != $token->userId){
            $res['ret'] = 0;
            $res['msg'] = "access denied";
            return $this->echoJson($response,$res);
        }
        $user = User::find($token->userId);
        $user->pass = null;
        $data = $user;
        $res['ret'] = 1;
        $res['msg'] = "ok";
        $res['data'] = $data;
        return $this->echoJson($response,$res);

    }
    
    public function RSSContent ($request, $response, $args){
	$token = $args['token'];
	$tokenauth = RSS::where('token',$token)->first();
	$tokenid = $tokenauth->id;
	if (!$tokenauth) {
		return 403;
	}
	$userauth = User::where('id', $tokenid)->get;
	$nodes = Node::where('type', '1')->where(function ($query){$query->where('g', $userauth->g)->orwhere('g', '0');})->orderBy('sort')->get();
	$rss_link = "";
	$ary['server'] = $nodes->server;
        $ary['server_port'] = $userauth->port;
        $ary['password'] = $userauth->passwd;
        $ary['protocol'] = $userauth->protocol;
        $ary['obfs'] = $userauth->obfs;
        $ary['method'] = $nodes->method;
	$ary['name'] = $nodes->name;
        if ($nodes->custom_method) {
	    $ary['method'] = $userauth->method;
        }
	    var_dump ($ary);
	    var_dump ($userauth->id);
	    var_dump ($tokenid);
	foreach ($ary as $ary) {

	    $ssrurl = $ary['server']. ":" . $ary['server_port'].":".str_replace("_compatible","",$ary['protocol']).":".$ary['method'].":".str_replace("_compatible","",$ary['obfs']).":".Tools::base64_url_encode($ary['password'])."/?&remarks=".Tools::base64_url_encode($ary['name'])."&group=".Config::get('appName');
	    $ssr_all_link = "ssr://" . Tools::base64_url_encode($ssrurl);
	    $rss_link .= $ssr_all_link."\n";
	}
	return Tools::base64_url_encode($rss_link);
}


}
