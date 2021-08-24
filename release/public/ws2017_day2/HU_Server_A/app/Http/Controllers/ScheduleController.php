<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ScheduleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Schedule::all());
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
        // Check if admin
        if ($request->user()->role !== 'ADMIN') {
            return response()->json(['message' => 'Unauthorized user'], 401);
        }

        // Validate
        $validator = Validator::make($request->all(), [
            'type' => 'required|in:TRAIN,BUS',
            'line' => 'required|integer',
            'from_place_id' => 'required|integer|exists:places,id',
            'to_place_id' => 'required|integer|exists:places,id',
            'departure_time' => 'required|date_format:H:i:s',
            'arrival_time' => 'required|date_format:H:i:s',
            'distance' => 'required|integer',
            'speed' => 'required|integer',
            'status' => 'required|in:AVAILABLE,UNAVAILABLE'
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data cannot be processed', 'errors' => $validator->errors()], 422);
        }

        $schedule = new Schedule();
        $schedule->type = $request->type;
        $schedule->line = $request->line;
        $schedule->from_place_id = $request->from_place_id;
        $schedule->to_place_id = $request->to_place_id;
        $schedule->departure_time = $request->departure_time;
        $schedule->arrival_time = $request->arrival_time;
        $schedule->distance = $request->distance;
        $schedule->speed = $request->speed;
        $schedule->status = $request->status;
        $schedule->save();

        // Return success
        return response()->json(['message' => 'create success', 'schedule' => $schedule]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function show(Schedule $schedule)
    {
        return response()->json($schedule);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function edit(Schedule $schedule)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Schedule $schedule)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Schedule  $schedule
     * @return \Illuminate\Http\Response
     */
    public function destroy(Schedule $schedule)
    {
        $schedule->delete();

        return response()->json(['message' => 'delete success']);
    }
}
