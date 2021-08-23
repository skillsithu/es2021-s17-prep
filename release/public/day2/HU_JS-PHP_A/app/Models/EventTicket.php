<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventTicket extends Model
{
    use HasFactory;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'event_id',
        'special_validity'
    ];

    public $timestamps = false;

    protected $appends = ['description', 'available'];

    public function getValidityAttribute() {
        return $this->special_validity ? json_decode($this->special_validity, true) : [];
    }

    /* Calculate availability desc */
    public function getDescriptionAttribute() {
        $validity = $this->validity;
        if ($validity && $validity['type'] === 'date') {
            $date = new Carbon($validity['date']);
            return "Available until " . $date->format('M d, Y');
        } else if ($validity && $validity['type'] === 'amount') {
            return $validity['amount'] . ' tickets available';
        }
        return null;
    }

    /* Calc availability */
    public function getAvailableAttribute() {
        $validity = $this->validity;
        if ($validity && $validity['type'] === 'date') {
            $date = new Carbon($validity['date']);
            return $date->isFuture();
        } else {
            return true;
        }
    }

    public function registrations() {
        return $this->hasMany(Registration::class, 'ticket_id', 'id');
    }
}
