{include file='header.tpl'}
<body class="page-pink">
	<header class="header header-pink ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</li>
		</ul>
		<span class="header-logo"></span>
	</header>
	{include file='nav.tpl'}
	<main class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner">
						<div class="card">
							<div class="card-main">
								<div class="card-header">
									<div class="card-inner">
										<h1 class="card-heading">注册 / SIGN UP</h1>
									</div>
								</div>
								<div class="card-inner">
									<p class="text-center">
										<span class="avatar avatar-inline avatar-lg">
											<img alt="Login" src="{if $CDNType}{$CDNDomain}{else}..{/if}/assets/md-interface/images/users/avatar-001.jpg">
										</span>
									</p>
									<p class="text-center"></p>
									<form class="form">
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="name">名称/Name</label>
													<input class="form-control" id="name" type="text">
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="email">邮箱/E-Mail</label>
													<input class="form-control" id="email" type="text">
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="passwd">密码/Password</label>
													<input class="form-control" id="passwd" type="password">
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="repasswd">重复密码/Repeat password</label>
													<input class="form-control" id="repasswd" type="password">
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="code">邀请码/Invitation code</label>
													<input class="form-control" id="code" value="{$code}" type="text">
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													{if $requireEmailVerification}
													<a class="btn btn-block btn-pink waves-attach waves-light" data-backdrop="static" data-toggle="modal" href="#ui_dialog_mailcheck">下一步/NextStep</a>
													{else}
													<a class="btn btn-block btn-pink waves-attach waves-light" data-backdrop="static" data-toggle="modal" href="#ui_dialog_tos">下一步/NextStep</a>
													{/if}
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="clearfix">
							<p class="margin-no-top pull-left"><a class="btn btn-pink waves-attach" href="/password/reset">忘记密码?</a></p>
							<p class="margin-no-top pull-right"><a class="btn btn-pink waves-attach" href="/auth/login">已有账号</a></p>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
	<footer class="ui-footer">
		<div class="container">
			<p>SS-Panel-SSR</p>
		</div>
	</footer>
{if $requireEmailVerification}
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_mailcheck" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">邮箱验证</p>
			</div>
			<div class="modal-inner">
				<div class="form-group form-group-label">
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<label class="floating-label" for="verifycode">邮箱验证码/Mailbox Check</label>
							<input class="form-control" id="verifycode" type="text">
						</div>
					</div>
				</div>
				<p class="h5 margin-top-sm text-black-hint">请将{$emaildomain}添加到邮箱白名单。否则可能收不到验证码</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-pink waves-attach waves-effect" data-dismiss="modal">取消/Cancel</a></p>
				<p class="text-right"><a class="btn btn-pink waves-attach waves-effect" id="sendcode">获取验证码/GetCode</a></p>
				<p class="text-right"><a class="btn btn-pink waves-attach waves-light" data-dismiss="modal" id="mail_Continue">继续/Continue</a></p>
			</div>
		</div>
	</div>
</div>
{/if}
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_tos" role="dialog" tabindex="-2">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">用户协议 / TOS</p>
			</div>
			<div class="modal-inner margin-top-no margin-bottom-no">
				<div class="form-group form-group-label margin-top-no margin-bottom-no">
					<div class="row">
						<div class="col-md-10 col-md-push-1" style="height: 300px;overflow: scroll;">>
							{include file='tosbody.tpl'}
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-pink waves-attach waves-effect" data-dismiss="modal" id="tos_calcel">取消/Cancel</a>&nbsp;<a class="btn btn-pink waves-attach waves-light" data-dismiss="modal" id="reg">继续/Continue</a></p>
			</div>
		</div>
	</div>
</div>

<div aria-hidden="true" class="modal modal-va-middle fade" id="msg-success" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<h4>成功/Success</h4>
				<p class="h5 margin-top-sm text-black-hint" id="msg-success-p"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-pink waves-attach waves-effect" data-dismiss="modal">关闭/Discard</a></p>
			</div>
		</div>
	</div>
</div>
<div aria-hidden="true" class="modal modal-va-middle fade" id="msg-error" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<h4>失败/Error</h4>
				<p class="h5 margin-top-sm text-black-hint" id="msg-error-p"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-pink waves-attach waves-effect" data-dismiss="modal">关闭/Discard</a></p>
			</div>
		</div>
	</div>
</div>

	<!-- js -->
	<script src="https://ajax-googleapis.cdn.bydisk.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="../assets/md-interface/js/base.min.js"></script>
	<script src="../assets/md-interface/js/project.min.js"></script>

<div style="display:none;">
    {$analyticsCode}
</div>


<script>
    $(document).ready(function () {
        function register() {
            $.ajax({
                type: "POST",
                url: "/auth/register",
                dataType: "json",
                data: {
                    email: $("#email").val(),
                    name: $("#name").val(),
                    passwd: $("#passwd").val(),
                    repasswd: $("#repasswd").val(),
                    code: $("#code").val(),
                    verifycode: $("#verifycode").val(),
                    agree: $("#agree").val()
                },
                success: function (data) {
                    if (data.ret == 1) {
                        $("#msg-error").modal("hide");
                        $("#msg-success").modal("show");
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/auth/login'", 2000);
                    } else {
                        $("#msg-success").modal("hide");
                        $("#msg-error").modal("show");
                        $("#msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#msg-error").modal("hide");
                    $("#msg-error").modal("show");
                    $("#msg-error-p").html("发生错误：" + jqXHR.status);
                }
            });
        }
        $("#reg").click(function () {
            register();
        });
        $("#sendcode").on("click", function () {
            var count = sessionStorage.getItem('email-code-count') || 0;
            var email = $("#email").val();
            var timer, countdown = 60, $btn = $(this);
            if (count > 3 || timer) return false;

            if (!email) {
                $("#msg-error").modal("hide");
                $("#msg-error").modal("show");
                $("#msg-error-p").html("请先填写邮箱!");
                return $("#email").focus();
            }

            $.ajax({
                type: "POST",
                url: "/auth/sendcode",
                dataType: "json",
                data: {
                    email: email
                },
                success: function (data) {
                    if (data.ret == 1) {
                        $("#msg-error").modal("hide");
                        $("#msg-success").modal("show");
                        $("#msg-success-p").html(data.msg);
                        timer = setInterval(function () {
                            --countdown;
                            if (countdown) {
                                $btn.text('重新发送 (' + countdown + '秒)');
                            } else {
                                clearTimer();
                            }
                        }, 1000);
                    } else {
                        $("#msg-success").modal("hide");
                        $("#msg-error").modal("show");
                        $("#msg-error-p").html(data.msg);
                        clearTimer();
                    }
                },
                error: function (jqXHR) {
                    $("#msg-error").modal("hide");
                    $("#msg-error").modal("show");
                    $("#msg-error-p").html("发生错误：" + jqXHR.status);
                    clearTimer();
                }
            });
            $btn.addClass("disabled").prop("disabled", true).text('发送中...');
            $("#verifycode").select();
            function clearTimer() {
                $btn.text('重新发送').removeClass("disabled").prop("disabled", false);
                clearInterval(timer);
                timer = null;
            }
        });
        $("#mail_Continue").click(function () {
            $("#ui_dialog_tos").modal("show");
        });
        $("#tos_calcel").click(function () {
            $("#ui_dialog_tos").modal("hide");
        });
    })
</script>

</body>
</html>
