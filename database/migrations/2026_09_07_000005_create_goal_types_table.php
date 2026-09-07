<?php
use Illuminate\Database\Migrations\Migration;use Illuminate\Database\Schema\Blueprint;use Illuminate\Support\Facades\Schema;
return new class extends Migration{public function up():void{if(!Schema::hasTable('goal_types'))Schema::create('goal_types',function(Blueprint $t){$t->id();$t->string('name')->unique();$t->text('description')->nullable();$t->boolean('status')->default(true);$t->timestamps();});}public function down():void{Schema::dropIfExists('goal_types');}};
