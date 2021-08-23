<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'organizer_id',
    ];

    public $timestamps = false;

    public function organizer() {
        return $this->hasOne(Organizer::class, 'id', 'organizer_id');
    }

    public function channels() {
        return $this->hasMany(Channel::class);
    }

    public function tickets() {
        return $this->hasMany(EventTicket::class);
    }

    public function getRegCountAttribute() {
        $tickets = [];
        foreach ($this->tickets as $ticket) {
            $tickets[]['registrations'] = $ticket->registrations->toArray();
        }
        return array_sum(array_map(function($ticket) { return count($ticket['registrations']); }, $tickets));
    }
}
