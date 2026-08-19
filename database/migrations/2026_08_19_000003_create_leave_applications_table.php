<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        if (!Schema::hasTable('leave_applications')) {
            Schema::create('leave_applications', function (Blueprint $table) {
                $table->id();
                $table->foreignId('employee_id')->constrained('employees')->onDelete('cascade');
                $table->foreignId('leave_type_id')->constrained('leave_types')->onDelete('cascade');
                $table->date('start_date');
                $table->date('end_date');
                $table->integer('days_count');
                $table->text('reason');
                $table->string('attachment_path')->nullable();
                $table->string('status', 20)->default('Pending');
                $table->date('applied_on');
                $table->timestamps();
            });
        }
    }

    public function down(): void {
        Schema::dropIfExists('leave_applications');
    }
};
