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
</style>

<div class="container-fluid">
    <div class="row form-container">
        <div class="col-md-6 col-sm-12">
            <form method="POST" action="{{ route('payment.post') }}" class="custom-form">
                @csrf

                <div class="mb-3">
                   <!-- Display the account details -->
                <div>
                    <label for="accountNumber">Account Number:</label>
                    <input type="text" id="accountNumber" name="accountNumber" value="{{ $userAccount }}" readonly>
                </div>

                </div>

                <div class="mb-3">
                    <label for="recipientAccount" class="form-label">Recipient Account</label>
                    <input type="text" class="form-control" id="recipientAccount" name="recipient_account" required>
                </div>



                <div class="mb-3">
                <p>Your Total:{{ $userTotal }}</p>
                    <label for="amount" class="form-label">Amount</label>
                    <input type="text" class="form-control" id="amount" name="amount" required>
                </div>

                <button type="submit" class="btn btn-primary">Perform Transaction</button>
            </form>
        </div>
    </div>
</div>

@endsection
