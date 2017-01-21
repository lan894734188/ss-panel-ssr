{include file='user/header.tpl'}

<body class="page-pink">
<header class="header header-pink header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</li>
		</ul>
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a data-toggle="menu" href="#ui_menu_profile">
					<span class="padding-right">{$user->user_name}</span>
					<span class="avatar avatar-sm"><img alt="User Image" src="{$user->gravatar}"></span>
				</a>
			</li>
		</ul>
	</header>
{include file='nav.tpl'}
{include file='user/user_nav.tpl'}
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
						<h1 class="content-heading">邀请/Invite</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
					<section class="content-inner margin-top-no">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<p>当前您可以生成<code>{$user->invite_num}</code>个邀请码。 </p>
									<br>
									{if $user->invite_num }
			                            <button id="invite" class="btn btn-brand waves-attach waves-light">生成我的邀请码</button>
			                        {/if}
									<br>
									<ul>
										<li>用户注册48小时后，才可以生成邀请码。</li>

						                <li>邀请码请给认识的需要的人。</li>

						                <li>邀请有记录，若被邀请的人违反用户协议，您将会有连带责任。</li>

						                <li>邀请码暂时无法购买，请珍惜。</li>

						                <li>公共页面不定期发放邀请码，如果用完邀请码可以关注公共邀请.</li>
									</ul>
									<p>
										<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#ui_collapse_msg">
											<span class="collapsed-hide">收起表格/Close</span>
											<span class="collapsed-show">展开表格/Open</span>
										</a>
									</p>
									<div class="collapsible-region collapse" id="ui_collapse_msg">
										<div class="table-responsive">
											<p>我的邀请码</p>
					                        <table class="table table-striped">
					                            <thead>
					                            <tr>
					                                <th>###</th>
					                                <th>邀请码(点右键复制链接)</th>
					                                <th>状态</th>
					                            </tr>
					                            </thead>
					                            <tbody>
					                            {foreach $codes as $code}
					                                <tr>
					                                    <td><b>{$code->id}</b></td>
					                                    <td><a href="/auth/register?code={$code->code}" target="_blank">{$code->code}</a>
					                                    </td>
					                                    <td>可用</td>
					                                </tr>
					                            {/foreach}
					                            </tbody>
					                        </table>
					                    </div>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
{include file='user/footer.tpl'}

<script>
    $(document).ready(function () {
        $("#invite").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/invite",
                dataType: "json",
                success: function (data) {
                    window.location.reload();
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>
