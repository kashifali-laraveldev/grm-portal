<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TblModuleCategory extends Model
{
    protected $table = 'tbl_module_categories';

    protected $primaryKey = 'ID';

    public $timestamps = false;

    protected $guarded = [];
}

