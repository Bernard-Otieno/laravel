@extends('adminHeader') 
@section('title', 'Card Statistics')
@section('content')
    <div class="container mt-5">
        <h1 class="text-center">Card Statistics</h1>

        <div class="row mt-4">
            <div class="col-md-6">
                <!-- Display Total Cards, Total Card Amount, Average Card Amount -->
                <h4>Total Cards: {{ $totalCards }}</h4>
                <h4>Total Card Amount: ${{ $totalAmount }}</h4>
                <h4>Average Card Amount: ${{ number_format($averageAmount, 2) }}</h4>
            </div>
        </div>

        <!-- Display Chart for Card Amounts -->
        <div class="row mt-4">
            <div class="col-md-8">
                <canvas id="cardAmountChart"></canvas>
            </div>
        </div>

        <!-- Display Card Details -->
        <div class="row mt-4">
            <div class="col-md-8">
                <h2>Card Details</h2>
                <table class="table table-bordered">
                    <!-- Table Header -->
                    <thead>
                        <tr>
                            <th>Card Number</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <!-- Table Body -->
                    <tbody>
                        @foreach($cardDetails as $card)
                            <tr>
                                <td>{{ $card->card_no }}</td>
                                <td>${{ $card->Amount }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Include Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- JavaScript for Card Amount Chart -->
    <script>
        // Get card details data from the controller to create the chart
        var cardNumbers = {!! json_encode($cardNumbers) !!};
        var cardAmounts = {!! json_encode($cardAmounts) !!};

        // Create a chart using Chart.js
        var ctx = document.getElementById('cardAmountChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: cardNumbers,
                datasets: [{
                    label: 'Card Amounts',
                    data: cardAmounts,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
@endsection
