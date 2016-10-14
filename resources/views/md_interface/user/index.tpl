{include file='header.tpl'}
<body class="page-brand">
<header class="header header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</li>
		</ul>
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
					<span class="padding-right">{$user->user_name}</span>
					<span class="avatar avatar-sm"><img alt="User Image" src="{$user->gravatar}"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li>
						<a class="padding-right-lg waves-attach" href="/user/logout"><span class="icon icon-lg margin-right">eject</span>登出/Logout</a>
					</li>
				</ul>
			</li>
		</ul>
	</header>
{include file='nav.tpl'}
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">UserInterface</h1>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2">
					<section class="content-inner margin-top-no">
						<div class="col-lg-8 col-md-9">
							<div class="card margin-bottom-no">
								<div class="card-main">
									<div class="card-inner">
										<p>
											<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#ui_collapse_msg">
												<span class="collapsed-hide">Collapse</span>
												<span class="collapsed-show">Expand</span>
											</a>
										</p>
										<div class="collapsible-region collapse" id="ui_collapse_msg">
											{$user_index_msg}
										</div>
									</div>
								</div>
							</div>
						</div>
						<h3 class="h5">Colour Palettes</h3>
						<div class="ui-card-wrap">
							<div class="col-md-4 col-sm-6">
								<div class="card">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">用户信息</p>
											<p>
												用户名:{$user->user_name}<br>
												邮箱:{$user->email}<br>
												加入时间:<code>{$user->regDate()}</code><br>
											</p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a class="btn waves-attach" href="javascript:void(0)">修改个人信息</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-6">
								<div class="card">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">个人连接信息</p>
											<p>
					                            端口:{$user->port}<br>
					                            密码:{$user->passwd}<br>
					                            自定义加密方式:<br>{$user->method}<br>
					                            自定义SSR连接协议:<br>{$user->protocol}<br>
					                            自定义SSR混淆方式:<br>{$user->obfs}<br>
					                            上次使用:<code>{$user->lastSsTime()}</code>
					                        </p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a class="btn waves-attach" href="javascript:void(0)">修改连接信息</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-6">
								<div class="card">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">流量与签到</p>
											<dl class="dl-horizontal">
					                            <dt>总流量</dt>
					                            <dd>{$user->enableTraffic()}</dd>
					                            <dt>已用流量</dt>
					                            <dd>{$user->usedTraffic()}</dd>
					                            <dt>剩余流量</dt>
					                            <dd>{$user->unusedTraffic()}</dd>
					                        </dl>
					                        <p> 每{$config['checkinTime']}小时可以签到一次。</p>
											<p>上次签到时间：<code>{$user->lastCheckInTime()}</code></p>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												{if $user->isAbleToCheckin() }
						                            <a id="checkin" class="btn waves-attach btn-flat">签到</a>
						                        {else}
						                            <a class="btn waves-attach disabled" href="#">不能签到</a>
						                        {/if}
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<h3 class="h5"></h3>
						<div class="ui-card-wrap">
							<div class="col-lg-12 col-md-12">
								<div class="card">
									<div class="card-main">
										<div class="card-inner">
											<p class="card-heading">節點列表</p>
											<p>
												Lorem ipsum dolor sit amet.<br>
												{$node_msg}<br>
												<p>
													<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#ui_collapse_node">
														<span class="collapsed-hide">展开/Collapse</span>
														<span class="collapsed-show">收起/Expand</span>
													</a>
												</p>
											</p>
											<div class="collapsible-region collapse" id="ui_collapse_node">
											{foreach $nodes as $node}
												<div class="col-md-4 col-sm-6 margin-top">
													<div class="card">
														<div class="card-main">
															<div class="card-inner">
																<p class="card-heading">{$node->name}</p>
																<p>
																	狀態/Status:{$node->status}<br>
																	在綫人數/Online:{$node->getOnlineUserCount()}<br>
																	流量比例/Traffic Rate:{$node->traffic_rate}<br>
																	產生流量/Traffic Data:{$node->getTrafficFromLogs()}<br>
																	在綫時間/Uptime:{$node->getNodeUptime()}<br>
																	负载:{$node->getNodeLoad()}
																</p>
															</div>
															<div class="card-action">
																<div class="card-action-btn pull-left">
																	<a class="btn btn-flat waves-attach" data-backdrop="static" data-toggle="modal" href="#ui_dialog_node_{$node->id}">详细信息/More</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											{/foreach}
											</div>
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
<footer class="ui-footer">
	<div class="container">
		<p>SS-Panel-SSR</p>
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
<!-- ===node_info==== -->
{foreach $nodes as $node}
	<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_node_{$node->id}" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-heading">
					<p class="modal-title">{$node->name}</p>
				</div>
				<div class="modal-inner">
					<p class="h5 margin-top-sm text-black-hint">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
					<p>
						{$node->info}<br>
						<br>
						地址/Address:{$node->server}<br>
						端口/Port:{$node->port}<br>
						加密/Method:{if $node->custom_method == 1} {$user->method} {else} {$node->method} {/if}<br>
						SSR协议/SSR-Protocol:{$node->status}<br>
						SSR混淆/SSR-obfs:{$node->status}<br>
					<br>
					</p>
				</div>
				<div class="modal-footer">
					<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Disagree</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Agree</a></p>
				</div>
			</div>
		</div>
	</div>
{/foreach}











<div style="display:none;">
    {$analyticsCode}
</div>
<!-- js -->
<script src="https://cdn.bootcss.com/jquery/2.2.0/jquery.min.js"></script>
<script src="../assets/md-interface/js/base.min.js"></script>
<script src="../assets/md-interface/js/project.min.js"></script>

<script>
    $(document).ready(function () {
        $("#checkin").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>













</body>
</html>


















