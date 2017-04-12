<?php

namespace App\Controllers;

//use Psr\Http\Message\ServerRequestInterface as Request;
//use Psr\Http\Message\ResponseInterface as Response;
use Slim\Http\Request;
use Slim\Http\Response;

use App\Models\InviteCode;
use App\Services\Auth;
use App\Services\Config;
use App\Services\DbConfig;
use App\Services\Logger;
use App\Utils\Check;
use App\Utils\Http;

/**
 *  HomeController
 */
class HomeController extends BaseController
{

    public function view()
    {
        $cdnfunction = Config::get('CDNType');
        $cdndomain = Config::get('CDNDomain');
        return parent::view()->assign('CDNType', $cdnfunction)->assign('CDNDomain', $cdndomain);
    }
    
    public function index()
    {
        $homeIndexMsg = DbConfig::get('home-index');
        $msg = DbConfig::get('home-code'); //code
        $codes = InviteCode::where('user_id', '=', '0')->take(10)->get();
        return $this->view()
                     ->assign('homeIndexMsg', $homeIndexMsg)
                     ->assign('codes', $codes)
                     ->assign('msg', $msg)
                     ->display('index.tpl');
    }


    public function debug($request, $response, $args)
    {
        $server = [
            "headers" => $request->getHeaders(),
            "content_type" => $request->getContentType()
        ];
        $res = [
            "server_info" => $server,
            "ip" => Http::getClientIP(),
            "version" => Config::get('version'),
            "reg_count" => Check::getIpRegCount(Http::getClientIP()),
        ];
        Logger::debug(json_encode($res));
        return $this->echoJson($response, $res);
    }

    public function tos()
    {
        $cdnfunction = Config::get('CDNType');
        $cdndomain = Config::get('CDNDomain');
        return $this->view()->assign('CDNType', $cdnfunction)->assign('CDNDomain', $cdndomain)->display('tos.tpl');
    }

    public function postDebug(Request $request,Response $response, $args)
    {
        $res = [
            "body" => $request->getBody(), 
            "params" => $request->getParams() 
        ];
        return $this->echoJson($response, $res);
    }

}
