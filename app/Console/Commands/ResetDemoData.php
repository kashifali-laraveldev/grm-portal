<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Log;

class ResetDemoData extends Command
{
    protected $signature = 'demo:reset';

    protected $description = 'Reset all demo data - runs migrate:fresh --seed';

    public function handle(): int
    {
        $demoMode = filter_var(env('DEMO_MODE', false), FILTER_VALIDATE_BOOLEAN);
        if (config('app.env') === 'production' && ! $demoMode) {
            $this->error('Reset not allowed in production without DEMO_MODE=true');

            return 1;
        }

        $this->info('Starting demo data reset...');
        Log::info('Demo reset started at '.now());

        try {
            Artisan::call('migrate:fresh', [
                '--seed' => true,
                '--force' => true,
            ]);

            $output = Artisan::output();
            $this->info('Migration completed.');
            $this->info($output);

            Log::info('Demo reset completed successfully at '.now());
            $this->info('✅ Demo data reset complete!');
        } catch (\Throwable $e) {
            $this->error('Reset failed: '.$e->getMessage());
            Log::error('Demo reset failed: '.$e->getMessage());

            return 1;
        }

        return 0;
    }
}
