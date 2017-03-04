<?php

namespace App\Controllers;

use App\Models\Node;
use App\Models\CheckInLog;
use App\Models\InviteCode;
use App\Models\PassCode;
use App\Models\TrafficLog;
use App\Services\Analytics;
use App\Services\DbConfig;
use App\Utils\Tools;

/**
 *  Admin Controller
 */
class AdminController extends UserController
{

    public function index($request, $response, $args)
    {
        $sts = new Analytics();
        return $this->view()->assign('sts', $sts)->display('admin/index.tpl');
    }

    public function invite($request, $response, $args)
    {
        $codes = InviteCode::where('user_id', '=', '0')->get();
        return $this->view()->assign('codes', $codes)->display('admin/invite.tpl');
    }

    public function addInvite($request, $response, $args)
    {
        $n = $request->getParam('num');
        $prefix = $request->getParam('prefix');
        $uid = $request->getParam('uid');
        if ($n < 1) {
            $res['ret'] = 0;
            return $response->getBody()->write(json_encode($res));
        }
        for ($i = 0; $i < $n; $i++) {
            $char = Tools::genRandomChar(32);
            $code = new InviteCode();
            $code->code = $prefix . $char;
            $code->user_id = $uid;
            $code->save();
        }
        $res['ret'] = 1;
        $res['msg'] = "邀请码添加成功";
        return $response->getBody()->write(json_encode($res));
    }

    public function passcode($request, $response, $args)
    {
        $codes = PassCode::where('type', '=', '0')->get();
        return $this->view()->assign('codes', $codes)->display('admin/passcode.tpl');
    }

    public function addpasscode($request, $response, $args)
    {
        $n = $request->getParam('num');
        $prefix = $request->getParam('prefix');
        $g = $request->getParam('g');
        $level = $request->getParam('level');
        $size = $request->getParam('size');
        if ($n < 1) {
            $res['ret'] = 0;
            return $response->getBody()->write(json_encode($res));
        }
        ##$prefix="shop";
        for ($i = 0; $i < $n; $i++) {
            $char = Tools::genRandomChar(32);
            $code = new PassCode();
            $code->passcode = $prefix . $char;
            $code->type = 0;
            $code->g = $g;
            $code->level = $level;
            $code->size = $size;
            $code->save();
        }
        $res['ret'] = 1;
        $res['msg'] = "续命码添加成功";
        return $response->getBody()->write(json_encode($res));
    }

    public function checkInLog($request, $response, $args)
    {
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $traffic = CheckInLog::orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        $traffic->setPath('/admin/checkinlog');
        return $this->view()->assign('logs', $traffic)->display('admin/checkinlog.tpl');
    }

    public function trafficLog($request, $response, $args)
    {
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $nodeId = null;
        if (isset($request->getQueryParams()["nodeId"])) {
            $nodeId = $request->getQueryParams()["nodeId"];
            if($nodeId==""){
                $nodeId= null;
            }
        }
        $userId = null;
        if (isset($request->getQueryParams()["userId"])) {
            $userId = $request->getQueryParams()["userId"];
            if($userId==""){
                $userId= null;
            }
        }
        $logs = TrafficLog::orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        if($nodeId!=null&&$userId!=null){
            $logs = TrafficLog::where('user_id', '=', $userId)->where('node_id', '=', $nodeId)->orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        }elseif ($nodeId!=null&&$userId==null){
            $logs = TrafficLog::where('node_id', '=', $nodeId)->orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        }elseif ($nodeId==null&&$userId!=null){
            $logs = TrafficLog::where('user_id', '=', $userId)->orderBy('id', 'desc')->paginate(15, ['*'], 'page', $pageNum);
        }

        $nodes = Node::all();

        $logs->setPath('/admin/trafficlog');
        return $this->view()->assign('nodes', $nodes)->assign('logs', $logs)->assign('nodeId', $nodeId)->assign('userId', $userId)->display('admin/trafficlog.tpl');
    }

    public function config($request, $response, $args)
    {
        $conf = [
            "app-name" => DbConfig::get('app-name'),
            "home-code" => DbConfig::get('home-code'),
            "analytics-code" => DbConfig::get('analytics-code'),
            "user-index" => DbConfig::get('user-index'),
            "user-index-top" => DbConfig::get('user-index-top'),
            "user-node" => DbConfig::get('user-node'),
        ];
        return $this->view()->assign('conf', $conf)->display('admin/config.tpl');
    }

    public function updateConfig($request, $response, $args)
    {
        $config = [
            "analytics-code" => $request->getParam('analyticsCode'),
            "home-code" => $request->getParam('homeCode'),
            "app-name" => $request->getParam('appName'),
            "user-index" => $request->getParam('userIndex'),
            "user-index-top" => $request->getParam('userIndextop'),
            "user-node" => $request->getParam('userNode'),
        ];
        foreach ($config as $key => $value) {
            DbConfig::set($key, $value);
        }
        $res['ret'] = 1;
        $res['msg'] = "更新成功";
        return $response->getBody()->write(json_encode($res));
    }

}
