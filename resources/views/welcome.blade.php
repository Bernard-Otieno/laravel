@extends('layout') 
@section('title','Home')
@section('content')

    <!-- Link to your custom CSS -->
    <style>
         
        /* Custom CSS for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 3%;
            padding: 0;
        }
        .header {
            background-color: #0066CC;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            margin: 20px auto;
            padding: 20px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        .description {
            margin-bottom: 20px;
            font-size: 18px;
        }
        .testimonial {
            border: 1px solid #ccc;
            padding: 15px;
            margin-bottom: 15px;
            font-size: 14px;
        }
        .model-details {
            margin-top: 20px;
            font-size: 16px;
        }
    </style>
</head>
<body>

    <!-- Header Section -->
    <div class="header">
        <h1>Welcome to Our Banking App</h1>
        <p>Specialized in Fraud Detection with Random Forest Model</p>
    </div>

    <!-- Main Content Section -->
    <div class="container">
        <div class="description">
            <h2>About Our Banking App</h2>
            <p>Here's a brief description of our banking app and its unique features...</p>
        </div>

        <!-- Testimonials Section -->
        <div class="testimonial">
            <h2>Testimonials</h2>
            <p>Testimonial 1: "The banking app helped me..."</p>
            <p>Testimonial 2: "I've never experienced such..."</p>
            <!-- Add more testimonials as needed -->
        </div>

        <!-- Model Details Section -->
        <div class="model-details">
            <h2>Model Accuracy and Explanation</h2>
            <p>Our Random Forest model achieves an accuracy rate of XX%...</p>
            <p>Detailed explanation of the model and how it detects fraudulent transactions...</p>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>Contact us for more information...</p>
    </footer>

</body>
</html>

   
@endsection