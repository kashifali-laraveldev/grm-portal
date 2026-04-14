<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TblEmployee extends Model
{
    protected $table = 'tbl_employees';

    protected $primaryKey = 'ID';

    public $timestamps = false;

    protected $fillable = [
        'employee_ad_id',
        'full_name',
        'email_address',
        'department',
        'company',
        'created_at',
        'updated_at',
    ];
}

