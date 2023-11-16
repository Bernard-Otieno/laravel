<?php

use App\Http\Controllers\AuthManager;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
})->name('home');

Route::get('/login', [AuthManager::class, 'login'])->name('login');
Route::post('/login', [AuthManager::class, 'loginPost'])->name('login.post');

Route::get('/registration', [AuthManager::class, 'registration'])->name('registration');
Route::post('/registration', [AuthManager::class, 'registrationPost'])->name('registration.post');

Route::get('/logout', [AuthManager::class, 'logout'])->name('logout');

Route::get('/loans', [AuthManager::class, 'loans'])->name('loans');

Route::get('/transaction', [AuthManager::class, 'transaction'])->name('transaction');
Route::post('/transaction', [AuthManager::class, 'transactionPost'])->name('transaction.post');

Route::get('/deposit', [AuthManager::class, 'deposit'])->name('deposit');

Route::get('/history', [AuthManager::class, 'history'])->name('history');

Route::get('/2fa-setup', [AuthManager::class, 'enable2FA'])->name('2fa.setup');

Route::get('/predict', [AuthManager::class, 'prediction'])->name('prediction');
Route::post('/predictions', [AuthManager::class, 'predictionPost'])->name('prediction.post');



