<nav class="navbar navbar-light bg-light">
  <form class="container-fluid justify-content-start">
    <ul>
    <button class="btn btn-outline-success me-2" type="button">{{config('app.name')}}</button>
    <a href="{{route('home')}}"> </a>
    <button class="btn btn-sm btn-outline-primary" type="button">
     Home</button>
      @auth
    <a href="{{route('logout')}}">
    <button class="btn btn-sm btn-outline-danger" type="button">
      logout</button></a>
      @else
       <a href="{{route('login')}}"> 
        <button class="btn btn-sm btn-outline-primary" type="button">
        Login</button></a>

      <a href="{{route('registration')}}">
    <button class="btn btn-sm btn-outline-primary" type="button">
      Register</button></a>
      @endauth
    </ul>
    <!-- <span class="navbar-text"> @auth{{auth()->user()->First_Name}}@endauth</span> -->
  </form>
</nav>