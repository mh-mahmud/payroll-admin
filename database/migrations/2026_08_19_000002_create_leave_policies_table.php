<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        if (!Schema::hasTable('leave_policies')) {
            Schema::create('leave_policies', function (Blueprint $table) {
                $table->id();
                $table->string('name');
                $table->text('description')->nullable();
                $table->foreignId('leave_type_id')->constrained('leave_types')->onDelete('cascade');
                $table->integer('carry_forward_limit')->default(0);
                $table->integer('min_days')->default(1);
                $table->integer('max_days')->default(14);
                $table->boolean('requires_approval')->default(true);
                $table->string('status', 20)->default('Active');
                $table->timestamps();
            });
        }
    }

    public function down(): void {
        Schema::dropIfExists('leave_policies');
    }
};
