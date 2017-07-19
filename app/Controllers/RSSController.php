<?php
namespace App\Controllers;

use App\Models\RSS;
use App\Models\User;
use App\Models\Node;
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
		}else{
		$user = User::where("id", $tokenauth['user_id'])->get();
		$nodepacket = Node::where('type', 1)->where("g","=",$user->g)->where("level","<=","$user->level")->orderBy('sort')->get();

	    	$nodes_array = $nodepacket-> toArray();

		foreach ($nodes_array as $nodes) {
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
		}

		return Tools::base64_url_encode($rss_link);
		}
	}

}
