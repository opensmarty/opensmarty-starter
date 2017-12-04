<?php

namespace Opensmarty\Providers;

use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Support\ServiceProvider;
use Opensmarty\Models\Foundation\User;

class PolymorphicServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        Relation::morphMap([
            User::MORPH_NAME => User::class,
//            'Comment' => Comment::class,
//            'Friend' => Friend::class,
        ]);
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }
}
