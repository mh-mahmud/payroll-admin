<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration{
 public function up():void{if(Schema::hasTable('employee_transfers'))return;Schema::create('employee_transfers',function(Blueprint $t){$t->id();$t->foreignId('employee_id')->constrained('employees')->cascadeOnDelete();$t->unsignedBigInteger('from_branch_id')->nullable();$t->unsignedBigInteger('to_branch_id');$t->unsignedBigInteger('from_department_id')->nullable();$t->unsignedBigInteger('to_department_id');$t->unsignedBigInteger('from_designation_id')->nullable();$t->unsignedBigInteger('to_designation_id')->nullable();$t->date('transfer_date');$t->date('effective_date');$t->text('reason');$t->string('document_path')->nullable();$t->enum('status',['Pending','Approved','Rejected'])->default('Pending');$t->text('notes')->nullable();$t->timestamps();});}
 public function down():void{Schema::dropIfExists('employee_transfers');}
};
