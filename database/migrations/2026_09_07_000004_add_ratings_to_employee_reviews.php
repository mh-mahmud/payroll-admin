<?php
use Illuminate\Database\Migrations\Migration;use Illuminate\Database\Schema\Blueprint;use Illuminate\Support\Facades\Schema;
return new class extends Migration{public function up():void{Schema::table('employee_reviews',fn(Blueprint $t)=>$t->json('ratings')->nullable()->after('rating'));}public function down():void{Schema::table('employee_reviews',fn(Blueprint $t)=>$t->dropColumn('ratings'));}};
