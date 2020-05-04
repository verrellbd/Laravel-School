<?php

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

use App\Http\Controllers\SiswaController;
use Illuminate\Support\Facades\Route;

Route::get('/', 'SiteController@home');
Route::get('/register', 'SiteController@register');
Route::post('/postregister', 'SiteController@postregister');
Route::get('/about', 'SiteController@about');


Route::get('/login', 'AuthController@login')->name('login');
Route::post('/postlogin', 'AuthController@postlogin');
Route::get('/logout', 'AuthController@logout');

Route::group(['middleware' => ['auth', 'checkRole:admin']], function () {
    Route::get('/siswa', 'SiswaController@index');
    Route::post('/siswa/create', 'SiswaController@create');
    Route::get('/siswa/{id}/edit', 'SiswaController@edit');
    Route::post('/siswa/{siswa}/update', 'SiswaController@update');
    Route::get('/siswa/{siswa}/delete', 'SiswaController@delete');
    Route::get('/siswa/{siswa}/profile', 'SiswaController@profile');
    Route::post('/siswa/{id}/addscore', 'SiswaController@addscore');
    Route::get('/siswa/{id}/{idmapel}/deletescore', 'SiswaController@deletescore');
    Route::get('/siswa/exportExcel', 'SiswaController@exportExcel');
    Route::get('/siswa/exportPdf', 'SiswaController@exportPdf');
    Route::post('/siswa/import', 'SiswaController@importExcel')->name('siswa.import');
    Route::get('/guru/{id}/profile', 'GuruController@profile');
    Route::get('/posts', 'PostController@index');
    Route::get('post/add', [
        'uses' => 'PostController@add',
        'as' => 'posts.add'
    ]);
    Route::post('post/create', [
        'uses' => 'PostController@create',
        'as' => 'posts.create'
    ]);
});

Route::group(['middleware' => ['auth', 'checkRole:admin,siswa']], function () {
    Route::get('/dashboard', 'DashboardController@index');
});

Route::group(['middleware' => ['auth', 'checkRole:siswa']], function () {
    Route::get('/profilsaya', 'SiswaController@profilsaya');
});


Route::get('getdatasiswa', [
    'uses' => 'SiswaController@getdatasiswa',
    'as' => 'ajax.get.data.siswa'
]);

Route::get('/{slug}', [
    'uses' => 'SiteController@singlepost',
    'as' => 'site.single.post'
]);
