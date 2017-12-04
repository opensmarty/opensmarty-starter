<?php

namespace Opensmarty\Repositories\Interfaces;

use Opensmarty\Repositories\Interfaces\BaseRepositoryInterface;

/**
 * Interface UserRepository
 * @package namespace Opensmarty\Repositories\Interfaces;
 */
interface UserRepository extends BaseRepositoryInterface
{
    /**
     * @param array|Collection $userIds
     * @return $this
     */
    public function byUserIds($userIds);
}
