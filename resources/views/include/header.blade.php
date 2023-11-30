<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="{{ route('home') }}">FraudShield</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                @auth
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('logout') }}">Logout</a>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('login') }}">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('registration') }}">Register</a>
                </li>
                @endauth
            </ul>
            <span class="navbar-text">
                @auth
                {{ auth()->user()->First_Name }}
                @endauth
            </span>
        </div>
    </div>
</nav>
<style>
/* Custom CSS for navbar */
.navbar {
    background-color: #000;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000; /* Change background color */
}

.navbar-brand,
.navbar-nav .nav-link {
    color: white; /* Set text color */
}

.navbar-brand:hover,
.navbar-nav .nav-link:hover {
    color: lightgray; /* Change text color on hover */
}
</style>