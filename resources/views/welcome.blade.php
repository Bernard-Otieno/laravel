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
            background: linear-gradient(to right, #00c6ff, #0072ff); /* Gradient background */
            color: white; /* Text color */
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
<div class="header">
    <h1>FraudShield: Fortifying Financial Transactions</h1>
    <h5>Securing Transactions, Unveiling Insights</h5>
</div>


    <!-- Main Content Section -->
    <div class="container">
        <div class="description">
            <h2>About FraudShield</h2>
            <p>FraudShield is an innovative application designed to fortify financial transactions by
               leveraging advanced technologies to detect and prevent fraudulent activities. 
               With robust algorithms and data analysis, it ensures the security and integrity of financial
               operations. Its user-friendly interface provides an intuitive experience, empowering users 
               to navigate through various financial activities securely and efficiently.</p>
        </div>

        <!-- Testimonials Section -->
        <div class="testimonial">
            <h2>Testimonials</h2>
            <img src="data:image/jpeg;base64,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" alt="Image Description" width="200" height="100">
            <h5>Maria S. - Business Owner</h5>
            <p>FraudShield has been a game-changer for my business. It provides an unparalleled level of 
                security and peace of mind when it comes to financial transactions. I'm amazed at its
                accuracy in detecting and preventing fraudulent activities, allowing me to focus on growing 
                my business worry-free.</p>

        <img src="data:image/jpeg;base64,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" alt="Image Description" width="200" height="100">
            <h5>John D. - Regular User</h5>
            <p>Using FraudShield has been an incredible experience. 
               I feel confident in every transaction I make, knowing that my financial security is in safe hands. 
               The app's user-friendly interface makes it easy to navigate, and the robust security
               measures give me peace of mind.</p>
            <!-- Add more testimonials as needed -->
        </div>

        <!-- Model Details Section -->
       
    </div>

    <!-- Footer Section -->
    <footer>
        <p>Contact us for more information </p>
       <h4>
         <ul>
            <li>contact@fraudshield.com </li>
            <li> Twitter: @FraudShieldHQ </li>
             <li>Facebook: facebook.com/FraudShieldOfficial </li>
             <li> Phone: +1-800-123-4567 </li>
             <li> Address: 1234 Fraud Street, Cyber City, Fraudland </li>
        </ul> 
    </h4>
    </footer>

</body>
</html>

   
@endsection