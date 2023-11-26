@extends('layout') 
@section('title','My home')
@section('content')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>






    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="content-container text-center">
            <div class="container mt-5">
                <div class="row justify-content-around">
                    <div class="col-md-6 offset-md-1">
                        <canvas id="lineChart1" width="300" height="200"></canvas>
                    </div>
                    <div class="col-md-6">
                        <canvas id="lineChart2" width="300" height="200"></canvas>
                        </div>
                    </div>
        </div>
    </div>
</div>

    <script>
        // Get the canvas elements
        var ctx1 = document.getElementById('lineChart1').getContext('2d');
        var ctx2 = document.getElementById('lineChart2').getContext('2d');

        // Data for the charts
        var chartData1 = {
            labels: ['January', 'February', 'March', 'April', 'May'],
            datasets: [{
                label: 'Sample Line Chart 1',
                data: [10, 25, 15, 30, 20],
                borderColor: 'blue',
                backgroundColor: 'transparent',
            }]
        };

        var chartData2 = {
            labels: ['June', 'July', 'August', 'September', 'October'],
            datasets: [{
                label: 'Sample Line Chart 2',
                data: [5, 20, 10, 15, 25],
                borderColor: 'red',
                backgroundColor: 'transparent',
            }]
        };

        // Configuration options for the charts
        var chartOptions = {
            responsive: true,
            maintainAspectRatio: false,
        };

        // Create the charts
        var myLineChart1 = new Chart(ctx1, {
            type: 'line',
            data: chartData1,
            options: chartOptions
        });

        var myLineChart2 = new Chart(ctx2, {
            type: 'line',
            data: chartData2,
            options: chartOptions
        });
    </script>
@endsection
