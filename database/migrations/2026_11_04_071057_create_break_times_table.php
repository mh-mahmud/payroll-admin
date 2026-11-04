<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('break_times', function (Blueprint $table) {
            $table->id();
            $table->string('break_name', 100);
            $table->time('start_time');
            $table->time('end_time');
            $table->unsignedSmallInteger('duration_mins');
            $table->enum('calculation_type', ['fixed', 'actual'])
                  ->default('fixed');
            $table->timestamps();

            $table->index('break_name');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('break_times');
    }
};