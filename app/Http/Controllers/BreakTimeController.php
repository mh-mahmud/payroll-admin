<?php

namespace App\Http\Controllers;

use App\Models\BreakTime;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class BreakTimeController extends Controller
{
    public function index(Request $request)
    {
        $query = BreakTime::query();

        if ($request->filled('search')) {
            $search = $request->search;

            $query->where('break_name', 'like', "%{$search}%");
        }

        $breakTimes = $query
            ->latest()
            ->paginate(10)
            ->withQueryString();

        if ($request->ajax()) {
            return response()->json([
                'html' => view(
                    'break-times.partials.rows',
                    compact('breakTimes')
                )->render(),
                'pagination' => $breakTimes->links()->render(),
            ]);
        }

        return view('break-times.index', compact('breakTimes'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'break_name' => [
                'required',
                'string',
                'max:100',
                Rule::unique('break_times', 'break_name'),
            ],
            'start_time' => ['required', 'date_format:H:i'],
            'end_time' => ['required', 'date_format:H:i'],
            'duration_mins' => ['required', 'integer', 'min:1', 'max:1440'],
            'calculation_type' => [
                'required',
                Rule::in(['fixed', 'actual']),
            ],
        ]);

        $breakTime = BreakTime::create($validated);

        return response()->json([
            'success' => true,
            'message' => 'Break time created successfully.',
            'data' => $breakTime,
        ], 201);
    }

    public function show(BreakTime $breakTime)
    {
        return response()->json([
            'success' => true,
            'data' => $breakTime,
            'calculation_type_label' =>
                $breakTime->calculation_type_label,
        ]);
    }

    public function update(Request $request, BreakTime $breakTime)
    {
        $validated = $request->validate([
            'break_name' => [
                'required',
                'string',
                'max:100',
                Rule::unique('break_times', 'break_name')
                    ->ignore($breakTime->id),
            ],
            'start_time' => ['required', 'date_format:H:i'],
            'end_time' => ['required', 'date_format:H:i'],
            'duration_mins' => ['required', 'integer', 'min:1', 'max:1440'],
            'calculation_type' => [
                'required',
                Rule::in(['fixed', 'actual']),
            ],
        ]);

        $breakTime->update($validated);

        return response()->json([
            'success' => true,
            'message' => 'Break time updated successfully.',
            'data' => $breakTime->fresh(),
        ]);
    }

    public function destroy(BreakTime $breakTime)
    {
        $breakTime->delete();

        return response()->json([
            'success' => true,
            'message' => 'Break time deleted successfully.',
        ]);
    }
}