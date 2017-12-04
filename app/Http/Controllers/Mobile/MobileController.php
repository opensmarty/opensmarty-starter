<?php

namespace Opensmarty\Http\Controllers\Mobile;

use Opensmarty\Http\Controllers\BaseController;

class MobileController extends BaseController
{

    public function getIndex()
    {
        return view('mobile.mobile_main');
    }

    public function getApp()
    {
        return view('mobile.mobile_app');
    }

}