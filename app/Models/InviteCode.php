<?php

namespace App\Models;

/**
 * InviteCode Model
 */

class InviteCode extends Model

{
    protected $table = "ss_invite_code";

    public function user()
    {
        if($this->attributes['user_id']==0){
            return "公共邀请码";
        }else{
            return User::find($this->attributes['user_id']);
        }

    }

    public function createDate()
    {
        return $this->attributes['created_at'];
    }
}
