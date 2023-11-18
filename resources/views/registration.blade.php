@extends('layout') 
@section('title','Register')
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
 

    <form action="{{route('registration.post')}}" method="POST" class="ms-auto me-auto mt-3" style="width: 500px;">
    @csrf
    <div class="mb-3">
        <label class="form-label">First Name</label>
        <input type="text" class="form-control" name="First_Name" required>
    </div>
    <div class="mb-3">
        <label  class="form-label">Second Name</label>
        <input type="text" class="form-control" name="Second_Name" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Email address</label>
        <input type="email" class="form-control" name="email" required>
        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
    </div>
    <div class="mb-3">
        <label  class="form-label">Password</label>
        <input type="password" class="form-control" name="password" required>
    </div>
    
    <button type="submit" name="submit" class="btn btn-primary">Submit</button>
    </form>

</div> 

@endsection