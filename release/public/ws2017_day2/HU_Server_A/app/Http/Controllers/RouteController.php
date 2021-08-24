<?php

namespace App\Http\Controllers;

use App\Models\Schedule;
use App\Models\Selection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RouteController extends Controller
{
    /**
     * Search
     *
     * @param  \Illuminate\Http\Request  $request
     * @param int $from
     * @param int $to
     * @param string $time
     *
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request, int $from, int $to, string $time = "")
    {
        // Set default time
        if (empty($time)) {
            $time = date("H:i:s");
        }

        // Get routes after time
        $routes = Schedule::query()
            ->where("departure_time", ">=", $time)
            ->where('status', '=', 'AVAILABLE')
            ->orderBy('departure_time')
            ->get();

        // Get possible start routes
        $found = array();
        $frontier = array();
        foreach ($routes AS $route) {
            if (!in_array($route->to_place_id, array_map(fn($r) => $r->to_place_id, $frontier))
                && $route->from_place_id = $from) {
                $frontier[] = $route;
            }
        }

        // Check routes
        foreach ($frontier AS $node) {
            if ($node->to_place_id === $to) {
                $node->load(['from_place', 'to_place']);
                $route = array();
                $route[] = $node;

                if ($request->user()) {
                    $selections = Selection::query()
                        ->where('user_id', '=', $request->user()->id)
                        ->where('from_place_id', '=', $from)
                        ->where('to_place_id', '=', $to)
                        ->where('schedule_id', '=', $node->id)
                        ->count();
                } else {
                    $selections = 0;
                }

                $found[] = [
                    'history_count' => $selections,
                    'schedules' => $route
                ];
            }
        }

        return response()->json($found);
    }

    /**
     * Selection
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function selection(Request $request) {
        // Validate
        $validator = Validator::make($request->all(), [
            'from_place_id' => 'required|integer|exists:places,id',
            'to_place_id' => 'required|integer|exists:places,id',
            'schedule_id' => 'required|integer|exists:schedules,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Data cannot be processed', 'errors' => $validator->errors()], 422);
        }

        // Create model
        $selection = new Selection();
        $selection->user_id = $request->user()->id;
        $selection->from_place_id = $request->from_place_id;
        $selection->to_place_id = $request->to_place_id;
        $selection->schedule_id = $request->schedule_id;
        $selection->save();

        // Return success
        return response()->json(['message' => 'create success', 'selection' => $selection]);
    }
}
