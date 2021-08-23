<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    $isGuest = Auth::guest();
    return $isGuest ? view('login', ['success' => true]) : redirect()->route('events');
})->name('login');

Route::post('/', function (Request $request) {
    $email = $request->post('email');
    $pass = $request->post('password');

    $success = Auth::attempt(['email' => $email, 'password' => $pass]);

    return $success ? redirect()->route('events') : view('login', ['success' => false]);
});

Route::middleware('auth')->get('/logout', function () {
    Auth::logout();
    return redirect()->route('login');
})->name('logout');

Route::middleware('auth')->get('/events', 'EventController@page')->name('events');
Route::middleware('auth')->get('/events/new', 'EventController@create')->name('new');
Route::middleware('auth')->post('/events/new', 'EventController@store');

Route::middleware('auth')->get('/events/{event}', 'EventController@detail')->name('detail');
Route::middleware('auth')->get('/events/{event}/edit', 'EventController@edit')->name('edit');
Route::middleware('auth')->put('/events/{event}/edit', 'EventController@update');

Route::middleware('auth')->get('/events/{event}/tickets', 'EventTicketController@create')->name('tickets');
Route::middleware('auth')->post('/events/{event}/tickets', 'EventTicketController@store');

Route::middleware('auth')->get('/events/{event}/channels', 'ChannelController@create')->name('channels');
Route::middleware('auth')->post('/events/{event}/channels', 'ChannelController@store');

Route::middleware('auth')->get('/events/{event}/rooms', 'RoomController@create')->name('rooms');
Route::middleware('auth')->post('/events/{event}/rooms', 'RoomController@store');

Route::middleware('auth')->get('/events/{event}/sessions', 'SessionController@create')->name('sessions');
Route::middleware('auth')->post('/events/{event}/sessions', 'SessionController@store');
