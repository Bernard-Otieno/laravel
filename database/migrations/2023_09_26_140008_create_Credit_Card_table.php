<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCreditCardTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Credit_Card', function (Blueprint $table) {
            $table->increments('card_id');
            $table->integer('card_no');
            $table->integer('Account_id');
            $table->bigInteger('Amount');
            $table->integer('CVV');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('Credit_Card');
    }
}
