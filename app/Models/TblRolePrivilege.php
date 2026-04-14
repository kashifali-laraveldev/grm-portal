<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TblRolePrivilege extends Model
{
    protected $table = 'tbl_role_privileges';

    protected $primaryKey = 'ID';

    public $timestamps = false;

    protected $fillable = [
        'role_ID',
        'module_ID',
        'created_at',
        'updated_at',
    ];
}

