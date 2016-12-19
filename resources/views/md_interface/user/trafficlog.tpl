{include file='user/header.tpl'}
<head>
.pagination li{
    background-image: none;
    background-position: 50% 50%;
    background-size: 100% 100%;
    border: 0;
    border-radius: 2px;
    box-shadow: 0 1px 3px rgba(0,0,0,.15), 0 1px 3px 1px rgba(0,0,0,.15);
    color: inherit;
    cursor: pointer;
    display: inline-block;
    margin-bottom: 0;
    max-width: 100%;
    padding: 8px;
    text-transform: uppercase;
    user-select: none;
    background-color: transparent;
    box-shadow: none;
}
</head>
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
					<h1 class="content-heading">连接/流量记录/TrafficLog</h1>
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
								<p>部分节点不支持流量记录.</p>
								<p>
									<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#ui_collapse_msg">
										<span class="collapsed-hide">收起表格/Close</span>
										<span class="collapsed-show">展开表格/Open</span>
									</a>
								</p>
								<div class="collapsible-region collapse" id="ui_collapse_msg">
									<div class="table-responsive">
				                        {$logs->render()}
				                        <table class="table table-hover">
				                            <tr>
				                                <th>ID</th>
				                                <th>使用节点</th>
				                                <th>倍率</th>
				                                <th>实际使用流量</th>
				                                <th>结算流量</th>
				                                <th>记录时间</th>
				                            </tr>
				                            {foreach $logs as $log}
				                                <tr>
				                                    <td>#{$log->id}</td>
				                                    <td>{$log->node()->name}</td>
				                                    <td>{$log->rate}</td>
				                                    <td>{$log->totalUsed()}</td>
				                                    <td>{$log->traffic}</td>
				                                    <td>{$log->logTime()}</td>
				                                </tr>
				                            {/foreach}
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
