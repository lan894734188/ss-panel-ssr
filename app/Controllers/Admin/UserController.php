<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\TrafficLog;
use App\Models\User;
use App\Utils\Hash;
use App\Utils\Tools;

class UserController extends AdminController
{
    public function index($request, $response, $args)
    {
        $pageNum = 1;
        if (isset($request->getQueryParams()["page"])) {
            $pageNum = $request->getQueryParams()["page"];
        }
        $email = null;
        if (isset($request->getQueryParams()["email"])) {
            $email = $request->getQueryParams()["email"];
            if($email==""){
                $email = null;
            }
        }
        $users = null;
        if($email != null){
            $users = User::where('email', 'like', '%' . $email . '%')->paginate(15, ['*'], 'page', $pageNum);
        }else{
            $users = User::paginate(15, ['*'], 'page', $pageNum);
        }
        $users->setPath('/admin/user');
        return $this->view()->assign('users', $users)->assign('email', $email)->display('admin/user/index.tpl');
    }

    public function edit($request, $response, $args)
    {
        $id = $args['id'];
        $user = User::find($id);
        if ($user == null) {

        }
        return $this->view()->assign('user', $user)->display('admin/user/edit.tpl');
    }

    public function update($request, $response, $args)
    {
        $id = $args['id'];
        $user = User::find($id);

        $user->email = $request->getParam('email');
        if ($request->getParam('pass') != '') {
            $user->pass = Hash::passwordHash($request->getParam('pass'));
        }
        if ($request->getParam('passwd') != '') {
            $user->passwd = $request->getParam('passwd');
        }
        $user->port = $request->getParam('port');
        $user->transfer_enable = Tools::toGB($request->getParam('transfer_enable'));
        $user->invite_num = $request->getParam('invite_num');
        $user->method = $request->getParam('method');
        $user->enable = $request->getParam('enable');
        $user->is_admin = $request->getParam('is_admin');
        $user->ref_by = $request->getParam('ref_by');
        $user->protocol = $request->getParam('SSRProtocol');
        $user->obfs = $request->getParam('SSRobfs');
        $user->level = $request->getParam('user_level');
        $user->g = $request->getParam('user_group');
        if (!$user->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "修改失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "修改成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function delete($request, $response, $args)
    {
        $id = $args['id'];
        $user = User::find($id);
        if (!$user->delete()) {
            $rs['ret'] = 0;
            $rs['msg'] = "删除失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "删除成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function deleteGet($request, $response, $args)
    {
        $id = $args['id'];
        $user = User::find($id);
        $user->delete();
        $newResponse = $response->withStatus(302)->withHeader('Location', '/admin/user');
        return $newResponse;
    }

    public function cleanuser($request, $response, $args)
    {
        $userId = $request->getParam('userId');
        try {
            if ($userId == "") {
                User::where("enable", 1)->update([
                    'd' => 0,
                    'u' => 0,
                ]);
            } else {
                User::where("enable", 1)->where("id", "=", $userId)->update([
                    'd' => 0,
                    'u' => 0,
                ]);
                //不清除 否则会影响统计
                //TrafficLog::where("user_id", "=", $userId)->delete();
            }
            $rs['ret'] = 1;
            $rs['msg'] = "清空用户流量完成";
            return $response->getBody()->write(json_encode($rs));
        } catch (\Exception $e) {
            echo $e->getMessage();
            $rs['ret'] = 0;
            $rs['msg'] = "清空用户流量失败";
            return $response->getBody()->write(json_encode($rs));
        }
    }
}