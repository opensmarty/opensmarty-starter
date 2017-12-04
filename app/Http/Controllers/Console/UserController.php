<?php

namespace Opensmarty\Http\Controllers\Console;

use Opensmarty\Http\Controllers\BaseController;

class UserController extends BaseController
{

    public function getUserList()
    {
        return view('console.users.user_list');
    }

}