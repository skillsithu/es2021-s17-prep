<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendee extends Model
{
    use HasFactory;

    protected $hidden = ['id', 'login_token', 'registration_code'];

    protected $appends = ['token'];

    public $timestamps = false;

    public function getTokenAttribute()
    {
        return $this->login_token;
    }
}
