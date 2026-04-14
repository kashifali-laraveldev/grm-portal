<?php

namespace App\Providers;

use App\Models\EntityPeriod;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Share current reporting period label with all views for dashboard header.
        $label = '2026 - June';

        try {
            $active = EntityPeriod::current();
            if ($active) {
                $label = (string) $active->reporting_year . ' - ' . (string) $active->reporting_month;
            }
        } catch (\Throwable $e) {
            // Fallback to default label if DB not ready.
        }

        view()->share('currentPeriodLabel', $label);
    }
}
