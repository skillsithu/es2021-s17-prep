<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Session extends Model
{
    use HasFactory;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'room_id',
    ];

    public $timestamps = false;

    public function getStartTimeAttribute() {
        $date = new Carbon($this->start);
        return $date->format('h:i');
    }

    public function getEndTimeAttribute() {
        $date = new Carbon($this->end);
        return $date->format('h:i');
    }
}
