<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $user = new User();
        $user->username = "admin";
        $user->password = Hash::make("adminpass");
        $user->role = "ADMIN";
        $user->save();

        $user = new User();
        $user->username = "user1";
        $user->password = Hash::make("user1pass");
        $user->role = "USER";
        $user->save();

        $user = new User();
        $user->username = "user2";
        $user->password = Hash::make("user2pass");
        $user->role = "USER";
        $user->save();
    }
}
