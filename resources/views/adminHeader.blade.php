
<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Your custom styles -->
    <style>
        /* Custom styles for navigation */
        .navbar {
            background-color: #333;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: white;
        }
    </style>
</head>
<body>

<!-- Navigation bar -->
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">FraudShield</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="{{ route('analytics.Home') }}">Accounts</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('analytics.card') }}">Credit Cards</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('analytics.loan') }}">Loans</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('analytics.logout') }}">logout</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Page content -->
@yield('content')

<!-- Include Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
