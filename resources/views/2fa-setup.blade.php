@extends('layout') 
@section('title','2FA')
@section('content')
<style>
    /* Center the text within the <p> elements */
    .centered {
        text-align: center;
    }

    /* Center the QR code and text within the .qr-code-container */
    .qr-code-container {
        text-align: center;
    }

    /* Style the QR code image (optional) */
    .qr-code-container img {
        display: block; /* Remove any potential extra spacing around the image */
        margin: 0 auto;  /* Center the image horizontally */
    }
</style>
<div class="content">
    <p class="centered">Scan the QR code below using your authenticator app:</p>

    <p class="centered">2FA Secret Key: <strong>{{ $secretKey }}</strong></p>
    <div class="qr-code-container">
        <img src="{{ $qrCodeUrl }}" alt="2FA QR Code">
    </div>
</div>

@endsection
