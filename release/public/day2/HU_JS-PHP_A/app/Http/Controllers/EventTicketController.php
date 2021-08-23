<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\EventTicket;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EventTicketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Event  $event
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request, Event $event)
    {
        $event = Event::query()
            ->where('id', '=', $event->id)
            ->where('organizer_id', '=', $request->user()->id)
            ->first();

        return view('edit.tickets', ['organization' => $request->user()->name, 'event' => $event]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Event  $event
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Event $event)
    {
        $request->validate([
            'name' => 'required',
            'cost' => 'required'
        ]);

        $ticket = new EventTicket();
        $ticket->event_id = $event->id;
        $ticket->name = $request->name;
        $ticket->cost = $request->cost;

        if ($request->special_validity == 'amount') {
            $ticket->special_validity = json_encode([
                'type' => 'amount',
                'amount' => $request->amount
            ]);
        } else if ($request->special_validity == 'date') {
            $ticket->special_validity = json_encode([
                'type' => 'date',
                'date' => $request->valid_until
            ]);
        } else {
            $ticket->special_validity = null;
        }

        $ticket->save();

        return redirect()->route('detail', ['event' => $event->id, 'message' => 'Ticket successfully created']);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\EventTicket  $eventTicket
     * @return \Illuminate\Http\Response
     */
    public function show(EventTicket $eventTicket)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\EventTicket  $eventTicket
     * @return \Illuminate\Http\Response
     */
    public function edit(EventTicket $eventTicket)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EventTicket  $eventTicket
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EventTicket $eventTicket)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EventTicket  $eventTicket
     * @return \Illuminate\Http\Response
     */
    public function destroy(EventTicket $eventTicket)
    {
        //
    }
}
