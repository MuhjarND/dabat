<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Illuminate\Support\Facades\DB;

class Kernel extends ConsoleKernel
{
    protected function schedule(Schedule $schedule)
    {
        // Reset status ke 'tidak_ada' tiap hari pukul 07:30
        $schedule->call(function () {
            DB::table('employee_statuses')->update([
                'status'     => 'tidak_ada',
                'updated_at' => now(),
            ]);
        })->dailyAt('07:30');
    }

    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
