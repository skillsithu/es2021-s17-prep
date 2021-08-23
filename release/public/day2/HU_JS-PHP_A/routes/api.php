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

Route::get('/events', 'EventController@index');
Route::get('/organizers/{organizer_slug}/events/{event_slug}', 'OrganizerController@event');
Route::post('/organizers/{organizer_slug}/events/{event_slug}/registration', 'RegistrationController@store');
Route::get('/registrations', 'RegistrationController@index');
Route::post('/login', function() { return response()->json([]); });
Route::post('/logout', function() { return response()->json([]); });
