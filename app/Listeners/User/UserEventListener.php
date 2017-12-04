<?php
/**
 * Created for opensmarty-starter.
 * User: opensmarty
 */

namespace Opensmarty\Listeners\User;


use Opensmarty\Events\User\UserLoggedInEvent;
use Opensmarty\Events\User\UserRegisteredEvent;
use Opensmarty\Models\BaseModel;

class UserEventListener
{

    public function __construct()
    {
    }


    /**
     * Handle user login events.
     * @param UserLoggedInEvent $event
     */
    public function onUserLogin(UserLoggedInEvent $event)
    {
    }

    /**
     * Handle user registered events.
     * @param UserRegisteredEvent $event
     */
    public function onUserRegistered(UserRegisteredEvent $event)
    {
    }

    /**
     * Handle user logout events.
     */
    public function onUserLogout($event)
    {
    }

    /**
     * Register the listeners for the subscriber.
     *
     * @param  Illuminate\Events\Dispatcher $events
     */
    public function subscribe($events)
    {
        $events->listen(
            UserLoggedInEvent::class,
            'Opensmarty\Listeners\User\UserEventListener@onUserLogin'
        );

        $events->listen(
            UserRegisteredEvent::class,
            'Opensmarty\Listeners\User\UserEventListener@onUserRegistered'
        );

//        $events->listen(
//            'Opensmarty\Events\UserLoggedOut',
//            'Opensmarty\Listeners\UserEventListener@onUserLogout'
//        );
    }

}