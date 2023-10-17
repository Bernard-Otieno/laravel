@extends('layout') 
@section('title','Transactions')
@section('content')
<h1 class="ms-auto me-auto mt-3" style="width:500px;">Transaction Form</h1>

<div class="container" style="font-size: medium;">
    <div class="ms-auto me-auto mt-3">
            @if($errors->any())
        <div class="col-12">
            @foreach($errors->all() as $error)
            <div class="alert alert-danger">{{$error}}</div>
            @endforeach
        </div>
            @endif
            
        @if(session()->has ('error'))
        <div class="alert alert-danger">{{session('error')}}</div>
        @endif
        @if(session()->has ('success'))
        <div class="alert alert-danger">{{session('success')}}</div>
        @endif
    </div>

<form action="{{route('transaction.post')}}" method="post" class="ms-auto me-auto mt-3" style="width: 500px;">
        @csrf
        <label for="sender">Sender's Card number:</label>
        <input type="text" id="card_no" name="card_no" required><br><br>

        <label for="recipient">Recipient's Card number:</label>
        <input type="text" id="beneficiary_no" name="beneficiary_no" required><br><br>

        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" required><br><br>

        <input type="submit" value="Submit">
    </form>
   
@endsection