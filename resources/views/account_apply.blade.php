@extends('layout') 
@section('title','Register')
@section('content')

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Apply for an Account</title>
</head>

<body>
    <h1>Welcome to Our Bank</h1>

    <p>
        Applying for an account with us means you'll have access to various financial services and benefits.
        Please fill out the form below to apply for an account.
    </p>

    <form action="{{route('account')}}" method="post">
        @csrf <!-- Laravel Blade syntax for CSRF protection -->
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="agree">I agree to apply for an account:</label>
        <input type="checkbox" id="agree" name="agree" required><br><br>

        <button type="submit">Apply</button>
    </form>
</body>

</html>




@endsection