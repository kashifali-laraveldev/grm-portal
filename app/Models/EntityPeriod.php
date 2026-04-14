<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class EntityPeriod extends Model
{
    protected $table = 'entity_periods';

    protected $guarded = [];

    protected function casts(): array
    {
        return [
            'is_lock_period' => 'boolean',
        ];
    }

    public function mappings()
    {
        return $this->hasMany(EntityPeriodMapping::class, 'period_id');
    }

    /** Single current reporting period (status = 1). ICD-style: only one active at a time. */
    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

    public static function current(): ?self
    {
        return static::query()->active()->first();
    }

    /**
     * Year + month for the active period. Used as default across dashboard / matrix.
     */
    public static function currentYearMonth(): array
    {
        $p = static::current();
        if ($p) {
            return [
                'year' => (int) $p->reporting_year,
                'month' => (string) $p->reporting_month,
            ];
        }

        return ['year' => 2026, 'month' => 'June'];
    }

    public static function currentPeriodId(): ?int
    {
        $p = static::current();

        return $p ? (int) $p->id : null;
    }

    /**
     * Make this row the only active period; all others become inactive (status 0).
     */
    public function activate(): void
    {
        DB::transaction(function () {
            static::query()->update(['status' => 0]);
            static::query()->whereKey($this->getKey())->update(['status' => 1]);
            $this->refresh();
        });
    }
}
