<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Channel extends Model
{
    use HasFactory;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'event_id',
    ];

    public $timestamps = false;

    public function rooms() {
        return $this->hasMany(Room::class);
    }

    public function getSessionsCountAttribute() {
        return array_sum(array_map(function($room) { return count($room['sessions']); }, $this->rooms->toArray()));
    }
}
