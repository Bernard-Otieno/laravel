@extends('layout') 
@section('title','payment')
@section('content')
<style>
    /* Custom CSS to center the form horizontally */
    .form-container {
        display: flex;
        justify-content: center;
    }
    .custom-form {
        width: 80%; /* Adjust the width as needed */
    }
</style>
<div class="container mt-5">
    <div class="form-container">
        <form id="predictionForm" class="ms-auto me-auto mt-3" style="width: 500px;">
            @csrf
            <div>
                <label for="type"> Type:</label>
               <p>1.Cash out 2.Payment 3.Cash in 4.transfer 5.Debit</p>
                <input type="number" id="type" name="type" required>
            </div>

            <div>
                <label for="oldBalance">Old Balance:</label>
                <input type="text" id="oldBalance" name="oldBalance" required>
            </div>

            <div>
                <label for="newBalance">New Balance:</label>
                <input type="text" id="newBalance" name="newBalance" required>
            </div>

            <div>
                <label for="amount">Amount:</label>
                <input type="text" id="amount" name="amount" required>
            </div>

            <div>
                <button type="button" onclick="submitForm()">Submit</button>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function submitForm() {
        // Get form data
        var formData = {
            type: $("#type").val(),
            oldBalance: $("#oldBalance").val(),
            newBalance: $("#newBalance").val(),
            amount: $("#amount").val(),
            _token: $("input[name='_token']").val(),
        };

        // Construct the URL with appended parameters
    var url = "http://127.0.0.1:5000/prediction/" +
             formData.type +
        "/" + formData.amount +
        "/" + formData.oldBalance +
        "/" + formData.newBalance;
      


        // Send AJAX request to Flask API
        $.ajax({
            type: "GET",
            url: url,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(formData),
            success: function (data) {
                // Handle the success response
                console.log("Success:", data);
            },
            error: function (error) {
                // Handle the error response
                console.error("Error:", error);
            },
        });
    }
</script>

@endsection
