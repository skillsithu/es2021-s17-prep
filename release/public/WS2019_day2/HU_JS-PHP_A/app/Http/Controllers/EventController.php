<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\Organizer;
use Illuminate\Http\Request;

class EventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response(['events' => Event::query()
            ->where('date', '>=', '2019-09-01')
            ->orderBy('date')
            ->with('organizer')
            ->get()
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
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param string $organizer_slug
     * @param string $event_slug
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, string $organizer_slug, string $event_slug)
    {
        $organizer = Organizer::query()
            ->where('slug', $organizer_slug)
            ->first();

        if (empty($organizer)) {
            return response()->json(['message' => "Organizer not found"], 404);
        }

        $event = Event::query()
            ->where("slug", $event_slug)
            ->where("organizer_id", $organizer->id)
            ->with(['channels', 'channels.rooms', 'channels.rooms.sessions', 'tickets'])
            ->first();

        if (empty($event)) {
            return response()->json(['message' => "Event not found"], 404);
        }

        return response($event);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function edit(Event $event)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Event $event)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function destroy(Event $event)
    {
        //
    }
}
