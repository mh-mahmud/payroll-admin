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
            $table->string('name'); // Shift Name (e.g. "Summer Roster")
            $table->enum('unit', ['day', 'week', 'month'])->default('day');
            $table->unsignedInteger('cycle')->default(1);
            $table->boolean('auto_shift')->default(false);
            $table->json('schedule_data'); // The entire grid saved as JSON
            $table->timestamps();
        });
    }



    public function down(): void
    {
        Schema::dropIfExists('shifts');
    }
};