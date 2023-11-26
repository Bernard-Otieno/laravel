<?php

namespace App\Http\Controllers;

use App\Models\ChartData; // Assuming you have a model for your chart data
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;

class ChartController extends Controller
{
    
    public function chart1Data()
    {
        $user = Auth::user();

            if ($user) {
                // User is logged in, retrieve their account details
                $id = $user->id;
                // Fetch account details using the $accountId or any other field you have
            } 
            $cardData=DB::table('accounts')
            ->where('Customer_id', $user->id) 
            ->value('credit_card_id');

            $chartData = DB::table('transaction')
            ->select('created_at', 'Amount')
            ->where('card_id', $cardData) // Assuming $cardData holds the card ID value
            ->get();
            
            $piechartData = DB::table('transaction')
                        ->select('beneficiary_no', 'Amount')
                        ->where('card_id', $cardData)
                        ->get();

            $groupedData = collect($piechartData)->groupBy('beneficiary_no')->map(function ($group) {
                            return $group->sum('Amount');
                        })->toArray();
                        $labels = array_keys($groupedData);
                        $values = array_values($groupedData);
                        
                        
            return view('index', compact('chartData', 'labels','values'));
            }

   
}
