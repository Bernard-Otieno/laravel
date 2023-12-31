<?php

use App\Http\Controllers\analyticsController;
use App\Http\Controllers\AuthManager;
use App\Http\Controllers\ChartController;
use App\Http\Controllers\LoanController;
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
Route::get('/loan-history', [LoanController::class, 'loanHistory'])->name('loans.history');

Route::get('/transaction', [AuthManager::class, 'transaction'])->name('transaction');
Route::post('/transaction', [AuthManager::class, 'transactionPost'])->name('transaction.post');

Route::get('/deposit', [AuthManager::class, 'deposit'])->name('deposit');

Route::get('/history', [AuthManager::class, 'history'])->name('history');

Route::get('/2fa-setup', [AuthManager::class, 'enable2FA'])->name('2fa.setup');

Route::get('/predict', [AuthManager::class, 'prediction'])->name('prediction');
Route::post('/predictions', [AuthManager::class, 'predictionPost'])->name('prediction.post');


Route::get('/payment', [AuthManager::class, 'payment'])->name('payment');
Route::post('/payment_made', [AuthManager::class, 'paymentPost'])->name('payment.post');

Route::get('/apply', function () {
    return view('account_apply');
})->name('apply');
Route::post('/account', [AuthManager::class, 'createBankAccount'])->name('account');

Route::get('/success_page', function () {
    return view('success_page'); // Adjust this to load your success page
})->name('success_page');

// Route::get('/index', function () {
//     return view('index'); // Adjust this to load your success page
// })->name('index');

Route::get('/fail_page', function () {
    return view('fail_page'); // Adjust this to load your success page
})->name('fail_page');


Route::get('/index', [ChartController::class, 'chart1Data'])->name('index');
Route::post('/loan_apply', [LoanController::class, 'loanPost'])->name('loan.post');

Route::get('/analytics', [analyticsController::class, 'index'])->name('analytics.login');
Route::post('/admin/analytics',[analyticsController::class, 'authenticateAdmin'] )->name('analytics.post');

Route::get('/analytics/home', [analyticsController::class, 'accountStatistics'])->name('analytics.Home');
Route::get('/analytics/credit_card', [analyticsController::class, 'cardStatistics'])->name('analytics.card');
Route::get('/analytics/loan', [analyticsController::class, 'loanStatistics'])->name('analytics.loan');
Route::get('/analytics/logout',  [analyticsController::class, 'logout'])->name('analytics.logout');




