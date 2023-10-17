@extends('layout') 
@section('title','Deposit')
@section('content')
<form action="#" class="ms-auto me-auto mt-3" style="width: 500px;">
@csrf
            <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">Account</span>
            <input type="text" class="form-control" placeholder="Account_no">

            <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Your Email">
            <span class="input-group-text" id="basic-addon2">@example.com</span>
            </div>

           
            <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
            <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
            </div>

            <div class="input-group mb-3">
            <span class="input-group-text" >$</span>
            <input type="text" class="form-control"placeholder="Amount" >
            <span class="input-group-text">.00</span>
            </div>

            <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="card_no">
            <span class="input-group-text">@</span>
            <input type="text" class="form-control" placeholder="CVV">
            </div>

            <div class="input-group">
            <span class="input-group-text">With textarea</span>
            <textarea class="form-control" aria-label="With textarea"></textarea>
            </div>
</form>
@endsection