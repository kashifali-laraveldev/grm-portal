<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TblRole extends Model
{
    protected $table = 'tbl_roles';

    protected $primaryKey = 'ID';

    public $timestamps = false;

    protected $fillable = [
        'role_name',
        'display_order',
        'created_at',
        'updated_at',
    ];
}

