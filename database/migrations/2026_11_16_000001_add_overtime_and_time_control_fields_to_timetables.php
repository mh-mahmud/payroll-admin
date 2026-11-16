<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('timetables', function (Blueprint $table) {
            // Overtime Rule
            $table->unsignedSmallInteger('min_ot_duration')->default(30);
            $table->boolean('min_ot_enabled')->default(true);
            $table->boolean('ot_block_size_enabled')->default(false);
            $table->unsignedSmallInteger('ot_block_size_minutes')->default(0);
            $table->boolean('ot_block_grace_enabled')->default(false);
            $table->unsignedSmallInteger('ot_block_grace_minutes')->default(0);

            // Rule Settings
            $table->boolean('in_time_control_enabled')->default(false);
            $table->boolean('out_time_control_enabled')->default(false);
            $table->unsignedSmallInteger('in_time_control_minutes')->default(0);
            $table->unsignedSmallInteger('out_time_control_minutes')->default(0);
        });
    }

    public function down(): void
    {
        Schema::table('timetables', function (Blueprint $table) {
            $table->dropColumn([
                'min_ot_duration',
                'min_ot_enabled',
                'ot_block_size_enabled',
                'ot_block_size_minutes',
                'ot_block_grace_enabled',
                'ot_block_grace_minutes',
                'in_time_control_enabled',
                'out_time_control_enabled',
                'in_time_control_minutes',
                'out_time_control_minutes',
            ]);
        });
    }
};
