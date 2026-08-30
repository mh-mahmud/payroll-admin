<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration {
 public function up():void{Schema::table('branches',function(Blueprint $table){$table->text('address')->nullable()->after('branch_code');$table->string('city',100)->nullable()->after('address');$table->string('state',100)->nullable()->after('city');$table->string('country',100)->nullable()->after('state');$table->string('postal_code',20)->nullable()->after('country');});}
 public function down():void{Schema::table('branches',fn(Blueprint $table)=>$table->dropColumn(['address','city','state','country','postal_code']));}
};
