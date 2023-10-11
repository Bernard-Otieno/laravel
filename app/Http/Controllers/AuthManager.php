<?php

namespace App\Http\Controllers;

use App\Models\customer;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

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
}
