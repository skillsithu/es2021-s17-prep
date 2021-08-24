<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Schedule extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $appends = ['travel_time', 'type_name'];

    public function getTravelTimeAttribute() {
        $arrival = Carbon::make($this->arrival_time);
        $departure = Carbon::make($this->departure_time);
        return $arrival->diffInRealMinutes($departure);
    }

    public function getTypeNameAttribute() {
        return Str::title($this->type);
    }

    public function from_place() {
        return $this->hasOne(Place::class, 'id', 'from_place_id');
    }

    public function to_place() {
        return $this->hasOne(Place::class, 'id', 'to_place_id');
    }
}
