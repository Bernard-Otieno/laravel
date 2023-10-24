<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class transaction extends Model
{
    protected $table = 'transaction';

    protected $primaryKey = 'transaction_id';

    protected $fillable = [
        'card_no',
        'card_id',
        'beneficiary_no',
        'amount',
    ];
}
