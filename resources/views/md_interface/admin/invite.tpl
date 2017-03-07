{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            邀请
            <small>Invite</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div id="msg-success" class="alert alert-info alert-dismissable" style="display: none;">
                    <button type="button" class="close" id="ok-close" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-info"></i> 成功!</h4>

                    <p id="msg-success-p"></p>
                </div>

            </div>
        </div>
        <div class="row">
            <!-- on column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">添加邀请码</h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">

                        <div class="form-horizontal">

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">邀请码前缀</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="prefix" placeholder="小于8个字符">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">邀请码类别</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="uid" type="number" placeholder="0为公开，其他数字为对应用户的UID">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">邀请码数量</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="num" type="number" placeholder="要生成的邀请码数量">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button id="invite" type="submit" name="action" value="add" class="btn btn-primary">生成</button>
                    </div>

                </div>
            </div>
            <div class="col-md-6"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">邀请码</h3>
                    </div>
                    <div class="row">
                        <div class="col-xs-5">
                            {$codes->appends(['userId' => $userId])->render()}
                        </div>
                        <div class="col-xs-7 form-inline pagination">
                            <div class="form-group">
                                <label for="userId" class="control-label">用户ID</label>
                                <select class="form-control" id="userId">
                                    <option value="">全部</option>
                                    <option value="0">公共邀请码</option>
                                    {foreach $users as $user}
                                        <option value="{$user->id}">{$user->user_name}:{$user->email}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <button class="btn btn-info" id="query">查询</button>
                        </div>
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>邀请码</th>
                                <th>用户名</th>
                                <th>用户ID</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            {foreach $codes as $code}
                                <tr>
                                    <td>{$code->id}</td>
                                    <td>{$code->code}</td>
                                    <td>{$code->user()->user_name}</td>
                                    <td>{$code->user_id}</td>
                                    <td>{$code->createDate()}</td>
                                    <td>
                                        <a class="btn btn-danger btn-sm" id="delete" value="{$code->id}" href="/admin/invite/{$code->id}/delete">删除</a>
                                    </td>
                                </tr>
                            {/foreach}
                        </table>
                        {$codes->appends(['userId' => $userId])->render()}
                    </div>
                </div>
            </div>
            <!-- /.box -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/admin/invite",
                dataType: "json",
                data: {
                    prefix: $("#prefix").val(),
                    uid: $("#uid").val(),
                    num: $("#num").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        //window.setTimeout("location.href='/admin/invite'", 2000);
                    }
                    // window.location.reload();
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        });
        $("#userId").val({$userId});

    })
</script>

{include file='admin/footer.tpl'}