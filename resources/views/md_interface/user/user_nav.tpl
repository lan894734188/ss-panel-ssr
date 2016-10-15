<nav aria-hidden="true" class="menu menu-right" id="ui_menu_profile" tabindex="-1">
	<div class="menu-scroll">
		<div class="menu-top">
			<div class="menu-top-img">
				<img alt="John Smith" src="../images/samples/landscape.jpg">
			</div>
			<div class="menu-top-info">
				<a class="menu-top-user" href="javascript:void(0)"><span class="avatar avatar-inline margin-right"><img alt="alt text for John Smith avatar" src="{$user->gravatar}"></span>{$user->user_name}</a>
			</div>
			<div class="menu-top-info-sub">
				<small>欢迎回来{$user->user_name}</small>
			</div>
		</div>
		<div class="menu-content">
			<ul class="nav">
				<li>
					<a class="waves-attach" href="javascript:void(0)">
						Profile Settings
						<span class="menu-collapse-toggle collapsed waves-attach" data-target="#ui_menu_profile_settings" data-toggle="collapse">
							<div class="menu-collapse-toggle-close">
								<i class="icon icon-lg">close</i>
							</div>
							<div class="menu-collapse-toggle-default">
								<i class="icon icon-lg">apps</i>
							</div>
						</span>
					</a>
					<ul class="menu-collapse collapse" id="ui_menu_profile_settings">
						<li>
							<a class="waves-attach" href="javascript:void(0)">First Item</a>
						</li>
						<li>
							<a class="waves-attach" href="javascript:void(0)">Another Item</a>
						</li>
						<li>
							<a class="waves-attach" href="javascript:void(0)">Something Else</a>
						</li>
					</ul>
				</li>
				<li>
					<a class="waves-attach" href="javascript:void(0)">Upload Photo</a>
				</li>
				<li>
					<a class="waves-attach" href="page-login.html">Logout</a>
				</li>
			</ul>
		</div>
	</div>
</nav>