<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::get('/', 'PublicController@index');
Route::get('/status-json', 'PublicController@json');

Auth::routes();

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', 'OperatorController@index')->name('dashboard');
    Route::post('/status/update', 'OperatorController@updateStatus')->name('status.update');
    Route::resource('employees', 'EmployeeController');
});
