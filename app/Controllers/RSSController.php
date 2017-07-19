<?php
namespace App\Controllers;

use App\Models\RSS;
use App\Models\Node,App\Models\User;
use App\Utils\Tools;
use App\Services\Config;

/**
 *  RSSController
 */
class RSSController extends BaseController
{
    	public function __construct(){
	
	}
	
	public function RSSContent ($request, $response, $args){
		$token = $args['token'];
		$tokenauth = RSS::where('token',$token)->first();
		if (!$tokenauth) {
			return 403;
		}
		$user = User::where('id', $tokenauth->id)->first();
		$g=$user->g;
		$level=$user->level;
		var_dump($g);
		var_dump($level);
		$node = Node::where('type', 1)
			 ->orderBy('sort')
                    	 ->where(function ($query) {
                        	$query->where("g","=",$g)
                         ->orWhere("g","=",0);})
                         ->where("level","<=",$level)->get();
		foreach ($node as $nodes) {
		    $ary['server'] = $nodes->server;
		    $ary['server_port'] = $user->port;
		    $ary['password'] = $user->passwd;
		    $ary['protocol'] = $user->protocol;
		    $ary['obfs'] = $user->obfs;
		    $ary['method'] = $nodes->method;
		    if ($nodes->custom_method) {
			$ary['method'] = $user->method;
		    }
		    $ssrurl = $ary['server']. ":" . $ary['server_port'].":".str_replace("_compatible","",$ary['protocol']).":".$ary['method'].":".str_replace("_compatible","",$ary['obfs']).":".Tools::base64_url_encode($ary['password'])."/?&remarks=".Tools::base64_url_encode($node->name)."&group=".Config::get('appName');
		    $ssr_all_link = "ssr://" . Tools::base64_url_encode($ssrurl);
		    $rss_link .= $ssr_all_link."\n";
		    return Tools::base64_url_encode($rss_link);
		

		
		}
	}

}
