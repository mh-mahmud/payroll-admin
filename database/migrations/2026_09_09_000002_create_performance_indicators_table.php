<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('performance_indicators', function (Blueprint $table) {
            $table->id();
            $table->foreignId('indicator_category_id')->constrained()->cascadeOnUpdate()->restrictOnDelete();
            $table->string('name')->unique();
            $table->text('description')->nullable();
            $table->string('measurement_unit', 100);
            $table->string('target_value', 100);
            $table->boolean('status')->default(true)->index();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('performance_indicators');
    }
};
