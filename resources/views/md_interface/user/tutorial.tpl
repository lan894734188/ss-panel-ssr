{include file='user/header.tpl'}
<html>
<body>
<div class="container">
    <div class="row clearfix">
        <ul id="myTab" class="nav nav-tabs">
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
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="windows">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <p>windows</p>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="ios">
                <div class="col-md-12 column">
                    <p>ios</p>
                </div>
            </div>
            <div class="tab-pane fade" id="andriod">
                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <p>andriod</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
{include file='user/footer.tpl'}