<?php

use App\Admin\Controllers\Loan_application;
use App\Admin\Controllers\User_controller1;
use App\Models\User;
use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');
    $router->resource('customers', User_controller::class);
    $router->resource('accounts', accounts_controller::class);
    $router->resource('credit_-cards', card_Controller::class);
    $router->resource('report-transactions', reportTransaction_controller::class);
    $router->resource('transactions', transaction_controller::class);
    $router->resource('loans', Loan_application::class);


});
