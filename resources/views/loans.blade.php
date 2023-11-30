@extends('layout') 
@section('title','Loans')
@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form class="custom-form">
                <h1 class="mt-5 mb-4 text-center">Loan Application Form</h1>
                <div class="form-group">
                    @csrf
                <div class="form-group">
                    <label for="loanAmount">Loan Amount</label>
                    <input type="number" class="form-control" id="loanAmount" placeholder="Enter Loan Amount" required>
                </div>
                <div class="form-group">
                    <label for="loanPurpose">Loan Purpose</label>
                    <textarea class="form-control" id="loanPurpose" rows="3" placeholder="Tell us the purpose of the loan" required></textarea>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Submit Application</button>
                </div>
            </form>
        </div>
    </div>
</div>
    <style>
        /* Existing styles... */

        /* Normalize label styles */
        .custom-form label {
            font-weight: normal;
            font-size: 14px;
            margin-bottom: 0.5rem; /* Adjust margin for better spacing */
        }
    </style>

   
@endsection