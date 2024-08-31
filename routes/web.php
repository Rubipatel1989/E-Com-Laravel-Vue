<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AuthController;
use App\Http\Controllers\auth\authController as AuthAuthController;
use Illuminate\Support\Facades\Auth;

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
    return redirect('admin/dashboard');
});

//Route::get('/createAdmin',[AuthController::class, 'createCustomer']);

Route::get('/login', function () {
    return view('auth/signIn');
});
Route::post('/login_user', [AuthAuthController::class, 'loginUser']);
Route::get('/logout', function () {
    Auth::logout();
    return redirect('/login');
});
