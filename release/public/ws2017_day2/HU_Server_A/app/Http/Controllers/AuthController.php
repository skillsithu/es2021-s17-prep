<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    /**
     * Login
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        $success = Auth::attempt([
            'username' => $request->username,
            'password' => $request->password
        ]);

        if ($success) {
            $user = Auth::user();
            $user->api_token = md5($request->username);
            $user->save();

            return response()->json([
                'token' => $user->api_token,
                'role' => $user->role
            ]);
        } else {
            return response()->json([
                'message' => 'invalid login'
            ], 401);
        }
    }

    /**
     * Logout
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $user = $request->user();
        $user->api_token = null;
        $user->save();

        return response()->json(['message' => 'logout success']);
    }
}
