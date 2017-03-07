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
            $user = new User();
            $user->id = 0;
            $user->user_name = "公共邀请码";
            return $user;
        }else{
            return User::find($this->attributes['user_id']);
        }

    }

    public function createDate()
    {
        return $this->attributes['created_at'];
    }
}
