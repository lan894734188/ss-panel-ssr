{include file='admin/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            充值码
            <small></small>
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
            <!-- left column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">充值码</h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body">

                        <div class="form-horizontal">

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">充值码前缀</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="prefix" placeholder="小于8个字符">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">充值码群组 Group</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="g" type="number" placeholder="不可空">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">充值码级别 level</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="level" type="number" placeholder="0为所有">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">充值流量数量 单位GB</label>

                                <div class="col-sm-9">
                                    <input class="form-control" id="size" type="number" placeholder="单位GB">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="cate_title" class="col-sm-3 control-label">充值码数量</label>

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
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">注意</h3>
                    </div>
                    <div class="box-footer">
                        <p>公共邀请码（类别为0的邀请码）请<a href="/code">在这里查看</a>。</p>
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
                url: "/admin/passcode",
                dataType: "json",
                data: {
                    prefix: $("#prefix").val(),
                    g: $("#g").val(),
                    level: $("#level").val(),
                    size: $("#size").val(),
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
        })
    })
</script>

{include file='admin/footer.tpl'}