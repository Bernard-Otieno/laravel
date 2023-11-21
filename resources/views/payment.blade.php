@extends('layout')

@section('title', 'Perform Transaction')

@section('content')
<style>
    /* Custom CSS to center the form horizontally */
    .form-container {
        display: flex;
        justify-content: center;
        align-items: center; /* Vertically align the form */
        height: 100vh; /* Adjust the height for centering vertically */
    }
    .custom-form {
        width: 400px; /* Adjust the width as needed */
        padding: 20px; /* Add padding for better readability */
        border: 1px solid #ccc; /* Optional: Add a border */
        border-radius: 5px; /* Optional: Add border radius */
        background-color: #f9f9f9; /* Optional: Add background color */
    }
    /* Adjust label styles for consistency */
    .form-label {
        margin-bottom: 8px; /* Add space below labels */
        font-weight: bold; /* Make labels bold */
    }
    /* Adjust input field styles for consistency */
    .form-control {
        width: 100%; /* Occupy full width of the container */
        padding: 8px; /* Adjust padding for input fields */
        border-radius: 3px; /* Add slight border radius */
        border: 1px solid #ccc; /* Add border */
        margin-bottom: 12px; /* Add space between input fields */
       
    } 
    #accountNumber {
        width: calc(100% - 22px); /* Adjust width for account number field */
        padding: 8px; /* Adjust padding for account number field */
        border-radius: 1px; /* Add slight border radius */
        border: 1px solid #ccc; /* Add border */
        margin-bottom: 1px; /* Add space between input fields */
    }
</style>

<div class="container-fluid">
    <div class="row form-container">
        <div class="col-md-6 col-sm-12">
            <form method="POST" action="{{ route('payment.post') }}" class="custom-form">
                @csrf

                <div class="mb-3">
                   <!-- Display the account details -->
                <div>
                    <h5 for="accountNumber">Account Number:</h5>
                    <input type="text" id="accountNumber" name="accountNumber" value="{{$userAccount}}" readonly>
                </div>

                </div>

                <div class="mb-3">
                    <label for="recipientAccount" class="form-label">Recipient Account</label>
                    <input type="text" class="form-control" id="recipientAccount" name="recipient_account" required>
                </div>



                <div class="mb-3">
                <h5>Your Total:{{ $userTotal }}</h5>
                    <label for="amount" class="form-label">Amount</label>
                    <input type="text" class="form-control" id="amount" name="amount" required>
                </div>

                <button type="submit" class="btn btn-primary">Perform Transaction</button>
            </form>
        </div>
    </div>
</div>

@endsection
