<?php

namespace App\Http\Controllers;

use App\Models\Shift;
use App\Models\Timetable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ShiftController extends Controller
{
    public function index()
    {
        // Fetch all timetables for the modal
        $timetables = Timetable::all();
        
        // You can adapt your stats here if you want
        $totalShifts = Shift::count();
        $activeShifts = Shift::where('status', 'active')->count(); // Assuming you kept status, else remove
        
        $shifts = Shift::latest()->paginate(10);

        return view('shifts.index', compact('timetables', 'shifts', 'totalShifts', 'activeShifts'));
    }

    public function searchTimetable(Request $request)
    {
        $query = $request->get('query', '');

        $results = Timetable::where('name', 'LIKE', "%{$query}%")
            ->select('id', 'name', 'check_in', 'check_out')
            ->limit(10)
            ->get();

        return response()->json($results);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id'         => 'nullable|exists:shifts,id',
            'name'       => 'required|string|max:255',
            'unit'       => 'required|in:day,week,month',
            'cycle'      => 'required|integer|min:1|max:31',
            'auto_shift' => 'boolean',
            'schedule'   => 'required|array',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors'  => $validator->errors(),
            ], 422);
        }

        $shift = Shift::updateOrCreate(
            ['id' => $request->id],
            [
                'name'          => $request->name,
                'unit'          => $request->unit,
                'cycle'         => $request->cycle,
                'auto_shift'    => $request->boolean('auto_shift'),
                'schedule_data' => $request->schedule,
            ]
        );

        return response()->json([
            'success' => true,
            'message' => $request->id ? 'Shift updated successfully!' : 'Shift saved successfully!',
            'data'    => $shift,
        ]);
    }

    public function show(Shift $shift)
    {
        return response()->json([
            'success' => true,
            'data'    => $shift,
        ]);
    }

    public function destroy(Shift $shift)
    {
        $shift->delete();

        return response()->json([
            'success' => true,
            'message' => 'Shift deleted successfully.',
        ]);
    }
}