@extends('layout') 
@section('title','History')
@section('content')


<h1 style="text-align: center;">History Of Transactions</h1>

<div class="row justify-content-center">
    <div class="col-auto">
        <table class="table table-bordered table-striped text-center"  style="width: max-content;">
        <thead>
            <tr>
            <th scope="col">Beneficiary Card Number</th>
            <th scope="col">Amount</th>
            <th scope="col">Date</th>
            </tr>
        </thead>
        <tbody>
        @foreach($history as $record)
            <tr>
            <td>{{ $record->beneficiary_no }}</td>
            <td>{{ $record->Amount }}</td>
            <td>{{ $record->created_at }}</td>
        @endforeach
           
        </tbody>
        </table>
    </div>
</div>
@endsection