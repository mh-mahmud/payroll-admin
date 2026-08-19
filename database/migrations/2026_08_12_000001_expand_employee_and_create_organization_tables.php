<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
 public function up(): void {
  foreach(['branches','departments','designations','shifts','attendance_policies','document_types'] as $name){if(!Schema::hasTable($name))Schema::create($name,function(Blueprint $t)use($name){$t->id();$t->string('name');$t->string('code')->nullable();if($name==='departments')$t->unsignedBigInteger('branch_id')->nullable();if($name==='designations')$t->unsignedBigInteger('department_id')->nullable();if($name==='shifts'){$t->time('start_time')->nullable();$t->time('end_time')->nullable();}if($name==='attendance_policies'){$t->unsignedInteger('late_after_minutes')->default(0);$t->decimal('working_hours',4,2)->default(8);} $t->boolean('status')->default(1);$t->timestamps();});}
  Schema::table('employees', function (Blueprint $t) {
      if (!Schema::hasColumn('employees', 'biometric_code')) $t->string('biometric_code')->nullable();
      if (!Schema::hasColumn('employees', 'password')) $t->string('password')->nullable();
      if (!Schema::hasColumn('employees', 'date_of_birth')) $t->date('date_of_birth')->nullable();
      if (!Schema::hasColumn('employees', 'gender')) $t->string('gender', 20)->nullable();
      if (!Schema::hasColumn('employees', 'profile_image')) $t->string('profile_image')->nullable();
      if (!Schema::hasColumn('employees', 'branch_id')) $t->unsignedBigInteger('branch_id')->nullable();
      if (!Schema::hasColumn('employees', 'department_id')) $t->unsignedBigInteger('department_id')->nullable();
      if (!Schema::hasColumn('employees', 'designation_id')) $t->unsignedBigInteger('designation_id')->nullable();
      if (!Schema::hasColumn('employees', 'shift_id')) $t->unsignedBigInteger('shift_id')->nullable();
      if (!Schema::hasColumn('employees', 'attendance_policy_id')) $t->unsignedBigInteger('attendance_policy_id')->nullable();
      if (!Schema::hasColumn('employees', 'employment_type')) $t->string('employment_type')->default('Full-time');
      if (!Schema::hasColumn('employees', 'address_line_1')) $t->string('address_line_1')->nullable();
      if (!Schema::hasColumn('employees', 'address_line_2')) $t->string('address_line_2')->nullable();
      if (!Schema::hasColumn('employees', 'city')) $t->string('city')->nullable();
      if (!Schema::hasColumn('employees', 'state')) $t->string('state')->nullable();
      if (!Schema::hasColumn('employees', 'country')) $t->string('country')->nullable();
      if (!Schema::hasColumn('employees', 'postal_code')) $t->string('postal_code')->nullable();
      if (!Schema::hasColumn('employees', 'emergency_contact_name')) $t->string('emergency_contact_name')->nullable();
      if (!Schema::hasColumn('employees', 'emergency_contact_relationship')) $t->string('emergency_contact_relationship')->nullable();
      if (!Schema::hasColumn('employees', 'emergency_contact_phone')) $t->string('emergency_contact_phone')->nullable();
      if (!Schema::hasColumn('employees', 'bank_name')) $t->string('bank_name')->nullable();
      if (!Schema::hasColumn('employees', 'account_holder_name')) $t->string('account_holder_name')->nullable();
      if (!Schema::hasColumn('employees', 'account_number')) $t->string('account_number')->nullable();
      if (!Schema::hasColumn('employees', 'bank_identifier_code')) $t->string('bank_identifier_code')->nullable();
      if (!Schema::hasColumn('employees', 'bank_branch')) $t->string('bank_branch')->nullable();
      if (!Schema::hasColumn('employees', 'tax_id')) $t->string('tax_id')->nullable();
      if (!Schema::hasColumn('employees', 'base_salary')) $t->decimal('base_salary', 14, 2)->nullable();
  });
  if(!Schema::hasTable('employee_documents'))Schema::create('employee_documents',function(Blueprint $t){$t->id();$t->unsignedBigInteger('employee_id')->index();$t->unsignedBigInteger('document_type_id')->nullable();$t->string('file_path');$t->date('expiry_date')->nullable();$t->timestamps();});
 }
 public function down():void{}
};
