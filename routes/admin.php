<?php

use App\Http\Controllers\Admin\AttributeController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ColorController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\HomeBannerController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\SizeController;
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
## Size Manage
Route::get('/manage_size', [SizeController::class, 'index']);
Route::post('/updateSize', [SizeController::class, 'store']);
## Color Manage
Route::get('/manage_color', [ColorController::class, 'index']);
Route::post('/updateColor', [ColorController::class, 'store']);
## Attribute Manage
Route::get('/attribute_name', [AttributeController::class, 'index_attribute_name']);
Route::post('/updateAttributeName', [AttributeController::class, 'store_attribute_name']);
Route::get('/attribute_value', [AttributeController::class, 'index_attribute_value']);
Route::post('/updateAttributeValue', [AttributeController::class, 'store_attribute_value']);
## Category Manage
Route::get('/manage_category', [CategoryController::class, 'index']);
Route::post('/updateCategory', [CategoryController::class, 'store']);
Route::get('/category_attribute', [CategoryController::class, 'index_category_attribute']);
Route::post('/updateCategoryAttribute', [CategoryController::class, 'store_category_attribute']);

### Delete using common function
Route::get('/deleteData/{id?}/{table?}', [DashboardController::class, 'deleteData']);
