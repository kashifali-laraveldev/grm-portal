<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TblAdmin extends Model
{
    protected $table = 'tbl_admin';

    public $timestamps = false;

    protected $fillable = [
        'employee_ad_id',
        'is_active',
        'password',
        'entity_type',
        'deliverable_entity_type',
        'deliverable_type',
        'created_at',
        'updated_at',
    ];

    public function roles()
    {
        return $this->belongsToMany(TblRole::class, 'tbl_admin_user_roles', 'admin_ID', 'role_ID')
            ->withTimestamps();
    }
}

