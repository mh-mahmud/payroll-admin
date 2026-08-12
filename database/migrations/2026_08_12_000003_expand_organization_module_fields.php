<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
 public function up():void{
  Schema::table('branches',function(Blueprint$t){$t->string('email')->nullable();$t->string('contact')->nullable();});
  Schema::table('holidays',function(Blueprint$t){$t->string('category')->nullable();$t->unsignedBigInteger('branch_id')->nullable();});
  Schema::table('announcements',function(Blueprint$t){$t->string('category')->nullable();$t->date('start_date')->nullable();$t->date('end_date')->nullable();$t->unsignedBigInteger('branch_id')->nullable();$t->unsignedBigInteger('department_id')->nullable();$t->string('audience')->nullable();});
  Schema::table('award_types',function(Blueprint$t){$t->text('description')->nullable();});
  Schema::table('document_types',function(Blueprint$t){$t->text('description')->nullable();$t->boolean('is_required')->default(false);});
 }
 public function down():void{}
};
