{include file='user/header.tpl'}
<script src=" /assets/public/js/jquery.qrcode.min.js "></script>
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
						<h1 class="content-heading">用户中心/DashBoard</h1>
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
									{$user_index_topmsg}
									<p>
										<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#ui_collapse_msg">
											<span class="collapsed-hide">收起公告</span>
											<span class="collapsed-show">展开公告</span>
										</a>
									</p>
									<div class="collapsible-region collapse" id="ui_collapse_msg">
										{$user_index_msg}
									</div>
								</div>
							</div>
						</div>
						<h3 class="h5">个人连接信息</h3>
						<div class="card">
							<div class="card-main">
								<div class="card-inner margin-bottom-no margin-top-no">
									<div class="card-table">
										<div class="table-responsive">
											<table class="table">
												<tbody>
													<tr>
														<td>端口:</td>
														<td>{$user->port}</td>
													</tr>
													<tr>
														<td>密码:</td>
														<td>{$user->passwd}</td>
													</tr>
													<tr>
														<td>自定义加密方式:</td>
														<td>{$user->method}</td>
													</tr>
													<tr>
														<td>自定义SSR连接协议:</td>
														<td>{$user->protocol}</td>
													</tr>
													<tr>
														<td>自定义SSR混淆方式:</td>
														<td>{$user->obfs}</td>
													</tr>
													<tr>
														<td>上次使用:</td>
														<td>{$user->lastSsTime()}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<h3 class="h5">流量与签到</h3>
						<div class="card">
							<div class="card-main">
								<div class="card-inner margin-bottom-no margin-top-no">
									<div class="card-table">
										<div class="table-responsive">
											<table class="table">
												<tbody>
													<tr>
														<td>总流量</td>
														<td>{$user->enableTraffic()}</td>
													</tr>
													<tr>
														<td>已用流量:</td>
														<td>{$user->usedTraffic()}</td>
													</tr>
													<tr>
														<td>剩余流量:</td>
														<td>{$user->unusedTraffic()}</td>
													</tr>
													<tr>
														<td>上次签到时间:</td>
														<td>{$user->lastCheckInTime()}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>										
			                        <p> 每{$config['checkinTime']}小时可以签到一次。</p>
									<p id="checkin-msg"></p>
								</div>
								<div class="card-action">
									<div class="card-action-btn pull-left">
										{if $user->isAbleToCheckin() }
				                            <a id="checkin" class="btn btn-brand waves-attach waves-light">签到</a>
				                        {else}
				                            <a class="btn btn-brand waves-attach waves-light disabled">不能签到</a>
				                        {/if}
									</div>
								</div>
							</div>
						</div>
						<h3 class="h5">節點列表</h3>
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<p class="card-heading"></p>
									<p>
										{$node_msg}
										<p>
											<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#ui_collapse_node">
												<span class="collapsed-hide">收起/Collapse</span>
												<span class="collapsed-show">展开/Expand</span>
											</a>
										</p>
									</p>
									<div class="collapsible-region collapse" id="ui_collapse_node">
									{foreach $nodes as $node}
										<div class="col-md-6 col-sm-6 margin-top">
											<div class="card">
												<div class="card-main">
													<div class="card-inner">
														<p class="card-heading">{$node->name}</p>
														<div class="card-table">
															<div class="table-responsive">
																<table class="table">
																	<tbody>
																		<tr>
																			<td>狀態</td>
																			<td>{$node->status}</td>
																		</tr>
																		<tr>
																			<td>在綫人數</td>
																			<td>{$node->getOnlineUserCount()}</td>
																		</tr>
																		<tr>
																			<td>流量比例</td>
																			<td>{$node->traffic_rate}</td>
																		</tr>
																		<tr>
																			<td>產生流量</td>
																			<td>{$node->getTrafficFromLogs()}</td>
																		</tr>
																		<tr>
																			<td>在綫時間</td>
																			<td>{$node->getNodeUptime()}</td>
																		</tr>
																		<tr>
																			<td>负载</td>
																			<td>{$node->getNodeLoad()}</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
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
			<a class="fbtn waves-attach waves-circle" href="https://github.com/lan894734188/ss-panel-ssr" target="_blank"><span class="fbtn-text fbtn-text-left">Fork me on GitHub</span><span class="icon">code</span></a>
			<a class="fbtn fbtn-brand waves-attach waves-circle waves-light" href="http://weibo.com/347898945" target="_blank"><span class="fbtn-text fbtn-text-left">Follow me on Weibo</span><span class="icon">share</span></a>
			<a class="fbtn fbtn-green waves-attach waves-circle" href="https://www.bydisk.com/" target="_blank"><span class="fbtn-text fbtn-text-left">Visit our Website</span><span class="icon">link</span></a>
		</div>
	</div>
</div>
<!-- ===node_info==== -->
{foreach $nodes as $node}
	<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_node_{$node->id}" role="dialog" tabindex="-3">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-heading">
					<p class="modal-title">{$node->name}</p>
				</div>
				<div class="modal-inner">
					<p class="h5 margin-top-sm text-black-hint">{$node->info}</p>
					<div class="card-table">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<td>地址</td>
										<td>{$node->server}</td>
									</tr>
									<tr>
										<td>端口</td>
										<td>{$user->port}</td>
									</tr>
									<tr>
										<td>加密</td>
										<td>{if $node->custom_method == 1} {$user->method} {else} {$node->method} {/if}</td>
									</tr>
									<tr>
										<td>SSR协议</td>
										<td>{$user->protocol}</td>
									</tr>
									<tr>
										<td>SSR混淆</td>
										<td>{$user->obfs}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<p class="text-right"><a id="node_sugre_{$node->id}" class="btn btn-flat btn-brand-accent waves-attach">Sugre</a><a id="node_qrcode_{$node->id}" class="btn btn-flat btn-brand-accent waves-attach">二维码</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭</a></p>
				</div>
				<script type="text/javascript">
					$(document).ready(function (){
						$("#node_qrcode_{$node->id}").click(function () {
							$.ajax({
								type: "POST",
								url: "/user/nodeqrcode/{$node->id}",
								dataType: "json",
								success: function (data) {
									if(data.ret) {
										//console.log(data)
										$("#ss-qr").empty();
										$("#ssurl").empty();
										$("#ui_dialog_qrcode").modal('show');
										$("#ssurl").html(data.ssqr);
										jQuery('#ss-qr').qrcode({
											"text": data.ssqr 
										});
									} else {
										$("#msg-error").modal('show');
				                        $("#msg-error-p").html(data.msg);
									}
								},
								error: function (jqXHR) {
									alert("发生错误：" + jqXHR.status);
								}
							})
						})
						$("#node_sugre_{$node->id}").click(function () {
							$.ajax({
								type: "POST",
								url: "/user/nodeqrcode/{$node->id}",
								dataType: "json",
								success: function (data) {
									if(data.ret) {
										//console.log(data)
										$("#surge-base-qr").empty();
										$("#surge-proxy-qr").empty();
										$("#surge-base").empty();
										$("#surge-proxy").empty();
										$("#ui_dialog_sugre").modal('show');
										$("#surge-base").html(data.surge_base);
										$("#surge-proxy").html(data.surge_proxy);
										jQuery('#surge-base-qr').qrcode({
											"text": data.surge_base 
										});
										jQuery('#surge-proxy-qr').qrcode({
											"text": data.surge_proxy 
										});
									} else {
										$("#msg-error").modal('show');
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
			</div>
		</div>
	</div>
{/foreach}

<!-- passwd_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_passwd" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">网站登陆密码修改</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">网站登陆密码修改</p>
				<div class="form-group form-group-label">
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<label class="floating-label" for="oldpwd">原密码</label>
							<input class="form-control" id="oldpwd" type="password">
						</div>
					</div>
				</div>
				<div class="form-group form-group-label">
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<label class="floating-label" for="pwd">新密码</label>
							<input class="form-control" id="pwd" type="password">
						</div>
					</div>
				</div>
				<div class="form-group form-group-label">
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<label class="floating-label" for="repwd">重复新密码</label>
							<input class="form-control" id="repwd" type="password">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">取消</a><a class="btn btn-flat btn-brand-accent waves-attach" id="pwd-update">提交</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- ss-passwd_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_ss-passwd" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">Shadowsocks连接密码修改</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">Shadowsocks连接密码修改</p>
				<div class="form-group form-group-label">
					<div class="row">
						<div class="col-md-10 col-md-push-1">
							<label class="floating-label" for="sspwd">新密码</label>
							<input class="form-control" id="sspwd" type="password">
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">取消</a><a class="btn btn-flat btn-brand-accent waves-attach" id="ss-pwd-update">确定</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- ss-method_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_method" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">加密方式修改</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">加密方式修改</p>
				<div class="form-group form-group-label">
				    <label class="floating-label" for="method"></label>
				    <select class="form-control" id="method">
				        <option value="{$user->method}"> 当前:{$user->method}</option>
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
				</div>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">取消</a><a class="btn btn-flat btn-brand-accent waves-attach" id="method-update">确定</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- ssr-protocol_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_ssrprotocol" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">SSR连接协议修改</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">SSR连接协议修改</p>
				<div class="form-group form-group-label">
				    <label class="floating-label" for="SSRProtocol"></label>
				    <select class="form-control" id="SSRProtocol">
				        <option value="{$user->protocol}">当前:{$user->protocol}</option>
                        <option value="origin">origin原版协议</option>
                        <option value="verify_simple">verify_simple(不兼容原版)</option>
                        <option value="verify_deflate">verify_deflate(不兼容原版)</option>
                        <option value="verify_sha1_compatible">verify_sha1(兼容原版)</option>
                        <option value="auth_sha1_compatible">auth_sha1(兼容原版)</option>
                        <option value="auth_sha1_v2_compatible">auth_sha1_v2(兼容原版)</option>
                        <option value="auth_sha1_v3_compatible">auth_sha1_v3(兼容原版)</option>
                        <option value="auth_sha1_v4_compatible">auth_sha1_v4(兼容原版)</option>
                        <option value="auth_aes128_md5_compatible">auth_aes128_md5(兼容原版)</option>
                        <option value="auth_aes128_sha1_compatible">auth_aes128_sha1(兼容原版)</option>
				    </select>
				</div>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">取消</a><a class="btn btn-flat btn-brand-accent waves-attach" id="SSRProtocol-update">确定</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- ssr-obfs_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_ssrobfs" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">SSR混淆方式修改</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">SSR混淆方式修改</p>
				<div class="form-group form-group-label">
				    <label class="floating-label" for="SSRobfs"></label>
				    <select class="form-control" id="SSRobfs">
				        <option value="{$user->obfs}">当前:{$user->obfs}</option>
                        <option value="plain">plain无混淆</option>
                        <option value="http_simple_compatible">http_simple(兼容原版)</option>
                        <option value="http_post_compatible">http_post(兼容原版)</option>
                        <option value="tls1.2_ticket_auth_compatible">tls1.2_ticket_auth(兼容原版)</option>
				    </select>
				</div>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">取消</a><a class="btn btn-flat btn-brand-accent waves-attach" id="SSRobfs-update">确定</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- trafficlog_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_trafficlog" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">流量记录</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">流量记录还没好</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- kill-account_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_kill-account" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">彻底删除账户</p>
			</div>
			<div class="modal-inner">
				<from class="from">
					<div class="form-group form-group-label">
						<div class="row">
							<div class="col-md-10 col-md-push-1">
								<label class="floating-label" for="pass_kill">请输入密码</label>
								<input class="form-control" id="pass_kill" type="password">
							</div>
						</div>
					</div>
				</from>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭</a><a class="btn btn-flat btn-brand-accent waves-attach" id="kill">确定</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- Invitation_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_inv" role="dialog" tabindex="-2">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">邀请码</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">邀请码还没好</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- ss-qrcode_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_qrcode" role="dialog" tabindex="-2">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">二维码</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">Shadowsocks二维码</p>
				<small id="ssurl"></small>
				<div id="ss-qr"></div>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->

<!-- sugre_qrcode_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_sugre" role="dialog" tabindex="-2">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">SUGRE连接信息</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">基础配置二维码</p>
				<small id="surge-base"></small>
				<div id="surge-base-qr"></div>
				<br/>
				<p class="h5 margin-top-sm text-black-hint">代理配置二维码</p>
				<small id="surge-proxy"></small>
				<div id="surge-proxy-qr"></div>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->


<!-- msg_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="msg-success" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<h4>成功/Success</h4>
				<p class="h5 margin-top-sm text-black-hint" id="msg-success-p"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="ok-close">关闭/Discard</a></p>
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
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="error-close">关闭/Discard</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ... -->



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


<script>
    $(document).ready(function () {
        $("#pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/password",
                dataType: "json",
                data: {
                    oldpwd: $("#oldpwd").val(),
                    pwd: $("#pwd").val(),
                    repwd: $("#repwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-error").modal('hide');
                        $("#msg-success").modal('show');
                        $("#msg-success-p").html(data.msg);
                    } else {
                        $("#msg-error").modal('show');
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
                url: "/user/sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").modal('show');
                        $("#msg-success-p").html(data.msg);
                    } else {
                        $("#msg-error").modal('show');
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
        $("#method-update").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/method",
                dataType: "json",
                data: {
                    method: $("#method").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").modal('show');
                        $("#msg-success-p").html(data.msg);
                    } else {
                        $("#msg-error").modal('show');
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
        $("#SSRProtocol-update").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/SSRProtocol",
                dataType: "json",
                data: {
                    SSRProtocol: $("#SSRProtocol").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").modal('show');
                        $("#msg-success-p").html(data.msg);
                    } else {
                        $("#msg-error").modal('show');
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
<script type="text/javascript">
	
</script>


<script>
    $(document).ready(function () {
        $("#SSRobfs-update").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/SSRobfs",
                dataType: "json",
                data: {
                    SSRobfs: $("#SSRobfs").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-success").modal('show');
                        $("#msg-success-p").html(data.msg);
                    } else {
                        $("#msg-error").modal('show');
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
        $("#kill").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/kill",
                dataType: "json",
                data: {
                    passwd: $("#pass_kill").val(),
                },
                success: function (data) {
                    if (data.ret) {
                        //$("#msg-error").hide();
                        $("#msg-success").modal('show');
                        $("#msg-success-p").html(data.msg);
                        window.setTimeout("location.href='/'", 2000);
                    } else {
                        $("#msg-error").modal('show');
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

<script type="text/javascript">
	$("#ok-close").click(function () {
        window.location.reload();
    });
    $("#error-close").click(function () {
        window.location.reload();
    });
</script>



<div style="display:none;">
    {$analyticsCode}
</div>
</body>
</html>


















