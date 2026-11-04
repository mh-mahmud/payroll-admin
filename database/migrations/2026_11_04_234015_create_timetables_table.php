
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('timetables', function (Blueprint $table) {
            $table->id();
            $table->string('name', 100)->unique();
            $table->string('work_hours_assign_to', 50)->default('Regular');
            $table->enum('type', ['normal', 'flexible'])->default('normal');

            $table->time('check_in');
            $table->time('check_in_start_time');
            $table->unsignedTinyInteger('check_in_start_days')->default(0);
            $table->time('check_in_end_time');
            $table->unsignedTinyInteger('check_in_end_days')->default(0);

            $table->time('check_out');
            $table->time('check_out_start_time');
            $table->unsignedTinyInteger('check_out_start_days')->default(0);
            $table->time('check_out_end_time');
            $table->unsignedTinyInteger('check_out_end_days')->default(0);

            $table->decimal('work_day', 4, 1)->default(1.0);
            $table->string('color', 20)->nullable();

            $table->boolean('max_ot_enabled')->default(true);
            $table->unsignedSmallInteger('max_ot_duration')->default(240);
            $table->boolean('overtime_enabled')->default(true);
            $table->json('overtime_rules')->nullable();

            $table->boolean('clock_in_required')->default(true);
            $table->boolean('clock_out_required')->default(true);
            $table->unsignedSmallInteger('allow_late_in')->default(0);
            $table->unsignedSmallInteger('allow_early_out')->default(0);
            $table->enum('punch_state_based', ['yes', 'no'])->default('no');
            $table->time('day_change_time')->default('00:00:00');

            // Placeholder configuration for the unscheduled-time tab.
            $table->json('unscheduled_settings')->nullable();

            $table->timestamps();
        });

        Schema::create('timetable_break_time', function (Blueprint $table) {
            $table->id();
            $table->foreignId('timetable_id')
                ->constrained('timetables')
                ->cascadeOnDelete();
            $table->foreignId('break_time_id')
                ->constrained('break_times')
                ->cascadeOnDelete();
            $table->timestamps();

            $table->unique(['timetable_id', 'break_time_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('timetable_break_time');
        Schema::dropIfExists('timetables');
    }
};
