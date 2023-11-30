@extends('adminHeader') 
@section('title','predict')
@section('content')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Add a container to control the size of the chart -->
<div class="chart-container" style="position: relative; height:400px; width:80vw;">
    <canvas id="balanceDistributionChart"></canvas>
</div>

<script>
    // Get the balance distribution data passed from the controller
    var balanceLabels = @json($balanceLabels);
    var balanceData = @json($balanceData);

    // Create the doughnut chart
    var ctx = document.getElementById('balanceDistributionChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: balanceLabels,
            datasets: [{
                label: 'Account Balance Distribution',
                data: balanceData,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.5)',
                    'rgba(54, 162, 235, 0.5)',
                    'rgba(255, 206, 86, 0.5)',
                    'rgba(75, 192, 192, 0.5)'
                    // Add more colors if needed
                ],
                borderWidth: 1
            }]
        },
        options: {
            // Add any additional chart options here
        }
    });
</script>

@endsection
