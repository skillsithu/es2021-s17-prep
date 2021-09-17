<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventTicket extends Model
{
    use HasFactory;

    protected $casts = ['cost' => 'real'];

    protected $hidden = ['event_id', 'special_validity'];

    protected $appends = ['description', 'available'];

    public function registrations()
    {
        return $this->hasMany(Registration::class, 'ticket_id', 'id');
    }

    public function getDescriptionAttribute()
    {
        if (!$this->special_validity) {
            return null;
        }

        $validity = json_decode($this->special_validity, true);
        if ($validity['type'] == 'date')
        {
            $valid_until = new Carbon($validity['date']);
            return 'Available until ' . $valid_until->format('F j, Y');
        }

        if ($validity['type'] == 'amount')
        {
            $amount = (int)$validity['amount'];
            return $amount . ' tickets available';
        }
    }

    public function getAvailableAttribute()
    {
        if (!$this->special_validity) {
            return true;
        }

        $validity = json_decode($this->special_validity, true);
        if ($validity['type'] == 'date')
        {
            $valid_until = new Carbon($validity['date']);
            if ($valid_until->isBefore(new Carbon('2019-09-01'))) {
                return false;
            } else {
                return true;
            }
        }

        if ($validity['type'] == 'amount')
        {
            $amount = (int)$validity['amount'];
            $regs = $this->registrations()->count();

            if ($regs < $amount) {
                return true;
            } else {
                return false;
            }
        }

        return true;
    }
}
