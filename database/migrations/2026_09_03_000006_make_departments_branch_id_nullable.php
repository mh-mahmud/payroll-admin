<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration{public function up():void{if(Schema::hasTable('departments')&&Schema::hasColumn('departments','branch_id'))Schema::table('departments',fn(Blueprint $table)=>$table->unsignedBigInteger('branch_id')->nullable()->change());}public function down():void{}};
