<?php

namespace Opensmarty\Http\Controllers;

use Opensmarty\Base\Http\Controllers\Controller;
use Opensmarty\Models\Foundation\User;

abstract class BaseController extends Controller
{

    /**
     * @return User
     */
    public function getAuthUser()
    {
        return auth_user();
    }

}
