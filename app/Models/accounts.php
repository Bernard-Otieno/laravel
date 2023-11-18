<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class accounts extends Model
{
    protected $table = 'Accounts';

    protected $primaryKey = 'Account_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'Account_no',
        'Customer_id',
        
    ];
}
