<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class credit_Card extends Model
{
    protected $table = 'Credit_Card';

    protected $primaryKey = 'card_id';
    
    protected $fillable = ['card_id', 'card_no',]; // Add other necessary fields

public function user()
{
    return $this->belongsTo(User::class);
}

}

