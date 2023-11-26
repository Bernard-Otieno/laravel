@extends('layout') 
@section('title','Transaction Failed')
@section('content')
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        /* Center content vertically and horizontally */
        .container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 12%; /* Adjust the value to shift more to the right */

        }

        /* Card styles */
        .card {
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Large X mark icon styles */
        .tick-icon {
            font-size: 500%;
            color: #dc3545; /* Red color for error */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <i class="fas fa-times-circle tick-icon"></i>
            <h1 class="mt-3 mb-4">Transaction Failed</h1>
            <p>Your transaction could not be processed.</p>
        </div>
    </div>

    <!-- Include Font Awesome for the X icon -->
    <script src="https://kit.fontawesome.com/your-font-awesome-kit-id.js" crossorigin="anonymous"></script>

@endsection