<?php

namespace App\Controllers\Admin;

use App\Controllers\AdminController;
use App\Models\Node;
use App\Models\TrafficLog;

class NodeController extends AdminController
{
    public function index($request, $response, $args)
    {
        $nodes = Node::all();
        return $this->view()->assign('nodes', $nodes)->display('admin/node/index.tpl');
    }

    public function create($request, $response, $args)
    {
        return $this->view()->display('admin/node/create.tpl');
    }

    public function add($request, $response, $args)
    {
        $node = new Node();
        $node->name = $request->getParam('name');
        $node->server = $request->getParam('server');
        $node->method = $request->getParam('method');
        $node->custom_method = $request->getParam('custom_method');
        $node->traffic_rate = $request->getParam('rate');
        $node->info = $request->getParam('info');
        $node->type = $request->getParam('type');
        $node->status = $request->getParam('status');
        $node->sort = $request->getParam('sort');
        $node->level = $request->getParam('level');
        $node->g = $request->getParam('group');
        if (!$node->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = "添加失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "节点添加成功";
        return $response->getBody()->write(json_encode($rs));
    }

    public function edit($request, $response, $args)
    {
        $id = $args['id'];
        $node = Node::find($id);
        if ($node == null) {
            $nodes = Node::all();
            return $this->view()->assign('nodes', $nodes)->display('admin/node/index.tpl');
        }
        return $this->view()->assign('node', $node)->display('admin/node/edit.tpl');
    }

    public function update($request, $response, $args)
    {
        $id = $args['id'];
        $node = Node::find($id);

        $node->name = $request->getParam('name');
        $node->server = $request->getParam('server');
        $node->method = $request->getParam('method');
        $node->custom_method = $request->getParam('custom_method');
        $node->traffic_rate = $request->getParam('rate');
        $node->info = $request->getParam('info');
        $node->type = $request->getParam('type');
        $node->status = $request->getParam('status');
        $node->sort = $request->getParam('sort');
        $node->level = $request->getParam('level');
        $node->g = $request->getParam('group');
        if (!$node->save()) {
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
        $node = Node::find($id);
        if (!$node->delete()) {
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
        $node = Node::find($id);
        $node->delete();
        return $this->redirect($response, '/admin/node');
    }

    public function cleanlog($request, $response, $args)
    {
        try{
            $nodeId = $request->getParam('nodeId');
            if($nodeId==""){
                TrafficLog::where("node_id", ">", -99)->delete();
            }else{
                TrafficLog::where("node_id", "=", $nodeId)->delete();
            }
        }catch (\Exception $e) {
            $rs['ret'] = 0;
            $rs['msg'] = "删除失败";
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = "删除成功";
        return $response->getBody()->write(json_encode($rs));
    }
}