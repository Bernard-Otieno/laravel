@extends('layout') 
@section('title','My home')
@section('content')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <div class="container d-flex justify-content-center align-items-center vh-100" style="margin-top: 200px;">
        <div class="content-container text-center">
            <div class="container mt-5">
                <div class="row justify-content-around">
                    <div class="col-md-6 offset-md-1">
                        <canvas id="myChart" width="400" height="400"></canvas>
                    </div>
                    <div class="col-md-6"style="margin-top: 70px;">
                        <canvas id="pieChart" width="400" height="400"></canvas>
                        </div>
                    </div>
        </div>
    </div>
</div>

<script>//bar chart
   // Your retrieved chartData from the controller
   var chartData = {!! json_encode($chartData) !!};

// Extract data from chartData to plot the chart using Chart.js
var labels = chartData.map(data => data.created_at);
var amounts = chartData.map(data => data.Amount);

// Create the chart using Chart.js
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: labels,
        datasets: [{
            label: 'Transaction Amounts',
            data: amounts,
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    },
    options: {
        // Add any additional options for your chart here
    }
});
</script>




<script>// pie chart
// Assuming you have an array of card numbers as labels
var cardNumbers = @json($labels);

// Convert the card number array to labels with the "Card Number" prefix
var labeledCardNumbers = cardNumbers.map(function(number) {
    return 'Card Number ' + number;
});

// Use the labeledCardNumbers as the updated labels array
var pieLabels = labeledCardNumbers;
var pieValues = @json($values);

if (pieLabels[0] === "" || pieLabels[0] === null) {
    pieLabels.shift();
    pieValues.shift();
}

console.log(pieLabels);
console.log(pieValues);
    var ctx = document.getElementById('pieChart').getContext('2d');

    // var pieLabels = {!! json_encode($labels) !!}; // Using PHP to encode the labels array into JSON
    // var pieValues = {!! json_encode($values) !!}; // Using PHP to encode the values array into JSON

var pieData = {
    labels: pieLabels,
    datasets: [{
        data: pieValues,
        backgroundColor: [
            'rgba(255, 99, 132, 0.7)',
            'rgba(54, 162, 235, 0.7)',
            'rgba(255, 206, 86, 0.7)',
            // Add more colors if needed
        ],
        borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            // Add more colors if needed
        ],
        borderWidth: 1
    }]
};

var pieOptions = {
    // Add your pie chart options here
};

// Get the canvas element for the pie chart
var pieCtx = document.getElementById('pieChart').getContext('2d');

// Create the pie chart
var myPieChart = new Chart(pieCtx, {
    type: 'pie',
    data: pieData,
    options: pieOptions
});

</script>



@endsection
