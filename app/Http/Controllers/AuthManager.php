<?php

namespace App\Http\Controllers;
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

use function Laravel\Prompts\select;

class AuthManager extends Controller
{
    function login(){
        if(Auth::check()){
            return redirect()->intended(route('home'));
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
            return redirect()->intended(route('home'));
        }
        return redirect(route('login'))->with("error", "Login details are invalid!");
    }


    function registrationPost(Request $request){
  
        $request -> validate([
            'First_Name'=>'required',
            'Second_Name'=>'required',
            'email'=>'required|unique:users',
            'Account_no'=>'required|unique:users',
            'password'=>'required'
        ]);
        // dd($request);
        $data['First_Name'] = $request->First_Name;
        $data['Second_Name'] = $request->Second_Name;
        $data['email'] = $request->email;
        $data['Account_no'] = $request->Account_no;
        $data['password'] = Hash::make($request->password);
        $User = User::create($data);
        if(!$User){       
             dd($data);
            return redirect(route('registration'))->with("error", "Can not Register");
        }
        return redirect(route('login'))->with("success", "Registration Successful");
    }
    function logout(){
        Session::flush();
        Auth::logout();
        return redirect(route('login'));

    }
    // public function enable2FA()
    // {
    //     // Generate a secret key
    //     $google2fa = new Google2FA();
    //     $secretKey = $google2fa->generateSecretKey();

    //     // Generate a QR code URL
    //     $qrCodeUrl = $google2fa->getQRCodeUrl(
    //         config('app.name'),
    //         Auth::user()->email,
    //         $secretKey
    //     );

    //     // Pass the secret key and QR code URL to the view
    //     return view('2fa-setup', compact('secretKey', 'qrCodeUrl'));
    // }

        
    function payment(){
        if(Auth::check()){
              return view('prediction');
        }
      return redirect()->intended(route('login'));
    }
    





}
