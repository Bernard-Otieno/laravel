<!-- loan_statistics.blade.php -->
@extends('adminHeader') 
@section('title', 'Loan Statistics')
@section('content')
    <div class="container mt-5">
        <h1 class="text-center">Loan Statistics</h1>

        <div class="row mt-4">
            <div class="col-md-6">
                <!-- Display Total Loans, Total Loan Amount, Average Loan Amount -->
                <h4>Total Loans: {{ $totalApplications }}</h4>
                <h4>Total Loan Amount: ${{ $totalLoanAmount }}</h4>
                <h4>Average Loan Amount: ${{ number_format($averageLoanAmount, 2) }}</h4>
            </div>
        </div>

        <!-- Display Chart for Loan Amounts -->
        <div class="row mt-4">
            <div class="col-md-8">
                <canvas id="loanAmountChart"></canvas>
            </div>
        </div>

        <!-- Display Loan Details -->
        <div class="row mt-4">
            <div class="col-md-8">
                <h2>Loan Details</h2>
                <table class="table table-bordered">
                    <!-- Table Header -->
                    <thead>
                        <tr>
                            <th>Loan ID</th>
                            <th>Loan Amount</th>
                        </tr>
                    </thead>
                    <!-- Table Body -->
                    <tbody>
                        @foreach($loanDetails as $loan)
                            <tr>
                                <td>{{ $loan->id }}</td>
                                <td>${{ $loan->amount }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Include Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- JavaScript for Loan Amount Chart -->
    <script>
        // Get loan details data from the controller to create the chart
        var loanIDs = {!! json_encode($loanIDs) !!};
        var loanAmounts = {!! json_encode($loanAmounts) !!};

        // Create a chart using Chart.js
        var ctx = document.getElementById('loanAmountChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: loanIDs,
                datasets: [{
                    label: 'Loan Amounts',
                    data: loanAmounts,
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderColor: 'rgba(255, 99, 132, 1)',
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
