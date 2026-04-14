<?php

namespace Database\Seeders;

use App\Models\EntityPeriod;
use Illuminate\Database\Seeder;

/**
 * Safety net after EntityPeriodsSeeder: if no period is active, activate June 2026.
 */
class GeneratePeriodSeeder extends Seeder
{
    public function run(): void
    {
        if (EntityPeriod::query()->where('status', 1)->exists()) {
            return;
        }

        $june2026 = EntityPeriod::query()
            ->where('reporting_year', 2026)
            ->where('reporting_month', 'June')
            ->first();

        if ($june2026) {
            $june2026->activate();
        }
    }
}
