<?php

namespace App\Http\Controllers;

use App\Models\Attendee;
use App\Models\Event;
use App\Models\EventTicket;
use App\Models\Organizer;
use App\Models\Registration;
use App\Models\SessionRegistration;
use Illuminate\Http\Request;

class RegistrationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $attendee = Attendee::query()
            ->where('login_token', $request->input('token'))
            ->first();

        if (empty($attendee))
        {
            return response()->json(['message' => 'User not logged in'], 401);
        }

        return response(["registrations" => Registration::query()
            ->where('attendee_id', $attendee->id)
            ->with(["event", "event.organizer"])
            ->get()
            ->makeHidden(['id', 'attendee_id', 'ticket_id', 'registration_time'])
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param string $organizer_slug
     * @param string $event_slug
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, string $organizer_slug, string $event_slug)
    {
        $request->validate([
            'ticket_id' => 'required|integer'
        ]);

        // Check if logged-in
        $attendee = Attendee::query()
            ->where('login_token', $request->input('token'))
            ->first();

        if (empty($attendee))
        {
            return response()->json(['message' => 'User not logged in'], 401);
        }

        // Check if organizer exists
        $organizer = Organizer::query()
            ->where('slug', $organizer_slug)
            ->first();

        if (empty($organizer)) {
            return response()->json(['message' => "Organizer not found"], 404);
        }

        // Check if event exists
        $event = Event::query()
            ->where("slug", $event_slug)
            ->where("organizer_id", $organizer->id)
            ->first();

        if (empty($event)) {
            return response()->json(['message' => "Event not found"], 404);
        }

        // Check if already registered
        $event_for_ticket = EventTicket::query()
            ->where('id', $request->input('ticket_id'))
            ->select('event_id')
            ->first();
        $tickets_for_event = EventTicket::query()
            ->where("event_id", $event_for_ticket->event_id)
            ->get('id')
            ->toArray();
        $registration = Registration::query()
            ->where('attendee_id', $attendee->id)
            ->whereIn('ticket_id', $tickets_for_event)
            ->first();

        if (!empty($registration)) {
            return response()->json(['message' => 'User already registered'], 401);
        }

        // Check if ticket is available
        $ticket = EventTicket::query()
            ->where('id', $request->input('ticket_id'))
            ->first();

        if (!$ticket || !$ticket->available) {
            return response()->json(['message' => 'Ticket is no longer available'], 401);
        }

        $registration = new Registration();
        $registration->attendee_id = $attendee->id;
        $registration->ticket_id = $request->input('ticket_id');
        $registration->registration_time = now();
        $registration->save();

        $session_ids = $request->input('session_ids', []);
        foreach ($session_ids AS $session_id)
        {
            $session_reg = new SessionRegistration();
            $session_reg->registration_id = $registration->id;
            $session_reg->session_id = $session_id;
            $session_reg->save();
        }

        return response(['message' => 'Registration successful']);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Registration  $registration
     * @return \Illuminate\Http\Response
     */
    public function show(Registration $registration)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Registration  $registration
     * @return \Illuminate\Http\Response
     */
    public function edit(Registration $registration)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Registration  $registration
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Registration $registration)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Registration  $registration
     * @return \Illuminate\Http\Response
     */
    public function destroy(Registration $registration)
    {
        //
    }
}
