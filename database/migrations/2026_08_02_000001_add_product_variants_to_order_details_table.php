<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $columns = collect(['product_color', 'product_size'])
            ->reject(fn (string $column) => Schema::hasColumn('order_details', $column))
            ->all();

        if ($columns) {
            Schema::table('order_details', function (Blueprint $table) use ($columns) {
                foreach ($columns as $column) $table->string($column, 100)->nullable();
            });
        }
    }

    public function down(): void
    {
        $columns = collect(['product_color', 'product_size'])
            ->filter(fn (string $column) => Schema::hasColumn('order_details', $column))
            ->all();
        if ($columns) Schema::table('order_details', fn (Blueprint $table) => $table->dropColumn($columns));
    }
};
