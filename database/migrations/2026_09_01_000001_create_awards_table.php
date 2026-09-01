<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('awards', function (Blueprint $table) {
            $table->id();
            $table->foreignId('employee_id')->constrained('employees')->cascadeOnDelete();
            $table->unsignedBigInteger('award_type_id');
            $table->date('award_date');
            $table->string('gift')->nullable();
            $table->text('description');
            $table->string('certificate_path')->nullable();
            $table->string('photo_path')->nullable();
            $table->timestamps();
            $table->index(['award_type_id', 'award_date']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('awards');
    }
};
