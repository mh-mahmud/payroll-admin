<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        if (Schema::hasTable('employees')) return;
        Schema::create('employees', function (Blueprint $table) {
            $table->id(); $table->string('employee_code')->unique(); $table->string('name'); $table->string('email')->unique();
            $table->string('phone',30); $table->string('branch'); $table->string('department'); $table->string('designation');
            $table->date('date_of_joining'); $table->string('employment_status')->default('Active'); $table->boolean('login_status')->default(true); $table->timestamps();
        });
    }
    public function down(): void { Schema::dropIfExists('employees'); }
};
