<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TblModule extends Model
{
    protected $table = 'tbl_modules';

    protected $primaryKey = 'ID';

    public $timestamps = false;

    protected $fillable = [
        'module_category_ID',
        'module_name',
        'route',
        'show_in_menu',
        'display_order',
        'created_at',
        'updated_at',
    ];
}

