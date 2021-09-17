<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Registration extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $appends = ['session_ids'];

    public function event()
    {
        return $this->hasOneThrough(Event::class, EventTicket::class, "id", "id", "ticket_id", "event_id");
    }

    public function getSessionIdsAttribute()
    {
        return array_map(fn($row) => $row['session_id'], $this->sessions()->get('session_id')->toArray());
    }

    public function sessions()
    {
        return $this->hasMany(SessionRegistration::class);
    }
}
