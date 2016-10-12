{include file='header.tpl'}
<body class="page-brand">
	<header class="header header-brand ui-header">
		<span class="header-logo"></span>
	</header>
	{include file='nav.tpl'}
	<main class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-lg-push-4 col-sm-6 col-sm-push-3">
					<section class="content-inner margin-top-no">
						<nav class="tab-nav ui-tab">
							<ul class="nav nav-list">
								<li class="active">
									<a class="waves-attach waves-light" data-toggle="tab" href="#ui_tab_login"><span class="text-white">登陆/LOGIN</span></a>
								</li>
								<li>
									<a class="waves-attach waves-light" data-toggle="tab" href="#ui_tab_reg"><span class="text-white">注册/SIGNUP</span></a>
								</li>
							</ul>
						</nav>
						<div class="card" data-toggle="tab" href="#ui_tab_login">
							<div class="card-main">
								<div class="card-header">
									<div class="card-inner">
										<h1 class="card-heading">登陆与注册/Login or SighUP</h1>
									</div>
								</div>
								<div class="card-inner">
									<p class="text-center">
										<span class="avatar avatar-inline avatar-lg">
											<img alt="Login" src="../assets/md-interface/images/users/avatar-001.jpg">
										</span>
									</p>
									<form class="form" action="index.html">
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="login_email">用户名/Username</label>
													<input class="form-control" id="login_email" type="text">
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="login_password">密码/Password</label>
													<input class="form-control" id="login_password" type="password">
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<button class="btn btn-block btn-brand waves-attach waves-light" id="login">登陆/Sign In</button>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<div class="checkbox checkbox-adv">
														<label for="ui_login_remember">
															<input class="access-hide" id="ui_login_remember" name="ui_login_remember" type="checkbox">保持登陆/Stay signed in
															<span class="checkbox-circle"></span><span class="checkbox-circle-check"></span><span class="checkbox-circle-icon icon">done</span>
														</label>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="clearfix">
							<p class="margin-no-top pull-left"><a class="btn btn-flat btn-brand waves-attach" href="javascript:void(0)">Need help?</a></p>
							<p class="margin-no-top pull-right"><a class="btn btn-flat btn-brand waves-attach" href="javascript:void(0)">Create an account</a></p>
							</div>
						</div>
						<div class="card-inner" data-toggle="tab" href="#ui_tab_reg">
									<p class="text-center">
										<span class="avatar avatar-inline avatar-lg">
											<img alt="Login" src="../assets/md-interface/images/users/avatar-001.jpg">
										</span>
									</p>
									<form class="form" action="index.html">
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
													<input class="form-control" id="passwd" type="text">
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="repasswd">重复密码/Repeat password</label>
													<input class="form-control" id="repasswd" type="text">
												</div>
											</div>
										</div>
										<div class="form-group form-group-label">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<label class="floating-label" for="code">邀请码/Invitation code</label>
													<input class="form-control" id="code" value="{$code}" type="password">
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-md-10 col-md-push-1">
													<button class="btn btn-block btn-brand waves-attach waves-light" data-backdrop="static" data-toggle="modal" href="#ui_dialog_mailcheck">同意用户协议并下一步/Sign UP</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="clearfix">
							<p class="margin-no-top pull-left"><a class="btn btn-flat btn-brand waves-attach" href="javascript:void(0)">Need help?</a></p>
							<p class="margin-no-top pull-right"><a class="btn btn-flat btn-brand waves-attach" href="javascript:void(0)">Create an account</a></p>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
<footer class="ui-footer">
	<div class="container">
		<p>ss-panel-ssr</p>
	</div>
</footer>
<div class="fbtn-container">
	<div class="fbtn-inner">
		<a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light" data-toggle="dropdown"><span class="fbtn-text fbtn-text-left">Links</span><span class="fbtn-ori icon">apps</span><span class="fbtn-sub icon">close</span></a>
		<div class="fbtn-dropup">
			<a class="fbtn waves-attach waves-circle" href="https://github.com/Daemonite/material" target="_blank"><span class="fbtn-text fbtn-text-left">Fork me on GitHub</span><span class="icon">code</span></a>
			<a class="fbtn fbtn-brand waves-attach waves-circle waves-light" href="https://twitter.com/daemonites" target="_blank"><span class="fbtn-text fbtn-text-left">Follow Daemon on Twitter</span><span class="icon">share</span></a>
			<a class="fbtn fbtn-green waves-attach waves-circle" href="http://www.daemon.com.au/" target="_blank"><span class="fbtn-text fbtn-text-left">Visit Daemon Website</span><span class="icon">link</span></a>
		</div>
	</div>
</div>
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_mailcheck" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">邮箱验证</p>
			</div>
			<div class="modal-inner">
				<div class="form-group form-group-label">
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<label class="floating-label" for="verifycode">邮箱验证码/Mailbox Check code</label>
							<input class="form-control" id="verifycode" type="text">
						</div>
					</div>
				</div>
				<p class="h5 margin-top-sm text-black-hint">请将xxx.xxx添加到邮箱白名单。否则可能收不到验证码</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-brand-accent waves-attach waves-light" data-dismiss="modal">取消/Cancel</a><a class="btn btn-brand-accent waves-attach waves-light" id="sendcode">获取验证码/Recheck</a><a class="btn btn-brand-accent waves-attach waves-light" data-dismiss="modal" id="reg">继续/KeepGoing</a></p>
			</div>
		</div>
	</div>
</div>
<div aria-hidden="true" class="modal modal-va-middle fade" id="msg-success" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<h4>成功!</h4>
				<p class="h5 margin-top-sm text-black-hint" id="msg-success-p"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭/Discard</a></p>
			</div>
		</div>
	</div>
</div>
<div aria-hidden="true" class="modal modal-va-middle fade" id="msg-error" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<h4>成功!</h4>
				<p class="h5 margin-top-sm text-black-hint" id="msg-error-p"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭/Discard</a></p>
			</div>
		</div>
	</div>
</div>
<div style="display:none;">
    {$analyticsCode}
</div>
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script src="../assets/md-interface/js/base.min.js"></script>
<script src="../assets/md-interface/js/project.min.js"></script>

<script>
    $(document).ready(function(){
        function login(){
            $.ajax({
                type:"POST",
                url:"/auth/login",
                dataType:"json",
                data:{
                    email: $("#login_email").val(),
                    passwd: $("#login_passwd").val(),
                    remember_me: $("#login_remember_me").val()
                },
                success:function(data){
                    if(data.ret == 1){
                        $("#msg-error").hide(10);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/user'", 2000);
                    }else{
                        $("#msg-success").hide(10);
                        $("#msg-error").show(100);
                        $("#msg-error-p").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误："+jqXHR.status);
                }
            });
        }
        $("html").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        $("#login").click(function(){
            login();
        });
        $("#ok-close").click(function(){
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function(){
            $("#msg-error").hide(100);
        });
    })
</script>

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
                        $("#msg-error").hide(10);
                        $("#msg-success").show(100);
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/auth/login'", 2000);
                    } else {
                        $("#msg-success").hide(10);
                        $("#msg-error").show(100);
                        $("#msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
                    $("#msg-error-p").html("发生错误：" + jqXHR.status);
                }
            });
        }

        $("html").keydown(function (event) {
            if (event.keyCode == 13) {
                register();
            }
        });
        $("#reg").click(function () {
            register();
        });
        $("#sendcode").on("click", function () {
            var count = sessionStorage.getItem('email-code-count') || 0;
            var email = $("#email").val();
            var timer, countdown = 60, $btn = $(this);
            if (count > 3 || timer) return false;

            if (!email) {
                $("#msg-error").hide(10);
                $("#msg-error").show(100);
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
                        $("#msg-error").hide(10);
                        $("#msg-success").show(100);
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
                        $("#msg-success").hide(10);
                        $("#msg-error").show(100);
                        $("#msg-error-p").html(data.msg);
                        clearTimer();
                    }
                },
                error: function (jqXHR) {
                    $("#msg-error").hide(10);
                    $("#msg-error").show(100);
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
        $("#ok-close").click(function () {
            $("#msg-success").hide(100);
        });
        $("#error-close").click(function () {
            $("#msg-error").hide(100);
        });
    })
</script>


</body>
</html>