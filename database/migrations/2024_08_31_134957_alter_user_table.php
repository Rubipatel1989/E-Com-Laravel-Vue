<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('phone')->nullable()->after('email');
            $table->string('address')->nullable()->after('phone');
            $table->string('twitter_link')->nullable()->after('address');
            $table->string('fb_link')->nullable()->after('twitter_link');
            $table->string('insta_link')->nullable()->after('fb_link');
        });
    }

    /** 
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('phone');
            $table->dropColumn('address');
            $table->dropColumn('twitter_link');
            $table->dropColumn('fb_link');
            $table->dropColumn('insta_link');

        });
    }
};