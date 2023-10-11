@extends('layout') 
@section('title','Home')
@section('content')

    @auth
    {{auth()->user()->First_Name}}
    @endauth

@endsection