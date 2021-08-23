<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
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
    return view('welcome');
});
Route::post('/', function (Request $request) {
    $filename = $request->file('image')->storePublicly('public');
    return redirect()->route('crop', ['filename' => $filename]);
});
Route::get('/crop', function (Request $request) {
    $filename = $request->get('filename');
    $url = env('APP_URL') . Storage::url($filename);
    return view('crop', ["url" => $url, "filename" => $filename]);
})->name('crop');
Route::post('/crop', function (Request $request) {
    $filen = str_replace("data:image/png;base64,", "", $request->post('filen'));
    $filename = str_replace("public/", "", $request->get("filename"));
    $params = json_decode($request->post('params'), true);

    // nem működik:
    // imagecrop(Storage::get($request->get("filename")), $params);

    $asd = "public/crop_".$filename;
    Storage::put($asd, $filen);

    return '<img src="'.env('APP_URL') . Storage::url($asd).'"><button>Download</button>';
});
