<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\loans;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use App\Models\AdminUser;


class analyticsController extends Controller
{
    public function index(){
        return view ('analytics');
    }

    public function authenticateAdmin(Request $request)
    {
        $request->validate([
            'username' => ['required', 'alpha'],
            'password' => ['required'],
        ], [
            'username.alpha' => 'The username field must contain only letters.'
        ]);
    
        $credentials = $request->only('username', 'password');
    
        // Query the admin_users table to check the credentials
        $admin = AdminUser::where('username', $credentials['username'])->first();
    
        if ($admin && Hash::check($credentials['password'], $admin->password)) {
            // Authentication successful
            // Perform actions after successful authentication
            return redirect()->route('analyticsHome');
        } else {
            // Authentication failed
            // Redirect or display an error message
            return redirect()->back()->with('error', 'Invalid credentials');
        }
    }


    public function accountStatistics(){
        $balanceLabels = [];
        $balanceData = [];

        $balanceDistribution = DB::table('accounts')
            ->selectRaw('CASE 
                             WHEN Amount >= 0 AND Amount <= 500 THEN "0 - 500"
                             WHEN Amount > 500 AND Amount <= 1000 THEN "501 - 1000"
                             WHEN Amount > 1000 AND Amount <= 1500 THEN "1001 - 1500"
                             ELSE "Above 1500"
                         END AS balance_range, COUNT(*) AS count_of_accounts')
            ->groupBy('balance_range')
            ->get();

        foreach ($balanceDistribution as $distribution) {
            $balanceLabels[] = $distribution->balance_range;
            $balanceData[] = $distribution->count_of_accounts;
        }

        return view('account_statistics', compact(
            'balanceLabels',
            'balanceData',
        ));
    }


    public function cardStatistics(){
         // Retrieve credit card data for statistics
         $totalCards = DB::table('credit_card')->count();
         $totalAmount = DB::table('credit_card')->sum('Amount');
         $averageAmount = $totalAmount / max($totalCards, 1);
 
         // Retrieve specific data points for analysis (e.g., card numbers, CVV, etc.)
         $cardDetails = DB::table('credit_card')->select('card_id', 'Amount','card_no', 'CVV')->get();
 
          // Retrieve card numbers and amounts from the database
            $cardStats = DB::table('credit_card')
            ->selectRaw('card_no AS cardNumbers, Amount AS cardAmounts')
            ->get();

        // Extract card numbers and amounts
        $cardNumbers = $cardStats->pluck('cardNumbers')->toArray();
        $cardAmounts = $cardStats->pluck('cardAmounts')->toArray();

         return view('card_statistics', [
            'cardNumbers' => $cardNumbers,
             'cardAmounts' => $cardAmounts,
             'totalCards' => $totalCards,
             'totalAmount' => $totalAmount,
             'averageAmount' => $averageAmount,
             'cardDetails' => $cardDetails,
         ]);
    }


    public function loanStatistics()
    {
        // Retrieve loan application data for statistics
        $totalApplications = DB::table('loans_applicantions')->count();
        $totalLoanAmount = DB::table('loans_applicantions')->sum('amount');
        $averageLoanAmount = $totalLoanAmount / max($totalApplications, 1);

        // Retrieve specific data points for analysis (e.g., loan purposes, individual application details, etc.)
        $loanDetails = DB::table('loans_applicantions')->select('loan_purpose', 'amount','id')->get();
        
        $loans = DB::table('loans_applicantions')
        ->selectRaw('id AS loanIDs, amount AS loanAmounts')
        ->get();

    // Extract card numbers and amounts
    $loanIDs = $loans->pluck('loanIDs')->toArray();
    $loanAmounts = $loans->pluck('loanAmounts')->toArray();


        return view('Loan_stats', [
            'loanIDs'=> $loanIDs,
            'loanAmounts'=> $loanAmounts,
            'totalApplications' => $totalApplications,
            'totalLoanAmount' => $totalLoanAmount,
            'averageLoanAmount' => $averageLoanAmount,
            'loanDetails' => $loanDetails,
        ]);
    }
    public function logout(Request $request){
        $request->session()->forget('user'); // Assuming 'user' is the key for the logged-in user data
        $request->session()->flush(); // Clears all session data
    
    return redirect('/login');
    }
}
