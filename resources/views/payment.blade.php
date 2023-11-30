@extends('layout')
@section('title', 'Perform Transaction')
@section('content')
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="content-container text-center">
        <div class="account-info mb-4">
            <h4>Your Account Number: <span>{{$userAccount}}</span></h4>
            <h5>To Deposit, place your own account number as recipient account</h5>         
        </div>

        <div class="col-md-6 col-sm-12">
            <form method="POST" action="{{ route('payment.post') }}" class="custom-form">
                @csrf
                <h5>Maximum Deposit: 999,999,999</h5>

                <div class="mb-3">
                    <label for="recipientAccount" class="form-label">Recipient Account</label>
                    <input type="text" class="form-control" id="recipientAccount" name="recipient_account" required>
                    @error('recipient_account')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror
                </div>

                <div class="mb-3">
                    <h5>Your Total:{{ $userTotal }}</h5>
                    <label for="amount" class="form-label">Amount</label>
                    <input type="text" class="form-control" id="amount" name="amount" required>
                    @error('amount')
                        <div class="alert alert-danger">{{ $message }}</div>
                    @enderror

                </div>

                <button type="submit" class="btn btn-primary">Perform Transaction</button>
            </form>
        </div>
    </div>
</div>

<style>
.content-container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: fit-content;
}

.account-info {
    background-color: #f9f9f9;
    padding: 10px;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    margin-top: 10%;
}

.account-info h4 {
    font-weight: bold;
    margin-bottom: 0%;
}

.account-info span {
    font-weight: bold;
    color: #333;
}

.custom-form {
    width: 400px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    margin-top: 5%;
}

</style>

@endsection
