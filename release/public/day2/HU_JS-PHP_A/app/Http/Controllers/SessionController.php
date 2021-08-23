<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\Session;
use Illuminate\Http\Request;

class SessionController extends Controller
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

        return view('edit.sessions', ['organization' => $request->user()->name, 'event' => $event]);
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
            'title' => 'required',
        ]);

        $s = new Session();
        $s->room_id = $request->room;
        $s->title = $request->title;
        $s->speaker = $request->speaker;
        $s->description = $request->description;
        $s->start = $request->start;
        $s->end = $request->end;
        $s->type = $request->type;
        $s->save();

        return redirect()->route('detail', ['event' => $event->id, 'message' => 'Session successfully created']);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Session  $session
     * @return \Illuminate\Http\Response
     */
    public function show(Session $session)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Session  $session
     * @return \Illuminate\Http\Response
     */
    public function edit(Session $session)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Session  $session
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Session $session)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Session  $session
     * @return \Illuminate\Http\Response
     */
    public function destroy(Session $session)
    {
        //
    }
}
