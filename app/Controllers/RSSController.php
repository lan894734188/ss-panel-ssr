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
		var_dump($tokenauth->id);
		if (!$tokenauth) {
			return 403;
		}else{
		$id=$tokenauth->id;
		$user = User::where('id', $id)->first();
			var_dump($user);
			var_dump($tokenauth->id);
			var_dump(md5($user->email+Config::get('token_salt')));
		$g=$user->g;
		$level=$user->level;
		
		$nodepacket = Node::where('type','=', 1)->where("g","=",$g)->where("level","<=","$level")->orderBy('sort')->get();
		var_dump($nodepacket);
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
		    return Tools::base64_url_encode($rss_link);
		}

		
		}
	}

}
