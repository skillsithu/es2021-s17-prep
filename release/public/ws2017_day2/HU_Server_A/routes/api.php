<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/auth/login', 'AuthController@login');
Route::middleware('auth:api')->get('/auth/logout', 'AuthController@logout');

Route::get('/place', 'PlaceController@index');
Route::get('/place/{place}', 'PlaceController@show');
Route::middleware('auth:api')->post('/place', 'PlaceController@store');
Route::middleware('auth:api')->put('/place/{place}', 'PlaceController@update');
Route::middleware('auth:api')->delete('/place/{place}', 'PlaceController@destroy');

Route::middleware('auth:api')->resource('/schedule', 'ScheduleController');

Route::get('/route/search/{from}/{to}/{time?}', 'RouteController@search');
Route::middleware('auth:api')->post('/route/selection', 'RouteController@selection');
