<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReportTransactionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('Report_Transaction', function (Blueprint $table) {
            $table->increments('report_id');
            $table->integer('transaction_id');
            $table->integer('card_id');
            $table->longText('details');
            $table->boolean('is_resolved');
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
        Schema::dropIfExists('Report_Transaction');
    }
}
