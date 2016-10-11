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
		<!-- <a class="header-logo margin-left-no" href="/">Menu</a> -->
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
					<span class="access-hide">John Smith</span>
					<span class="avatar avatar-sm"><img alt="alt text for John Smith avatar" src="../assets/md-interface/images/users/avatar-001.jpg"></span>
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
						<a class="padding-right-lg waves-attach" href="/auth/login"><span class="icon icon-lg margin-right">people</span>登陆用户中心</a>
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
						<h1 class="content-heading">Material</h1>
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
									<p>Daemonite's Material UI is a fully responsive, cross-platform, front-end interface based on Google Material Design. This lightweight framework is built in HTML5 using Bootstrap, JS and CSS.</p>
									<blockquote>A visual language for our users that synthesizes the classic principles of good design with the innovation and possibility of technology and science. This is material design.<sup class="margin-left-xs"><a href="http://www.google.com/design/spec/material-design/introduction.html" target="_blank"><span class="icon">open_in_new</span></a></sup></blockquote>
									<p>Have a play with this working prototype of Material, let us know what you think at the <a href="http://labs.daemon.com.au" target="_blank">Daemon Labs<sup class="margin-left-xs"><span class="icon">open_in_new</span></sup></a> forum.</p>
								</div>
							</div>
						</div>
						<h2 class="content-sub-heading">Components</h2>
						<p>Below are components that have been defined by Material Design Guidelines. For more information, please visit <a href="https://www.google.com/design/spec/components/buttons.html" target="_blank">Material Design Guidelines<sup class="margin-left-xs"><span class="icon">open_in_new</span></sup></a>.</p>
						<div class="tile-wrap">
							<a class="tile waves-attach" href="ui-button.html">
								<div class="tile-inner">
									<span class="text-black">Buttons</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-button-fab.html">
								<div class="tile-inner">
									<span class="text-black">Buttons <small>(Floating Action Button)</small></span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-card.html">
								<div class="tile-inner">
									<span class="text-black">Cards</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-data-table.html">
								<div class="tile-inner">
									<span class="text-black">Data Tables</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-dialog.html">
								<div class="tile-inner">
									<span class="text-black">Dialogs</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-dropdown-menu.html">
								<div class="tile-inner">
									<span class="text-black">Menus</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-nav-drawer.html">
								<div class="tile-inner">
									<span class="text-black">Navigation Drawers</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-picker.html">
								<div class="tile-inner">
									<span class="text-black">Pickers</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-progress.html">
								<div class="tile-inner">
									<span class="text-black">Progress</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-selection-control.html">
								<div class="tile-inner">
									<span class="text-black">Selection Controls</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-snackbar.html">
								<div class="tile-inner">
									<span class="text-black">Snackbars</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-stepper.html">
								<div class="tile-inner">
									<span class="text-black">Steppers</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-tab.html">
								<div class="tile-inner">
									<span class="text-black">Tabs</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-text-field.html">
								<div class="tile-inner">
									<span class="text-black">Text Fields</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-toolbar.html">
								<div class="tile-inner">
									<span class="text-black">Toolbars</span>
								</div>
							</a>
						</div>
						<h2 class="content-sub-heading">Extras</h2>
						<p>These components have not been specifically defined by Material Design Guidelines, but are used in some Google apps and/or sites.</p>
						<div class="tile-wrap">
							<a class="tile waves-attach" href="ui-avatar.html">
								<div class="tile-inner">
									<span class="text-black">Avatars</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-icon.html">
								<div class="tile-inner">
									<span class="text-black">Icons</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-label.html">
								<div class="tile-inner">
									<span class="text-black">Labels</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-nav.html">
								<div class="tile-inner">
									<span class="text-black">Navs</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-tile.html">
								<div class="tile-inner">
									<span class="text-black">Tiles</span>
								</div>
							</a>
						</div>
						<h2 class="content-sub-heading">Javascript</h2>
						<p>Material includes several Bootstrap's Javascript plugins, <code>affix</code>, <code>collapse</code>, <code>dropdown</code>, <code>modal</code> &amp; <code>tab</code>, to be specific. For more information, please visit <a href="http://getbootstrap.com/javascript/" target="_blank">Bootstrap Documentation Site<sup class="margin-left-xs"><span class="icon">open_in_new</span></sup></a>.</p>
						<div class="tile-wrap">
							<a class="tile waves-attach" href="ui-affix.html">
								<div class="tile-inner">
									<span class="text-black">Affix</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-collapse.html">
								<div class="tile-inner">
									<span class="text-black">Collapse</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-dropdown-menu.html">
								<div class="tile-inner">
									<span class="text-black">Dropdown</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-modal.html">
								<div class="tile-inner">
									<span class="text-black">Modals</span>
								</div>
							</a>
							<a class="tile waves-attach" href="ui-tab.html">
								<div class="tile-inner">
									<span class="text-black">Togglable Tabs</span>
								</div>
							</a>
						</div>
						<h2 class="content-sub-heading">Sample Pages</h2>
						<p>Here are some sample webpages built with Material.</p>
						<div class="tile-wrap">
							<a class="tile waves-attach" href="page-login.html">
								<div class="tile-inner">
									<span class="text-black">Login Page</span>
								</div>
							</a>
							<a class="tile waves-attach" href="page-picker.html">
								<div class="tile-inner">
									<span class="text-black">Picker Page</span>
								</div>
							</a>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
{include file='footer.tpl'}