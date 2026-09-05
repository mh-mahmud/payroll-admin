<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('shifts', function (Blueprint $table) {
            $table->id();

            $table->string('name');
            $table->text('description')->nullable();

            $table->time('start_time');
            $table->time('end_time');

            $table->unsignedInteger('break_duration')->default(0);

            $table->time('break_start_time')->nullable();
            $table->time('break_end_time')->nullable();

            $table->unsignedInteger('grace_period')->default(0);

            $table->boolean('is_night_shift')->default(false);

            $table->enum('status', ['active', 'inactive'])
                ->default('active');

            $table->timestamps();

            $table->index('status');
            $table->index('is_night_shift');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('shifts');
    }
};