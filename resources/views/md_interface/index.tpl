{include file='header.tpl'}
<body class="page-pink">
	<header class="header header-pink header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</li>
		</ul>
		<!-- <a class="header-logo margin-left-no" href="/">Menu</a> -->
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
					{if $user->isLogin}
					<span class="padding-right">{$user->user_name}</span>
					<span class="avatar avatar-sm"><img alt="User Image" src="{$user->gravatar}"></span>
					{else}
					<span class="access-hide"></span>
					<span class="avatar avatar-sm"><img alt="User Image" src="{if $CDNType}{$CDNDomain}{else}..{/if}/assets/md-interface/images/users/avatar-001.jpg"></span>
					{/if}
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					{if $user->isLogin}
					<li>
						<a class="padding-right-lg waves-attach" href="/user"><span class="icon icon-lg margin-right">account_box</span>进入用户中心</a>
					</li>
					{else}
					<li>
						<a class="padding-right-lg waves-attach" href="/auth/register"><span class="icon icon-lg margin-right">lightbulb_outline</span>加入我们</a>
					</li>
					<li>
						<a class="padding-right-lg waves-attach" href="/auth/login"><span class="icon icon-lg margin-right">people</span>登陆</a>
					</li>
					{/if}
				</ul>
			</li>
		</ul>
	</header>
{include file='nav.tpl'}
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
						<h1 class="content-heading"><img src="">{$config["appName"]}</h1>
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
									<h3 class="h5 margin-bottom-no margin-top-no"><p class="card-heading">公告 / Announcement</p></h3>
									{$msg}
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-main">
								<div class="card-header">
									<div class="card-inner">
										<h3 class="h5 margin-bottom-no margin-top-no">快速链接 / Quick Links</h3>
									</div>
								</div>
								<div class="card-inner">
									<p class="margin-top-no">
										<a class="btn btn-pink waves-attach" href="/auth/login" target="_blank">登陆/Login</a>&nbsp;&nbsp;&nbsp;
										<a class="btn btn-pink waves-attach" href="/auth/register" target="_blank">注册/SignUP</a>&nbsp;&nbsp;&nbsp;
										<a class="btn btn-pink waves-attach" href="/tos" target="_blank">用户协议/TOS</a>&nbsp;&nbsp;&nbsp;
										<a class="btn btn-pink waves-attach" href="https://github.com/lan894734188" target="_blank">Github</a>
									</p>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-main">
								<div class="card-inner margin-bottom-no">
									<p class="card-heading">邀请码/Invitation code</p>
									<div class="card-table">
										<div class="table-responsive">
											<table class="table" title="A table within a card">
												<thead>
							                        <tr>
							                            <th>###</th>
							                            <th>邀请码 (点击邀请码进入注册页面)</th>
							                            <th>状态</th>
							                        </tr>
						                        </thead>
												<tbody>
						                        {foreach $codes as $code}
						                            <tr>
						                                <td>{$code->id}</td>
						                                <td><a href="/auth/register?code={$code->code}">{$code->code}</a></td>
						                                <td>可用</td>
						                            </tr>
						                        {/foreach}
						                        </tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="card-action">
									<div class="card-action-btn pull-right">
										<a class="btn btn-flat waves-attach" href="javascript:void(0)"><span class="icon">chevron_left</span></a>
										<a class="btn btn-flat waves-attach" href="javascript:void(0)"><span class="icon">chevron_right</span></a>
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
{include file='footer.tpl'}
