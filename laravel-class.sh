#!/bin/bash
#"_       __ ______ __    ______ ____   __  ___ ______   __  ___ ____      ___     __  _    __ ___ 
#| |     / // ____// /   / ____// __ \ /  |/  // ____/  /  |/  // __ \    /   |   / / | |  / //   |
#| | /| / // __/  / /   / /    / / / // /|_/ // __/    / /|_/ // /_/ /   / /| |  / /  | | / // /| |
#| |/ |/ // /___ / /___/ /___ / /_/ // /  / // /___   / /  / // _, _/_  / ___ | / /___| |/ // ___ |
#|__/|__//_____//_____/\____/ \____//_/  /_//_____/  /_/  /_//_/ |_|(_)/_/  |_|/_____/|___//_/  |_|
#"

laravel new app

php artisan make:model Business --migration
php artisan make:controller API/MemberController --api --model=Member


# Route
Route::apiResource( 'business', 'API\BusinessController' );
#metodos
php artisan route:list

#Nota al momento de modificar el .env debes reiniciar el servidor local
#https://github.com/laravel/laravel/blob/master/.env.example -> por si no tienes el archivo .env

# Migrate
$table -> string( 'business_name' );
$table -> string( 'rfc', 13 ) -> unique();

# Model
protected $fillable = [
	'business_name',
	'rfc',
];
#insertar table
php artisan migrate
# Soft Delete
# https://laravel.com/docs/5.6/eloquent#soft-deleting
use Illuminate\Database\Eloquent\SoftDeletes;
use SoftDeletes;
protected $dates = [ 'deleted_at' ];

# In migrate
$table -> softDeletes();
$table->timestamps();
