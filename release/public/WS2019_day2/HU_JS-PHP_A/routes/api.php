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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/events', 'EventController@index');
Route::get('/organizers/{organizer_slug}/events/{events_slug}', 'EventController@show');
Route::post('/login', 'AttendeeController@login');
Route::post('/logout', 'AttendeeController@logout');
Route::post('/organizers/{organizer_slug}/events/{events_slug}/registration', 'RegistrationController@store');
Route::get('/registrations', 'RegistrationController@index');
