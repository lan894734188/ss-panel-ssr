<?php

namespace App\Models;

/**
 * User Model
 */

use App\Services\Config;
use App\Utils\Hash;
use App\Utils\Tools;
use App\Utils\GA;

class User extends Model

{
    protected $table = "user";

    public $isLogin;

    public $isAdmin;

    protected $casts = [
        "t" => 'int',
        "u" => 'int',
        "d" => 'int',
        "port" => 'int',
        "transfer_enable" => 'float',
        "enable" => 'int',
        'is_admin' => 'boolean',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = ['pass', 'last_get_gift_time', 'last_rest_pass_time', 'reg_ip', 'is_email_verify', 'user_name', 'ref_by', 'is_admin'];

    public function getGravatarAttribute()
    {
        $hash = md5(strtolower(trim($this->attributes['email'])));
        return "https://cdn.v2ex.com/gravatar/$hash";
    }

    public function isAdmin()
    {
        return $this->attributes['is_admin'];
    }

    public function lastSsTime()
    {
        if ($this->attributes['t'] == 0) {
            return "从未使用喵";
        }
        return Tools::toDateTime($this->attributes['t']);
    }

    public function lastCheckInTime()
    {
        if ($this->attributes['last_check_in_time'] == 0) {
            return "从未签到";
        }
        return Tools::toDateTime($this->attributes['last_check_in_time']);
    }

    public function regDate()
    {
        return $this->attributes['reg_date'];
    }

    public function updatePassword($pwd)
    {
        $this->pass = Hash::passwordHash($pwd);
        $this->save();
    }

    public function updateSsPwd($pwd)
    {
        $this->passwd = $pwd;
        $this->save();
    }

    public function updateMethod($method)
    {
        $this->method = $method;
        $this->save();
    }

    public function updateSSRProtocol($SSRProtocol)
    {
        $this->protocol = $SSRProtocol;
        $this->save();
    }

    public function updateSSRobfs($SSRobfs)
    {
        $this->obfs = $SSRobfs;
        $this->save();
    }

    public function addInviteCode()
    {
        $uid = $this->attributes['id'];
        $code = new InviteCode();
        $code->code = Tools::genRandomChar(32);
        $code->user = $uid;
        $code->save();
    }

    public function addManyInviteCodes($num)
    {
        for ($i = 0; $i < $num; $i++) {
            $this->addInviteCode();
        }
    }

    public function trafficUsagePercent()
    {
        $total = $this->attributes['u'] + $this->attributes['d'];
        $transferEnable = $this->attributes['transfer_enable'];
        if ($transferEnable == 0) {
            return 0;
        }
        $percent = $total / $transferEnable;
        $percent = round($percent, 2);
        $percent = $percent * 100;
        return $percent;
    }

    public function enableTraffic()
    {
        $transfer_enable = $this->attributes['transfer_enable'];
        return Tools::flowAutoShow($transfer_enable);
    }

    public function enableTrafficInGB()
    {
        $transfer_enable = $this->attributes['transfer_enable'];
        return Tools::flowToGB($transfer_enable);
    }

    public function usedTraffic()
    {
        $total = $this->attributes['u'] + $this->attributes['d'];
        return Tools::flowAutoShow($total);
    }

    public function unusedTraffic()
    {
        $total = $this->attributes['u'] + $this->attributes['d'];
        $transfer_enable = $this->attributes['transfer_enable'];
        return Tools::flowAutoShow($transfer_enable - $total);
    }

    public function usedPercent()
    {
        $used = $this->attributes['u'] + $this->attributes['d'];
        $total = $this->attributes['transfer_enable'];
        $per = Tools::usePercent($used, $total);
        return $per;
    }

    public function unusedPercent()
    {
        $used = $this->attributes['u'] + $this->attributes['d'];
        $total = $this->attributes['transfer_enable'];
        $per = Tools::usePercent($total-$used, $total);
        return $per;
    }

    public function isAbleToCheckin()
    {
        $last = $this->attributes['last_check_in_time'];
        $hour = Config::get('checkinTime');
        if ($last + $hour * 3600 < time()) {
            return true;
        }
        return false;
    }

    /*
     * @param traffic 单位 MB
     */
    public function addTraffic($traffic)
    {
    }

    public function getGAurl()
    {
        $ga = new GA();
        $url = $ga->getUrl(Config::get('appName')."-".$this->attributes['user_name']."-两步验证码",$this->attributes['ga_token']);
        return $url;
    }

    public function inviteCodes()
    {
        $uid = $this->attributes['id'];
        return InviteCode::where('user_id', $uid)->get();
    }

}
