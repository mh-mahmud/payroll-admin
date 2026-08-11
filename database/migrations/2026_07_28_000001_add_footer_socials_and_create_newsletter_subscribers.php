<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $addTikTok = ! Schema::hasColumn('settings', 'tiktok_link');
        $addPinterest = ! Schema::hasColumn('settings', 'pinterest_link');

        if ($addTikTok || $addPinterest) {
            Schema::table('settings', function (Blueprint $table) use ($addTikTok, $addPinterest) {
                if ($addTikTok) {
                    $table->string('tiktok_link', 2048)->nullable();
                }
                if ($addPinterest) {
                    $table->string('pinterest_link', 2048)->nullable();
                }
            });
        }

        if (! Schema::hasTable('newsletter_subscribers')) {
            Schema::create('newsletter_subscribers', function (Blueprint $table) {
                $table->id();
                $table->string('email')->unique();
                $table->string('source')->default('footer');
                $table->timestamps();
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('newsletter_subscribers');

        $columns = collect(['tiktok_link', 'pinterest_link'])
            ->filter(fn (string $column) => Schema::hasColumn('settings', $column))
            ->all();

        if ($columns) {
            Schema::table('settings', function (Blueprint $table) use ($columns) {
                $table->dropColumn($columns);
            });
        }
    }
};
