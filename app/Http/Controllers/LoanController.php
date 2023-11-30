<?php

namespace App\Http\Controllers;

use App\Models\loans;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

use Illuminate\Http\Request;

class LoanController extends Controller
{
    function loanPost(Request $request){
        
        $validator = Validator::make($request->all(), [
            'loanAmount' => ['required', 'numeric', 'gte:10000', 'lt:1000000000', 'regex:/^[0-9]+$/'],
            'loanPurpose' => ['required'],
        ]);
        if ($validator->fails()) {
            // Handle validation failure
            return redirect()->back()->withErrors($validator)->withInput();
        }
        else
        {

            $id=Auth::id();

            $pin=DB::table('accounts')
            ->where('Customer_id',$id)
            ->value('Account_id');
            $Amount = $request->loanAmount;
            $purpose = $request->loanPurpose;


            $mytime = Carbon::now();



            $loan = loans::create([
                 'account_id' =>$pin,
                 'amount' => $Amount,
                 'loan_purpose'=> $purpose,
                 'created_at'=>  $mytime,
                 'updated_at'=>  $mytime,
                 // Assuming you have a function to generate a unique account number
                 // Add other fields needed for the bank account creation
             ]);
             return redirect()->route('loans')->with('success', 'Your loan application was successful!');
        }




    }
}
