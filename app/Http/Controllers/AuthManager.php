<?php

namespace App\Http\Controllers;

use App\Models\accounts;
use PragmaRX\Google2FA\Google2FA;
use App\Models\credit_Card;
use App\Models\customer;
use App\Models\transaction;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Carbon\Carbon;

use function Laravel\Prompts\select;

class AuthManager extends Controller
{
    function login(){
        if(Auth::check()){
            return redirect()->intended(route('index'));
        }
        return view('login');
    }
    function registration(){
        if(Auth::check()){
            return redirect()->intended(route('home'));
        }
        return view('registration');
    }
    function loans(){
        if(Auth::check()){
             return view('loans');
        }
       return redirect()->intended(route('login'));
    }
    function transaction(){
        if(Auth::check()){
             return view('transaction');
        }
       return redirect()->intended(route('login'));
    }

    function transactionPost(Request $request){
        $request -> validate([
            'card_no'=>'required',
            'beneficiary_no'=>'required',
            'amount'=>'required'
        ]);
      
        $data['card_no'] = $request->card_no;
        $data['beneficiary_no'] = $request->beneficiary_no;
        $data['amount'] = $request->amount;
        $transaction = transaction::create($data);
        if(!$transaction){       
             
            return redirect(route('home'))->with("error", "Can not complete transaction");
        }
        return redirect(route('history'))->with("success", "Registration Successful");
    }

    
    function deposit(){
        if(Auth::check()){
              return view('deposit');
        }
      return redirect()->intended(route('login'));
    }
    function history(){
        if(Auth::check()){

            // return view('history');
            $user=Auth::id();
            // dd($user);
            $account=DB::table('accounts')->where('Customer_id',$user)->value('credit_card_id');
            // dd($account);
            $history = DB::table('transaction')
            ->where('card_id',$account)
            ->get();
//            $data = array();

           //data => 0 => 'fields' 
            // foreach($history[0] as $i){
            //     $data[$i] = $i;
            // }
            return view('history', ['history'=>$history]);


        }
        return redirect()->intended(route('login'));
    }


    function loginPost(Request $request){
        $request -> validate([
            'email'=>'required',
            'password'=>'required'
        ]);

        $credentials = $request->only('email','password');

        if(Auth::attempt($credentials)){
            return redirect()->intended(route('index'));
        }
        return redirect(route('login'))->with("error", "Login details are invalid!");
    }


    function registrationPost(Request $request){
  
        $request -> validate([
            'First_Name'=>'required',
            'Second_Name'=>'required',
            'email'=>'required|unique:users',
            'password'=>'required'
        ]);
        // dd($request);
        $data['First_Name'] = $request->First_Name;
        $data['Second_Name'] = $request->Second_Name;
        $data['email'] = $request->email;
        $data['password'] = Hash::make($request->password);
        $User = User::create($data);
        if(!$User){       
             dd($data);
            return redirect(route('registration'))->with('Failed');
        }
        
        return redirect(route('apply'))->with("success", "Registration Successful");
    }
    function logout(){
        Session::flush();
        Auth::logout();
        return redirect(route('login'));

    }
     public function createBankAccount(Request $request)
    {
        $mytime = Carbon::now();
         // Fetch user data from the database
         $userData = $request->email;
        $id= DB::table('users')
            ->where('email',$userData)
            ->value('id');
    
                    // Available alpha characters
            //    dd($id);
            $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
            $pin = '';

            for ($i = 0; $i < 10; $i++) {
                $pin .= $characters[rand(0, strlen($characters) - 1)];
            }

// $pin contains a single PIN with 10 characters

            
            // $generatedPins now contains an array of 10 PINs
            
         // Perform any necessary validation or checks on $userData
 
         // Create a bank account for the user
         $bankAccount = accounts::create([
            'Customer_id' => $id,
             'Account_no' =>$pin,
             'Amount' => 0,
             'created_at'=>  $mytime,
             'updated_at'=>  $mytime,
             // Assuming you have a function to generate a unique account number
             // Add other fields needed for the bank account creation
         ]);
         if(!$bankAccount){       
            dd($bankAccount);
           return redirect(route('registration'))->with("error", "Can not Register");
       }
 
         // Redirect or return a response based on the success/failure of the bank account creation
         // For example:
         return redirect()->intended(route('login'));
        }

        
    function payment(){
        if(Auth::check()){
            $user = Auth::user();

            if ($user) {
                // User is logged in, retrieve their account details
                $id = $user->id;
                // Fetch account details using the $accountId or any other field you have
            } 
            $userAccount =DB::table('accounts')
            ->where('Customer_id',$id)
            ->value('Account_no');
             

            $userTotal = DB::table('accounts')
            ->where('Customer_id',$id)
            ->value('Amount');
            return view('payment')->with([
                'userAccount' => $userAccount,
                'userTotal' => $userTotal,
            ]);
        }
      return redirect()->intended(route('login'));
    }
    function paymentPost(Request $request){
       
        $type = ''; 
        //in the model we changed the different kinds of transactions to numerals...
        $user = Auth::user();

            if ($user) {
                // User is logged in, retrieve their account details
                $id = $user->id;
                // Fetch account details using the $accountId or any other field you have
            } 
            
           
            // Get data from the form (sender_account, recipient_account, amount)
            $senderAccount =DB::table('accounts')
            ->where('Customer_id',$id)
            ->value('Account_no');
            $recipientAccount = $request->input('recipient_account');
            $amount = $request->input('amount');
            $senderOldBalance = DB::table('accounts')->where('Account_no', $senderAccount)->value('Amount');
                        // Determine $type based on the user's account number
            if ($senderAccount == $recipientAccount) { 
                $type = '3'; // Set $type based on the account number condition
                //3 for cash in

                      // Fetch old balances from the database
           
            $recipientOldBalance = DB::table('accounts')->where('Account_no', $recipientAccount)->value('Amount');
    
            // Calculate new balances
            $recipientNewBalance = $recipientOldBalance + $amount;
            // if (!$amount <= $senderOldBalance) {

            //     return redirect()->back()->with('error', 'Insufficient balance. Please enter a valid amount.');
            // }
           
            $apiUrl = 'http://127.0.0.1:5000/prediction'; 
                        // Prepare data to be sent to the API
                $dataToSend = [
                'type' => $type,
                'amount'=> $amount,
                'sender_old_balance' => $senderOldBalance,
                'sender_new_balance' => $amount,
                'recipient_old_balance' => $recipientOldBalance,
                'recipient_new_balance' => $recipientNewBalance,
            ];
            // Make a POST request to the Flask API
                $client = new \GuzzleHttp\Client();
                $response = $client->post($apiUrl, [
                    'json' => $dataToSend
                ]);
                // Handle the response from the API
    if ($response->getStatusCode() === 200) {
       
        $responseData = json_decode($response->getBody(), true);
        // Check the value returned by the API
        // Adjust this based on the actual API response structure

        if ($responseData == 0) {
            // Redirect to success page
             // Update balances in the database
             DB::table('accounts')->where('Account_no', $senderAccount)->update(['Amount' => $amount]);
             DB::table('accounts')->where('Account_no', $recipientAccount)->update(['Amount' => $recipientNewBalance]);
             $senderCard =DB::table('accounts')
            ->where('Customer_id',$id)
            ->value('credit_card_id');
            $RecipientCard =DB::table('accounts')
            ->where('Account_no',$recipientAccount)
            ->value('credit_card_id');
            $transactionData = [
                'card_id'=>$senderCard,
                'card_no' => $senderAccount,
                'beneficiary_no' => $RecipientCard,
                'Amount' => $amount,
                'created_at' => now(), // Set the created_at timestamp if necessary
                'updated_at' => now(), // Set the updated_at timestamp
            ];
            DB::table('transaction')->insert($transactionData);

            return redirect()->route('success_page');

        } else {
            // Handle unsuccessful transaction (fraudulent)
            // You might show an error message or perform other actions
            return redirect()->route('fail_page');


        }
        } else {
            // Handle API request failure
            return response()->json(['error' => 'Failed to communicate with the API'], $response->getStatusCode());
        }





            } else
            {$type = '2';
            
            // Fetch old balances from the database
           
            $recipientOldBalance = DB::table('accounts')->where('Account_no', $recipientAccount)->value('Amount');
    
            // Calculate new balances
            $senderNewBalance = $senderOldBalance - $amount;
            $recipientNewBalance = $recipientOldBalance + $amount;
            // if ($amount > $senderOldBalance) {

            //     return redirect()->back()->with('error', 'Insufficient balance. Please enter a valid amount.');
            // }
           
            $apiUrl = 'http://127.0.0.1:5000/prediction'; 
                        // Prepare data to be sent to the API
                $dataToSend = [
                'type' => $type,
                'amount'=> $amount,
                'sender_old_balance' => $senderOldBalance,
                'sender_new_balance' => $senderNewBalance,
                'recipient_old_balance' => $recipientOldBalance,
                'recipient_new_balance' => $recipientNewBalance,
            ];
            // Make a POST request to the Flask API
                $client = new \GuzzleHttp\Client();
                $response = $client->post($apiUrl, [
                    'json' => $dataToSend
                ]);
                // Handle the response from the API
    if ($response->getStatusCode() === 200) {
       
        $responseData = json_decode($response->getBody(), true);
        // Check the value returned by the API
        // Adjust this based on the actual API response structure

        if ($responseData == 0) {
            // Redirect to success page
             // Update balances in the database
             DB::table('accounts')->where('Account_no', $senderAccount)->update(['Amount' => $senderNewBalance]);
             DB::table('accounts')->where('Account_no', $recipientAccount)->update(['Amount' => $recipientNewBalance]);
             $senderCard =DB::table('accounts')
            ->where('Customer_id',$id)
            ->value('credit_card_id');
            $RecipientCard =DB::table('accounts')
            ->where('Account_no',$recipientAccount)
            ->value('credit_card_id');
            $transactionData = [
                'card_id'=>$senderCard,
                'card_no' => $senderAccount,
                'beneficiary_no' => $RecipientCard,
                'Amount' => $amount,
                'created_at' => now(), // Set the created_at timestamp if necessary
                'updated_at' => now(), // Set the updated_at timestamp
            ];
            DB::table('transaction')->insert($transactionData);

            return redirect()->route('success_page');

        } else {
           // Example of storing fraudulent transaction details using query builder
            DB::table('fraudulent_transactions')->insert([
                'sender_account' => $senderAccount,
                'recipient_account' => $recipientAccount,
                'amount' => $amount,
                'created_at' => now(),
                'updated_at' => now(),
    // Add other columns as necessary
]);

return redirect()->route('fail_page');
}
        } else {
            // Handle API request failure
            return response()->json(['error' => 'Failed to communicate with the API'], $response->getStatusCode());
        }

            
            }//2 for payment}
                
            // if (!$amount <= $senderOldBalance) {

            //         return redirect()->back()->with('error', 'Insufficient balance. Please enter a valid amount.');
            //     }
            
    
            

        
        }
    





}
