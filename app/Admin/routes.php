<?php

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
    $router->resource('customer', Customer_controller::class);
    $router->resource('accounts', accounts_controller::class);
    $router->resource('credit_-cards', card_Controller::class);
    $router->resource('report-transactions', reportTransaction_controller::class);

});
