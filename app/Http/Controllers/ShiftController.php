<?php

namespace App\Http\Controllers;

use App\Models\Shift;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ShiftController extends Controller
{
    /**
     * Display shifts.
     */
    public function index(Request $request)
    {
        $query = Shift::query();

        // Search
        if ($request->filled('search')) {
            $search = $request->search;

            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                    ->orWhere('description', 'like', "%{$search}%");
            });
        }

        // Status filter
        if ($request->filled('status') && $request->status !== 'all') {
            $query->where('status', $request->status);
        }

        // Type filter
        if ($request->filled('type') && $request->type !== 'all') {

            if ($request->type === 'night') {
                $query->where('is_night_shift', true);
            }

            if ($request->type === 'day') {
                $query->where('is_night_shift', false);
            }
        }

        $shifts = $query
            ->latest()
            ->paginate(9)
            ->withQueryString();

        // Statistics
        $totalShifts = Shift::count();

        $activeShifts = Shift::where(
            'status',
            'active'
        )->count();

        $nightShifts = Shift::where(
            'is_night_shift',
            true
        )->count();

        $dayShifts = Shift::where(
            'is_night_shift',
            false
        )->count();

        if ($request->ajax()) {

            return response()->json([
                'html' => view(
                    'shifts.partials.shift-list',
                    compact('shifts')
                )->render(),

                'stats' => [
                    'total' => $totalShifts,
                    'active' => $activeShifts,
                    'night' => $nightShifts,
                    'day' => $dayShifts,
                ],
            ]);
        }

        return view('shifts.index', compact(
            'shifts',
            'totalShifts',
            'activeShifts',
            'nightShifts',
            'dayShifts'
        ));
    }


    /**
     * Store new shift.
     */
    public function store(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            $this->validationRules()
        );

        if ($validator->fails()) {

            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $shift = Shift::create([
            'name' => $request->name,
            'description' => $request->description,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'break_duration' => $request->break_duration,
            'break_start_time' => $request->break_start_time,
            'break_end_time' => $request->break_end_time,
            'grace_period' => $request->grace_period,
            'is_night_shift' => $request->boolean('is_night_shift'),
            'status' => $request->status,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Shift created successfully.',
            'data' => $shift,
        ]);
    }


    /**
     * Show shift.
     */
    public function show(Shift $shift)
    {
        return response()->json([
            'success' => true,
            'data' => $shift,
        ]);
    }


    /**
     * Update shift.
     */
    public function update(Request $request, Shift $shift)
    {
        $validator = Validator::make(
            $request->all(),
            $this->validationRules()
        );

        if ($validator->fails()) {

            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $shift->update([
            'name' => $request->name,
            'description' => $request->description,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'break_duration' => $request->break_duration,
            'break_start_time' => $request->break_start_time,
            'break_end_time' => $request->break_end_time,
            'grace_period' => $request->grace_period,
            'is_night_shift' => $request->boolean('is_night_shift'),
            'status' => $request->status,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Shift updated successfully.',
            'data' => $shift->fresh(),
        ]);
    }


    /**
     * Delete shift.
     */
    public function destroy(Shift $shift)
    {
        $shift->delete();

        return response()->json([
            'success' => true,
            'message' => 'Shift deleted successfully.',
        ]);
    }


    /**
     * Validation rules.
     */
    private function validationRules(): array
    {
        return [
            'name' => [
                'required',
                'string',
                'max:255',
            ],

            'description' => [
                'nullable',
                'string',
            ],

            'start_time' => [
                'required',
                'date_format:H:i',
            ],

            'end_time' => [
                'required',
                'date_format:H:i',
            ],

            'break_duration' => [
                'required',
                'integer',
                'min:0',
            ],

            'break_start_time' => [
                'nullable',
                'date_format:H:i',
            ],

            'break_end_time' => [
                'nullable',
                'date_format:H:i',
            ],

            'grace_period' => [
                'required',
                'integer',
                'min:0',
            ],

            'is_night_shift' => [
                'nullable',
                'boolean',
            ],

            'status' => [
                'required',
                'in:active,inactive',
            ],
        ];
    }
}