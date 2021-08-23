<?php

namespace App\Http\Controllers;

use App\Models\Event;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Event::with('organizer')->get());
    }

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function page(Request $request)
    {
        $events = Event::query()->where('organizer_id', '=', $request->user()->id)->get();
        return view('events', ['organization' => $request->user()->name, 'events' => $events]);
    }

    /**
     * Display a listing of the resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Event  $event
     *
     * @return \Illuminate\Http\Response
     */
    public function detail(Request $request, Event $event)
    {
        $event = Event::query()
            ->where('id', '=', $event->id)
            ->where('organizer_id', '=', $request->user()->id)
            ->with(['tickets', 'channels', 'channels.rooms', 'channels.rooms.sessions'])
            ->first();

        return view('detail', ['organization' => $request->user()->name, 'event' => $event]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @param  \Illuminate\Http\Request  $request
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        return view('new', ['organization' => $request->user()->name]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'slug' => 'required|unique:events',
            'date' => 'required',
        ]);

        $e = new Event();
        $e->organizer_id = $request->user()->id;
        $e->name = $request->name;
        $e->slug = $request->slug;
        $e->date = $request->date;
        $e->save();

        return redirect()->route('detail', ['event' => $e->id, 'message' => 'Event successfully created']);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function show(Event $event)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, Event $event)
    {
        return view('edit.event', ['organization' => $request->user()->name, 'event' => $event]);
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
        $request->validate([
            'name' => 'required',
            'slug' => ['required', Rule::unique('events')->ignoreModel($event), 'regex:/[a-z0-9\-]/'],
            'date' => 'required',
        ]);

        $e = $event;
        $e->name = $request->name;
        $e->slug = $request->slug;
        $e->date = $request->date;
        $e->save();

        return redirect()->route('detail', ['event' => $e->id, 'message' => 'Event successfully updated']);
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
