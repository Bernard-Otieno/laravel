<nav class="sidebar">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a href="{{route('index')}}" class="nav-link">Home</a>
        </li>
        <li class="nav-item">
            <a href="{{route('loans')}}" class="nav-link">Apply for Loan</a>
        </li>
                    <li class="nav-item">
                        <a href="{{route('payment')}}" class="nav-link text-white">
                            <i class="bi bi-credit-card"></i> <span class="ms-1 d-none d-sm-inline">Transact</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('history')}}" class="nav-link text-white">
                            <i class="bi bi-journal-check"></i> <span class="ms-1 d-none d-sm-inline">View Your History</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('loans.history')}}" class="nav-link text-white">
                            <i class="bi bi-shield-lock-fill"></i> <span class="ms-1 d-none d-sm-inline">My Loan History</span>
                        </a>
                    </li>
                </ul>
</nav>

    <style>
 /* Style for the sidebar */
.sidebar {
    position: fixed;
    top: 70px; /* Adjust based on the height of the top navbar */
    left: 0;
    bottom: 0;
    width: 200px; /* Adjust the width as needed */
    background-color: #000; /* Set sidebar background color */
    /* Additional styling for the sidebar */
}
/* Style for the list items */
.navbar-nav {
    list-style: none; /* Remove default list styles */
    margin: 0;
    padding: 0;
}

/* Style for individual navbar items */
.nav-item {
    margin-bottom: 10px; /* Adjust spacing between items */
}

/* Style for the navbar links */
.nav-link {
    display: block;
    padding: 10px;
    color: #fff; /* Set text color */
    text-decoration: none; /* Remove underline */
    font-size: 16px; /* Adjust font size */
}

/* Hover effect for links */
.nav-link:hover {
    background-color: #555; /* Change background color on hover */
}

    </style>
