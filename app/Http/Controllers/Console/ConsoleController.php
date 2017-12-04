<?php

namespace Opensmarty\Http\Controllers\Console;

use Opensmarty\Http\Controllers\BaseController;

class ConsoleController extends BaseController
{

    public function getConsoleHome()
    {
        return view('console.index');
    }

    public function getOauth()
    {
        return view('console.oauth');
    }

}