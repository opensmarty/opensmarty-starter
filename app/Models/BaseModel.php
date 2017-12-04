<?php
/**
 * Created for opensmarty-starter.
 * User: Nicolas Wan
 */

namespace Opensmarty\Models;

use Opensmarty\Base\Models\BaseModel as Model;
use Opensmarty\Models\Foundation\User;

class BaseModel extends Model
{

    /**
     * @return User|null
     */
    public function getUser()
    {
        return parent::getUser();
    }

    /**
     * @return User|null
     */
    public function getAuthUser()
    {
        return parent::getAuthUser();
    }

    /**
     * @return User|null
     */
    public function getRelatedUser()
    {
        return $this->related_user;
    }


}