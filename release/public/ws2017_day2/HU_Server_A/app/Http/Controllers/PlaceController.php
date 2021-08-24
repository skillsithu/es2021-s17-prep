<?php

namespace App\Http\Controllers;

use App\Models\Place;
use App\Models\PoiFactory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PlaceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all = Place::all()->toArray();
        usort($all, function($a, $b) { return strcmp($a['name'], $b['name']); } );
        return response()->json($all);
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
            'name' => 'required|string',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'x' => 'integer',
            'y' => 'integer',
            'image' => 'required|image',
            'description' => 'string'
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data cannot be processed', 'errors' => $validator->errors()], 422);
        }

        // Calc coords
        $poiFactoy = new PoiFactory();
        $coords = $poiFactoy->calculate(['latitude' => $request->latitude, 'longitude' => $request->longitude]);

        // Store image
        $image = $request->file('image')->storePublicly('public');
        $filename = str_replace('public/', '', $image);

        // Save place
        $place = new Place();
        $place->name = $request->name;
        $place->latitude = $request->latitude;
        $place->longitude = $request->longitude;
        $place->x = (bool)$request->x ? $request->x : $coords['x'];
        $place->y = (bool)$request->y ? $request->y : $coords['y'];
        $place->image_path = $filename;
        $place->description = $request->description;
        $place->save();

        // Return success
        return response()->json(['message' => 'create success', 'place' => $place]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Place  $place
     * @return \Illuminate\Http\Response
     */
    public function show(Place $place)
    {
        return response()->json($place);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Place  $place
     * @return \Illuminate\Http\Response
     */
    public function edit(Place $place)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Place  $place
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Place $place)
    {
        // Check if admin
        if ($request->user()->role !== 'ADMIN') {
            return response()->json(['message' => 'Unauthorized user'], 401);
        }

        // Validate
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'x' => 'integer',
            'y' => 'integer',
            'image' => 'required|image',
            'description' => 'string'
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data cannot be updated', 'errors' => $validator->errors()], 400);
        }

        // Save place
        $place->name = (bool)$request->name ? $request->name : $place->name;
        $place->description = (bool)$request->description ? $request->description : $place->description;
        $place->latitude = (bool)$request->latitude ? $request->latitude : $place->latitude;
        $place->longitude = (bool)$request->longitude ? $request->longitude : $place->longitude;

        // Calc coords
        $poiFactoy = new PoiFactory();
        $coords = $poiFactoy->calculate(['latitude' => $place->latitude, 'longitude' => $place->longitude]);

        $place->x = (bool)$request->x ? $request->x : $coords['x'];
        $place->y = (bool)$request->y ? $request->y : $coords['y'];

        if ($request->file('image')) {
            // Store image
            $image = 'asd'; //$request->file('image')->storePublicly('public');
            $filename = str_replace('public/', '', $image);
            $place->image_path = $filename;
        }

        $place->save();

        // Return success
        return response()->json(['message' => 'create success', 'place' => $place]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Place  $place
     * @return \Illuminate\Http\Response
     */
    public function destroy(Place $place)
    {
        $place->delete();

        return response()->json(['message' => 'delete success']);
    }
}
