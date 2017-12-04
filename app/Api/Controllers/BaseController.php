<?php
/**
 * Created for opensmarty-starter.
 * User: Nicolas Wan
 */

namespace Opensmarty\Api\Controllers;

use Opensmarty\Base\Api\Controllers\Controller;
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