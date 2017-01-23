<?php

namespace App\Services;

use Smarty;

class View
{
    public static function getSmarty(){
        $smarty=new smarty(); //实例化smarty
        $smarty->settemplatedir(BASE_PATH.'/resources/views/'.Config::get('theme').'/'); //设置模板文件存放目录
        $smarty->setcompiledir(BASE_PATH.'/storage/framework/smarty/compile/'); //设置生成文件存放目录
        $smarty->setcachedir(BASE_PATH.'/storage/framework/smarty/cache/'); //设置缓存文件存放目录
        // add config
        $Base_Analytics="<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');ga('create', 'UA-90774403-1', 'auto');ga('send', 'pageview');</script>";
        $smarty->assign('config',Config::getPublicConfig());
        $smarty->assign('user',Auth::getUser());
        $smarty->assign('analyticsCode',DbConfig::get('analytics-code'));
        $smarty->assign('base_ana',$Base_Analytics);
        return $smarty;
    }

}
