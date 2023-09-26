<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAccountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Accounts', function (Blueprint $table) {
            $table->increments('Account_id');
            $table->bigInteger('credit_card_id');
            $table->integer('Customer_id');
            $table->bigInteger('Account_no');
            $table->integer('Amount');
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
        Schema::dropIfExists('Accounts');
    }
}
