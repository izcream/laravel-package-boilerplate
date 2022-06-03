<?php

namespace Wewillapp\BackupDb;

use Illuminate\Support\Facades\Facade;

/**
 * @see \Wewillapp\BackupDb\Skeleton\SkeletonClass
 */
class BackupDbFacade extends Facade
{
    /**
     * Get the registered name of the component.
     *
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return 'backup-db';
    }
}
