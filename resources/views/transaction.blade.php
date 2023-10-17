@extends('layout') 
@section('title','Transactions')
@section('content')
<h1 class="ms-auto me-auto mt-3" style="width:500px;">Transaction Form</h1>
<form action="#" class="ms-auto me-auto mt-3" style="width: 500px;">

        <label for="sender">Sender's Account number:</label>
        <input type="text" id="sender" name="sender" required><br><br>

        <label for="recipient">Recipient's Account number:</label>
        <input type="text" id="recipient" name="recipient" required><br><br>

        <label for="amount">Amount:</label>
        <input type="number" id="amount" name="amount" required><br><br>

        <input type="submit" value="Submit">
    </form>
   
@endsection