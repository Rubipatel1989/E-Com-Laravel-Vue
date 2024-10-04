<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('product_attr_images', function (Blueprint $table) {
            // Change the `image` column type from bigint to varchar
            $table->string('image', 255)->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_attr_images', function (Blueprint $table) {
            // Revert the `image` column type back to bigint
            $table->unsignedBigInteger('image')->change();
        });
    }
};
