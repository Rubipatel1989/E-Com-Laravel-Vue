<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Role;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function createCustomer()
    {
        $user = new User();
        $user->name = 'Pawan Kumar';
        $user->email = 'pawank@exeire.com';
        $user->password = Hash::make('Bsa@123456');
        $user->save();

        $admin = Role::where('slug','admin')->first();
        $user->roles()->attach($admin);
    }
}
