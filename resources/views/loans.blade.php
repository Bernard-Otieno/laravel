@extends('layout') 
@section('title','Loans')
@section('content')
<style>
        /* Custom CSS to center the form horizontally */
        .form-container {
            display: flex;
            justify-content: center;
        }
        .custom-form {
            width: 80%; /* Adjust the width as needed */
        }
    </style>
<div class="container mt-5">
    <div class="form-container">

   
    <form class="custom-form">
        <div class="form-row">
            <div class="form-group col-md-6"> 
                <h1 class="mt-5 mb-4">Loan Application Form</h1>
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" id="firstName" placeholder="John" required>
            </div>
            <div class="form-group col-md-6">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" id="lastName" placeholder="Doe" required>
            </div>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" placeholder="johndoe@example.com" required>
        </div>
        <div class="form-group">
            <label for="loanAmount">Loan Amount</label>
            <input type="number" class="form-control" id="loanAmount" placeholder="Enter Loan Amount" required>
        </div>
        <div class="form-group">
            <label for="loanPurpose">Loan Purpose</label>
            <textarea class="form-control" id="loanPurpose" rows="3" placeholder="Tell us the purpose of the loan" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit Application</button>
    </form>
    </div>
</div>
   
@endsection