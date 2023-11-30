@extends('layout') 
@section('title','login')
@section('content')
<div class="container" style="font-size: medium;">
    <div class="mt-5">
            @if($errors->any())
        <div class="col-12">
            @foreach($errors->all() as $error)
            <div class="alert alert-danger">{{$error}}</div>
            @endforeach
        </div>
            @endif
            
        @if(session()->has ('error'))
        <div class="alert alert-danger">{{session('error')}}</div>
        @endif
        @if(session()->has ('success'))
        <div class="alert alert-danger">{{session('success')}}</div>
        @endif
    </div>

    <form action="{{route('login.post')}}" method="post" class="ms-auto me-auto" style="width: 500px; margin-top: 15%;">
    @csrf
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp">
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
    </div>
    <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" name="password" class="form-control" id="exampleInputPassword1">
    </div>
    
    <button type="submit" name="login" class="btn btn-primary">Submit</button>
    </form>

</div> 

@endsection