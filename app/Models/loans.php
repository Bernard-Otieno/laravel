<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class loans extends Model
{
    protected $table = 'loans_applicantions';
    protected $primaryKey = 'id';
    protected $foreignKey = 'account_id';

    protected $fillable = [
        'account_id',
        'loan_purpose',
        'amount',
    ];
}
