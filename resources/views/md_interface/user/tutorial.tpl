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
                                    <a href="#android" data-toggle="tab">
                                        android
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </section>

                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="windows">
                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner margin-bottom-no margin-top-no">
                                    <ul>
                                        <li><h3>windows 教程</h3></li>
                                        <li><p>进入用户中心 记得在新窗口中打开<a href="/user">点我进入</a></p></li>
                                        <li>滚动网页到最底部,找到节点列表,点击展开</li>
                                        <li><img src="../assets/md-interface/images/tutorial/01.jpg"></li>
                                        <li>点击节点的详细信息</li>
                                        <li><img src="../assets/md-interface/images/tutorial/02.jpg"></li>
                                        <li>会弹出一个对话框 点击中间的SSR二维码</li>
                                        <li><img src="../assets/md-interface/images/tutorial/03.png"></li>
                                        <li>这样屏幕上就会出现二维码, 千万别点关闭, 也不要用其他窗口遮住这个二维码</li>
                                        <li>下载windows客户端 记得在新窗口中打开<a href="https://github.com/shadowsocksr/shadowsocksr-csharp/releases">下载地址</a></li>
                                        <li>在网页中找到下图的红色框框的标记</li>
                                        <li><img src="../assets/md-interface/images/tutorial/windows/01.jpg"></li>
                                        <li>找到对应的版本进行下载 如下图 PS:尽量使用新版本, 服务器版本永远会使用最新版本, 并不支持旧版本</li>
                                        <li><img src="../assets/md-interface/images/tutorial/windows/02.jpg"></li>
                                        <li>保存 解压到固定文件夹 双击ShadowsocksR-dotnet4.0.exe运行程序</li>
                                        <li>可能会出现如下图的安全警报 点击:允许访问</li>
                                        <li><img src="../assets/md-interface/images/tutorial/windows/03.jpg"></li>
                                        <li>删除初始化的空白服务器</li>
                                        <li><img src="../assets/md-interface/images/tutorial/windows/04.jpg" style="height: 100%;width: 100%"></li>
                                        <li>在屏幕右下角找蓝色纸飞机的图标 用鼠标右键点击他 点击二维码扫描 ps请不要遮住上文说的二维码图片</li>
                                        <li><img src="../assets/md-interface/images/tutorial/windows/05.jpg"></li>
                                        <li>会出现上上图相似的 服务器编辑界面 直接点击确定</li>
                                        <li>再次鼠标右键点击小飞机图标 > 选择第一个"系统代理模式" > 选择"PAC模式"</li>
                                        <li>再次鼠标右键点击小飞机图标 > 选择第二个"PAC" > 选择"更新PAC为GFWList"</li>
                                        <li>再次鼠标右键点击小飞机图标 > 选择第三个"代理规则" > 选择"绕过局域网"</li>
                                        <li>再次鼠标右键点击小飞机图标 > 选择"选项设置..." > 选中"右上角的开机启动" 如果弹出UAC菜单选择允许 点击确定</li>
                                        <li>重启浏览器 welcome to new world</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="ios">
                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner margin-bottom-no margin-top-no">
                                    <ul>
                                        <li><h3>ios 教程</h3></li>
                                        <li><p>进入用户中心 记得在新窗口中打开<a href="/user">点我进入</a></p></li>
                                        <li>滚动网页到最底部,找到节点列表,点击展开</li>
                                        <li><img src="../assets/md-interface/images/tutorial/01.jpg"></li>
                                        <li>点击节点的详细信息</li>
                                        <li><img src="../assets/md-interface/images/tutorial/02.jpg"></li>
                                        <li>会弹出一个对话框 点击中间的SSR二维码</li>
                                        <li><img src="../assets/md-interface/images/tutorial/03.png"></li>
                                        <li>这样屏幕上就会出现二维码, 千万别点关闭, 也不要用其他窗口遮住这个二维码</li>
                                        <li>下载ios客户端Shadowrocket 作者是 Guangming Li 需要购买软件 记得在新窗口中打开<a href="https://appsto.re/cn/UDjM3.i">下载地址</a></li>
                                        <li>安装完成后 右下角按钮 点击扫描二维码</li>
                                        <li><img src="../assets/md-interface/images/tutorial/ios/01.png" style="height: 100%;width: 100%"></li>
                                        <li>扫描刚的二维码</li>
                                        <li>在"全局路由" 设置为 "代理"</li>
                                        <li>拨动 未连接 右侧开关 连接服务器 welcome to new world</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="android">
                        <div class="card">
                            <div class="card-main">
                                <div class="card-inner margin-bottom-no margin-top-no">
                                    <ul>
                                        <li><h3>android 教程</h3></li>
                                        <li><p>进入用户中心 记得在新窗口中打开<a href="/user">点我进入</a></p></li>
                                        <li>滚动网页到最底部,找到节点列表,点击展开</li>
                                        <li><img src="../assets/md-interface/images/tutorial/01.jpg"></li>
                                        <li>点击节点的详细信息</li>
                                        <li><img src="../assets/md-interface/images/tutorial/02.jpg"></li>
                                        <li>会弹出一个对话框 点击中间的SSR二维码</li>
                                        <li><img src="../assets/md-interface/images/tutorial/03.png"></li>
                                        <li>这样屏幕上就会出现二维码, 千万别点关闭, 也不要用其他窗口遮住这个二维码</li>
                                        <li>下载android客户端 记得在新窗口中打开<a href="https://github.com/shadowsocksr/shadowsocksr-android/releases">下载地址</a></li>
                                        <li>安装完成后 右下角按钮 点击扫描二维码</li>
                                        <li><img src="../assets/md-interface/images/tutorial/android/01.jpg"></li>
                                        <li>扫描刚的二维码</li>
                                        <li><img src="../assets/md-interface/images/tutorial/android/02.png"></li>
                                        <li>在"功能设置" > "路由" > 选择"绕过局域网 大陆网站"</li>
                                        <li>在"功能设置" > 打开 "UDP转发"</li>
                                        <li>连接服务器 welcome to new world</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

{include file='user/footer.tpl'}