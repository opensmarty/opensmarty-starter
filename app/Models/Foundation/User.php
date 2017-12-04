<?php

namespace Opensmarty\Models\Foundation;

use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Opensmarty\Image\Models\Traits\OpensmartyHasImageablesTrait;
use Opensmarty\Model\Foundation\User as BaseUser;

class User extends BaseUser
{
    use OpensmartyHasImageablesTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
        'gender', 'birthday', 'country', 'timezone', 'locale', 'username', 'phone_number', 'status',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'remember_token',
    ];

    /**
     * Called when model is created
     * Other events available are in BaseModelEvents
     */
    public function onCreated()
    {
        parent::onCreated();

    }

}
