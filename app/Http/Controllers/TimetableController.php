<?php

namespace App\Http\Controllers;

use App\Models\BreakTime;
use App\Models\Timetable;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class TimetableController extends Controller
{
    public function index()
    {
        $timetables = Timetable::with('breakTimes')
            ->latest()
            ->paginate(10);

        $breakTimes = BreakTime::orderBy('break_name')->get();

        return view('timetables.index', compact(
            'timetables',
            'breakTimes'
        ));
    }

    private function rules(?Timetable $timetable = null): array
    {
        return [
            'name' => [
                'required',
                'string',
                'max:100',
                Rule::unique('timetables', 'name')
                    ->ignore($timetable?->id),
            ],
            'work_hours_assign_to' => [
                'required', Rule::in(['Regular', 'Flexible']),
            ],
            'type' => ['required', Rule::in(['normal', 'flexible'])],

            'check_in' => ['required', 'date_format:H:i'],
            'check_in_start_time' => ['required', 'date_format:H:i'],
            'check_in_start_days' => ['required', 'integer', 'between:0,7'],
            'check_in_end_time' => ['required', 'date_format:H:i'],
            'check_in_end_days' => ['required', 'integer', 'between:0,7'],

            'check_out' => ['required', 'date_format:H:i'],
            'check_out_start_time' => ['required', 'date_format:H:i'],
            'check_out_start_days' => ['required', 'integer', 'between:0,7'],
            'check_out_end_time' => ['required', 'date_format:H:i'],
            'check_out_end_days' => ['required', 'integer', 'between:0,7'],

            'work_day' => ['required', 'numeric', 'min:0', 'max:7'],
            'color' => ['nullable', 'string', 'max:20'],

            'break_time_ids' => ['nullable', 'array'],
            'break_time_ids.*' => [
                'integer', 'distinct', 'exists:break_times,id',
            ],

            'max_ot_enabled' => ['required', 'boolean'],
            'max_ot_duration' => [
                'required', 'integer', 'min:0', 'max:1440',
            ],
            'overtime_enabled' => ['required', 'boolean'],

            'overtime_rules' => ['nullable', 'array', 'max:3'],
            'overtime_rules.*.assign_to' => [
                'nullable', 'string', 'max:50',
            ],
            'overtime_rules.*.min_hours' => [
                'required', 'numeric', 'min:0', 'max:24',
            ],
            'overtime_rules.*.max_hours' => [
                'required', 'numeric', 'min:0', 'max:24',
                'gte:overtime_rules.*.min_hours',
            ],

            'clock_in_required' => ['required', 'boolean'],
            'clock_out_required' => ['required', 'boolean'],
            'allow_late_in' => ['required', 'integer', 'min:0', 'max:1440'],
            'allow_early_out' => ['required', 'integer', 'min:0', 'max:1440'],
            'punch_state_based' => [
                'required', Rule::in(['yes', 'no']),
            ],
            'day_change_time' => ['required', 'date_format:H:i'],

            'unscheduled_settings' => ['nullable', 'array'],
        ];
    }

    private function saveTimetable(
        Request $request,
        ?Timetable $timetable = null
    ) {
        $validated = $request->validate($this->rules($timetable));

        $breakTimeIds = $validated['break_time_ids'] ?? [];
        unset($validated['break_time_ids']);

        // Normalize optional JSON values.
        $validated['overtime_rules'] = $validated['overtime_rules'] ?? [];
        $validated['unscheduled_settings'] =
            $validated['unscheduled_settings'] ?? [];

        $timetable ??= new Timetable();
        $timetable->fill($validated);
        $timetable->save();

        $timetable->breakTimes()->sync($breakTimeIds);

        return $timetable->load('breakTimes');
    }

    public function store(Request $request)
    {
        $timetable = $this->saveTimetable($request);

        return response()->json([
            'success' => true,
            'message' => 'Timetable created successfully.',
            'data' => $timetable,
        ], 201);
    }

    public function show(Timetable $timetable)
    {
        $timetable->load('breakTimes');

        return response()->json([
            'success' => true,
            'data' => $timetable,
            'break_time_ids' => $timetable->breakTimes
                ->pluck('id')->values(),
        ]);
    }

    public function update(Request $request, Timetable $timetable)
    {
        $timetable = $this->saveTimetable($request, $timetable);

        return response()->json([
            'success' => true,
            'message' => 'Timetable updated successfully.',
            'data' => $timetable,
        ]);
    }

    public function destroy(Timetable $timetable)
    {
        $timetable->delete();

        return response()->json([
            'success' => true,
            'message' => 'Timetable deleted successfully.',
        ]);
    }
}
