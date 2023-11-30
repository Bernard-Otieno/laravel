@extends('layout') 
@section('title','Loan History')
@section('content')


<h1 style="text-align: center;">History Of Loan Applications</h1>

<div class="row justify-content-center">
    <div class="col-auto">
        <table class="table table-bordered table-striped text-center"  style="width: max-content;">
        <thead>
            <tr>
            <th scope="col">Your Loan Purpose</th>
            <th scope="col">Loan Amount Requested</th>
            <th scope="col">Date of Request</th>
            </tr>
        </thead>
        <tbody>
        @foreach($history as $record)
            <tr>
            <td>{{ $record->loan_purpose }}</td>
            <td>{{ $record->amount }}</td>
            <td>{{ $record->created_at }}</td>
        @endforeach
           
        </tbody>
        </table>
    </div>
</div>
@endsection