<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
 public function up():void{foreach(['holidays','announcements','award_types']as$table){if(!Schema::hasTable($table))Schema::create($table,function(Blueprint$t)use($table){$t->id();$t->string('name');$t->string('code')->nullable();if($table==='holidays')$t->date('holiday_date')->nullable();if($table==='announcements')$t->text('description')->nullable();$t->boolean('status')->default(1);$t->timestamps();});}}
 public function down():void{}
};
