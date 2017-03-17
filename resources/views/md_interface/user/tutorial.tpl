{include file='user/header.tpl'}
<html>
<body>
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
                    <h1 class="content-heading">使用教程/Tutorial</h1>
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
                            <ul id="myTab" class="nav nav-justified">
                                <li class="active">
                                    <a href="#windows" data-toggle="tab">
                                        windows
                                    </a>
                                </li>
                                <li>
                                    <a href="#ios" data-toggle="tab">
                                        ios
                                    </a>
                                </li>
                                <li>
                                    <a href="#andriod" data-toggle="tab">
                                        andriod
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>
            </div>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="windows">
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <ul>
                                <li><p>进入用户中心 记得在新窗口中打开<a href="/user">点我进入</a></p></li>
                                <li>滚动网页到最底部,找到节点列表,点击展开</li>
                                <li><img src="../assets/md-interface/images/tutorial/01.jpg"></li>
                                <li>点击节点的详细信息</li>
                                <li><img src="../assets/md-interface/images/tutorial/02.jpg"></li>
                                <li>会弹出一个对话框 点击中间的SSR二维码</li>
                                <li><img src="../assets/md-interface/images/tutorial/03.png"></li>
                                <li>这样屏幕上就会出现二维码, 千万别点关闭, 也不要用其他窗口遮住这个二维码</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="ios">
                    <div class="col-md-12 column">
                        <ul>
                            <li><p>进入用户中心 记得在新窗口中打开<a href="/user">点我进入</a></p></li>
                            <li>滚动网页到最底部,找到节点列表,点击展开</li>
                            <li><img src="../assets/md-interface/images/tutorial/01.jpg"></li>
                            <li>点击节点的详细信息</li>
                            <li><img src="../assets/md-interface/images/tutorial/02.jpg"></li>
                            <li>会弹出一个对话框 点击中间的SSR二维码</li>
                            <li><img src="../assets/md-interface/images/tutorial/03.png"></li>
                            <li>这样屏幕上就会出现二维码, 千万别点关闭, 也不要用其他窗口遮住这个二维码</li>
                        </ul>
                    </div>
                </div>
                <div class="tab-pane fade" id="andriod">
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <ul>
                                <li><p>进入用户中心 记得在新窗口中打开<a href="/user">点我进入</a></p></li>
                                <li>滚动网页到最底部,找到节点列表,点击展开</li>
                                <li><img src="../assets/md-interface/images/tutorial/01.jpg"></li>
                                <li>点击节点的详细信息</li>
                                <li><img src="../assets/md-interface/images/tutorial/02.jpg"></li>
                                <li>会弹出一个对话框 点击中间的SSR二维码</li>
                                <li><img src="../assets/md-interface/images/tutorial/03.png"></li>
                                <li>这样屏幕上就会出现二维码, 千万别点关闭, 也不要用其他窗口遮住这个二维码</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

{include file='user/footer.tpl'}