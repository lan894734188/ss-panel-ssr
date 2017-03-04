{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            流量使用记录
            <small>Traffic Log</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <!--div class="row">
            <div class="col-md-12">
                <div class="callout callout-warning">
                    <h4>注意!</h4>
                    <p>部分节点不支持流量记录.</p>
                </div>
            </div>
        </div-->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body table-responsive no-padding">
                        <div class="row">
                            <div class="col-xs-6">
                                {$logs->appends(['userId' => $userId, 'nodeId' => $nodeId])->render()}
                            </div>
                            <div class="col-xs-6 form-inline pagination">
                                    <div class="form-group">
                                        <label for="userId" class="control-label">用户ID</label>
                                        <input class="form-control" id="userId" value="">
                                    </div>
                                    <div class="form-group">
                                        <label for="nodeId" class="control-label">节点</label>
                                        <input class="form-control" id="nodeId" value="">
                                    </div>
                                    <button class="btn btn-info" onclick="query()">查询</button>
                            </div>
                        </div>
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>用户</th>
                                <th>用户名</th>
                                <th>使用节点</th>
                                <th>倍率</th>
                                <th>实际使用流量</th>
                                <th>结算流量</th>
                                <th>记录时间</th>
                            </tr>
                            {foreach $logs as $log}
                                <tr>
                                    <td>#{$log->id}</td>
                                    <td>{$log->user_id}</td>
                                    <td>{$log->user()->user_name}</td>
                                    <td>{$log->node()->name}</td>
                                    <td>{$log->rate}</td>
                                    <td>{$log->totalUsed()}</td>
                                    <td>{$log->traffic}</td>
                                    <td>{$log->logTime()}</td>
                                </tr>
                            {/foreach}
                        </table>
                        {$logs->render()}
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>

    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
<script>
    function query(){
        window.location.href = '/admin/trafficlog?userId='+$("#userId").val()+'&nodeId='+$("#nodeId").val();
    }
</script>
{include file='admin/footer.tpl'}
