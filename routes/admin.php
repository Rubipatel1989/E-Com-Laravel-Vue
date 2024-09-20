<?php

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\HomeBannerController;
use App\Http\Controllers\Admin\ProfileController;
use App\Models\HomeBanner;
use Illuminate\Support\Facades\Route;


Route::get('/dashboard', function () {
       return view('admin/index');
});
## Profile Section
Route::get('/profile', [ProfileController::class, 'index']);
Route::post('/saveProfile', [ProfileController::class, 'store']);
## Home Banner
Route::get('/home_banner', [HomeBannerController::class, 'index']);
Route::post('/updateHomeBanner', [HomeBannerController::class, 'store']);

### Delete using common function
Route::get('/deleteData/{id?}/{table?}', [DashboardController::class, 'deleteData']);
