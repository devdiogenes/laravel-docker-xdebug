<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    $test = "abc";
    return view('welcome');
});
