<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('fraudulent_transactions', function (Blueprint $table) {
            $table->id();
        $table->string('sender_account');
        $table->string('recipient_account');
        $table->integer('amount');
        $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fraudulent_transactions');
    }
};
