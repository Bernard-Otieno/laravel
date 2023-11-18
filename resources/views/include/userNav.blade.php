<div class="container-fluid" style="height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 50px;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">Menu</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="{{route('home')}}" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('loans')}}" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">Apply for Loan</span> 
                        </a>
                    </li>
                    <li>
                        <a href="{{route('deposit')}}" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">Deposit</span></a>
                    </li>
                    <li>
                        <a href="{{route('payment')}}" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">Make a Payment</span>
                        </a>
                        
                    </li>
                    <li>
                        <a href="{{route('history')}}" name="history"  class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-grid"></i> <span class="ms-1 d-none d-sm-inline">View Your History</span>
                         </a>
                           
                    </li>
                    <li>
                        <a href="{{route('2fa.setup')}}" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">2FA setup</span> </a>
                    </li>
                </ul>
                <hr>
            </div>
        </div>
        
    </div>
</div>
    <style>
        /* Custom CSS to center the form horizontally */
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center; /* Vertically align the form */
            height: 100vh; /* Adjust the height for centering vertically */
        }

        .custom-form {
            width: 400px; /* Adjust the width as needed */
            padding: 20px; /* Add padding for better readability */
            border: 1px solid #ccc; /* Optional: Add a border */
            border-radius: 5px; /* Optional: Add border radius */
            background-color: #f9f9f9; /* Optional: Add background color */
        }

        /* Adjust the font size and weight for labels */
        .form-label {
            font-size: 16px; /* Adjust the font size */
            font-weight: normal; /* Set font weight to normal */
        }

        /* Adjust the font size and weight for form inputs */
        .form-control {
            font-size: 14px; /* Adjust the font size */
            font-weight: normal; /* Set font weight to normal */
        }

        /* Adjust the font size and weight for paragraphs */
        p {
            font-size: 14px; /* Adjust the font size */
            font-weight: normal; /* Set font weight to normal */
        }
    </style>
