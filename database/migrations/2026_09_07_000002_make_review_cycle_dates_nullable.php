<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
return new class extends Migration{public function up():void{DB::statement('ALTER TABLE review_cycles MODIFY start_date DATE NULL');DB::statement('ALTER TABLE review_cycles MODIFY end_date DATE NULL');}public function down():void{DB::statement('ALTER TABLE review_cycles MODIFY start_date DATE NOT NULL');DB::statement('ALTER TABLE review_cycles MODIFY end_date DATE NOT NULL');}};
