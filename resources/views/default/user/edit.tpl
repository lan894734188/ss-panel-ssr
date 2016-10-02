{include file='user/main.tpl'}

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            修改资料
            <small>Profile Edit</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div id="msg-error" class="alert alert-warning alert-dismissable" style="display:none">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-warning"></i> 出错了!</h4>

                    <p id="msg-error-p"></p>
                </div>
                <div id="ss-msg-success" class="alert alert-success alert-dismissable" style="display:none">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-info"></i> 修改成功!</h4>

                    <p id="ss-msg-success-p"></p>
                </div>
            </div>
        </div>
        <div class="row">
            <!-- left column -->
            <div class="col-md-6">
                <!-- general form elements -->
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-key"></i>

                        <h3 class="box-title">网站登录密码修改</h3>
                    </div>
                    <!-- /.box-header --><!-- form start -->

                    <div class="box-body">
                        <div class="form-horizontal">

                            <div id="msg-success" class="alert alert-info alert-dismissable" style="display:none">
                                <button type="button" class="close" data-dismiss="alert"
                                        aria-hidden="true">&times;</button>
                                <h4><i class="icon fa fa-info"></i> Ok!</h4>

                                <p id="msg-success-p"></p>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">当前密码</label>

                                <div class="col-sm-9">
                                    <input type="password" class="form-control" placeholder="当前密码(必填)" id="oldpwd">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">新密码</label>

                                <div class="col-sm-9">
                                    <input type="password" class="form-control" placeholder="新密码" id="pwd">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">确认密码</label>

                                <div class="col-sm-9">
                                    <input type="password" placeholder="确认密码" class="form-control" id="repwd">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" id="pwd-update" class="btn btn-primary">修改</button>
                    </div>

                </div>
                <!-- /.box -->
            </div>

            <div class="col-md-6">

                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-link"></i>

                        <h3 class="box-title">Shadowsocks连接信息修改</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">连接密码</label>

                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <input type="text" id="sspwd" placeholder="输入新连接密码" class="form-control">
                                        <div class="input-group-btn">
                                            <button type="submit" id="ss-pwd-update" class="btn btn-primary">修改</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">加密方式</label>

                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <select type="text" id="method" class="form-control">
                                            <option value="{$user->method}">{$user->method}</option>
                                            <option value="aes-128-cfb">AES-128-CFB</option>
                                            <option value="aes-192-cfb">AES-192-CFB</option>
                                            <option value="aes-256-cfb">AES-256-CFB</option>
                                            <option value="aes-128-ctr">AES-128-CTR</option>
                                            <option value="aes-192-ctr">AES-192-CTR</option>
                                            <option value="aes-256-ctr">AES-256-CTR</option>
                                            <option value="bf-cfb">BF-CFB</option>
                                            <option value="camellia-128-cfb">CAMELLIA-128-CFB</option>
                                            <option value="camellia-192-cfb">CAMELLIA-192-CFB</option>
                                            <option value="camellia-256-cfb">CAMELLIA-256-CFB</option>
                                            <option value="rc4-md5">RC4-MD5</option>
                                            <option value="rc4-md5-6">RC4-MD5-6</option>
                                            <option value="salsa20">SALSA20</option>
                                            <option value="chacha20">CHACHA20</option>
                                            <option value="chacha20-ietf">CHACHA20-IETF</option>
                                        </select>
                                        <div class="input-group-btn">
                                            <button type="submit" id="method-update" class="btn btn-primary">修改</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="box-footer"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <div class="col-md-6">

                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-link"></i>

                        <h3 class="box-title">ShadowsocksRSS连接信息修改</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">连接协议</label>

                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <select type="text" id="SSRProtocol" class="form-control">
                                            <option value="{$user->protocol}">{$user->protocol}</option>
                                            <option value="origin">origin原版协议</option>
                                            <option value="verify_simple">verify_simple(不兼容原版)</option>
                                            <option value="verify_deflate">verify_deflate(不兼容原版)</option>
                                            <option value="verify_sha1_compatible">verify_sha1(兼容原版)</option>
                                            <option value="auth_sha1_compatible">auth_sha1(兼容原版)</option>
                                            <option value="auth_sha1_v2_compatible">auth_sha1_v2(兼容原版)</option>
                                            <option value="auth_sha1_v3_compatible">auth_sha1_v3(兼容原版)</option>
                                            <option value="auth_sha1_v4_compatible">auth_sha1_v4(兼容原版)</option>
                                            <option value="auth_aes128">auth_aes128(不兼容原版)</option>
                                        </select>
                                        <div class="input-group-btn">
                                            <button type="submit" id="SSRProtocol-update" class="btn btn-primary">修改</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">混淆方式</label>

                                <div class="col-sm-9">
                                    <div class="input-group">
                                        <select type="text" id="SSRobfs" class="form-control">
                                            <option value="{$user->obfs}">{$user->obfs}</option>
                                            <option value="plain">plain无混淆</option>
                                            <option value="http_simple_compatible">http_simple(兼容原版)</option>
                                            <option value="http_post_compatible">http_post(兼容原版)</option>
                                            <option value="tls1.2_ticket_auth_compatible">tls1.2_ticket_auth(兼容原版)</option>
                                        </select>
                                        <div class="input-group-btn">
                                            <button type="submit" id="SSRobfs-update" class="btn btn-primary">修改</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="box-footer"></div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (right) -->
        </div>
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $("#msg-success").hide();
    $("#msg-error").hide();
    $("#ss-msg-success").hide();
</script>

<script>
    $(document).ready(function () {
        $("#pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "password",
                dataType: "json",
                data: {
                    oldpwd: $("#oldpwd").val(),
                    pwd: $("#pwd").val(),
                    repwd: $("#repwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-error").hide();
                        $("#msg-success").show();
                        $("#msg-success-p").html(data.msg);
                    } else {
                        $("#msg-error").show();
                        $("#msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#ss-pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").show();
                        $("#ss-msg-success-p").html(data.msg);
                    } else {
                        $("#ss-msg-error").show();
                        $("#ss-msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#method-update").click(function () {
            $.ajax({
                type: "POST",
                url: "method",
                dataType: "json",
                data: {
                    method: $("#method").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").show();
                        $("#ss-msg-success-p").html(data.msg);
                    } else {
                        $("#ss-msg-error").show();
                        $("#ss-msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#SSRProtocol-update").click(function () {
            $.ajax({
                type: "POST",
                url: "SSRProtocol",
                dataType: "json",
                data: {
                    SSRProtocol: $("#SSRProtocol").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").show();
                        $("#ss-msg-success-p").html(data.msg);
                    } else {
                        $("#ss-msg-error").show();
                        $("#ss-msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#SSRobfs-update").click(function () {
            $.ajax({
                type: "POST",
                url: "SSRobfs",
                dataType: "json",
                data: {
                    SSRobfs: $("#SSRobfs").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").show();
                        $("#ss-msg-success-p").html(data.msg);
                    } else {
                        $("#ss-msg-error").show();
                        $("#ss-msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>


{include file='user/footer.tpl'}