<?php

namespace Opensmarty\Presenters;

use Opensmarty\Transformers\UserTransformer;

/**
 * Class UserPresenter
 *
 * @package namespace Opensmarty\Presenters;
 */
class UserPresenter extends BasePresenter
{
    /**
     * Transformer
     *
     * @return \League\Fractal\TransformerAbstract
     */
    public function getTransformer()
    {
        return new UserTransformer();
    }
}
