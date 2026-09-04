<?php

namespace App\Http\Controllers;

use App\Models\AttendancePolicy;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Validator;

class AttendancePolicyController extends Controller
{
    /**
     * Display attendance policies.
     */
    public function index(Request $request)
    {
        $query = AttendancePolicy::query();

        /*
        |--------------------------------------------------------------------------
        | Search
        |--------------------------------------------------------------------------
        */
        if ($request->filled('search')) {
            $search = $request->search;

            $query->where(function ($q) use ($search) {
                $q->where('name', 'like', "%{$search}%")
                    ->orWhere('description', 'like', "%{$search}%");
            });
        }

        /*
        |--------------------------------------------------------------------------
        | Status filter
        |--------------------------------------------------------------------------
        */
        if ($request->filled('status') && $request->status !== 'all') {
            $query->where('status', $request->status);
        }

        $policies = $query
            ->latest()
            ->paginate(9)
            ->withQueryString();

        /*
        |--------------------------------------------------------------------------
        | Dashboard Statistics
        |--------------------------------------------------------------------------
        */
        $totalPolicies = AttendancePolicy::count();

        $activePolicies = AttendancePolicy::where('status', 'active')->count();

        $avgLateGrace = AttendancePolicy::avg('late_arrival_grace') ?? 0;

        $avgOvertimeRate = AttendancePolicy::avg('overtime_rate') ?? 0;

        if ($request->ajax()) {
            return response()->json([
                'html' => view(
                    'attendance-policies.partials.policy-list',
                    compact('policies')
                )->render(),

                'pagination' => $policies->links()->render(),

                'stats' => [
                    'total' => $totalPolicies,
                    'active' => $activePolicies,
                    'avg_late_grace' => round($avgLateGrace),
                    'avg_overtime_rate' => number_format($avgOvertimeRate, 2),
                ],
            ]);
        }

        return view('attendance-policies.index', compact(
            'policies',
            'totalPolicies',
            'activePolicies',
            'avgLateGrace',
            'avgOvertimeRate'
        ));
    }

    /**
     * Store a new attendance policy.
     */

    /*public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => [
                'required',
                'string',
                'max:255',
            ],

            'description' => [
                'nullable',
                'string',
                'max:2000',
            ],

            'late_arrival_grace' => [
                'required',
                'integer',
                'min:0',
                'max:1440',
            ],

            'early_departure_grace' => [
                'required',
                'integer',
                'min:0',
                'max:1440',
            ],

            'overtime_rate' => [
                'required',
                'numeric',
                'min:0',
                'max:99999999.99',
            ],

            'status' => [
                'required',
                'in:active,inactive',
            ],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please correct the errors below.',
                'errors' => $validator->errors(),
            ], 422);
        }

        $policy = AttendancePolicy::create([
            'name' => $request->name,
            'description' => $request->description,
            'late_arrival_grace' => $request->late_arrival_grace,
            'early_departure_grace' => $request->early_departure_grace,
            'overtime_rate' => $request->overtime_rate,
            'status' => $request->status,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Attendance policy created successfully.',
            'data' => $policy,
        ]);
    }*/


    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'late_arrival_grace' => 'required|integer|min:0',
            'early_departure_grace' => 'required|integer|min:0',
            'overtime_rate' => 'required|numeric|min:0',
            'status' => 'required|in:active,inactive',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $policy = AttendancePolicy::create([
            'name' => $request->name,
            'description' => $request->description,
            'late_arrival_grace' => $request->late_arrival_grace,
            'early_departure_grace' => $request->early_departure_grace,
            'overtime_rate' => $request->overtime_rate,
            'status' => $request->status,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Attendance policy created successfully.',
            'data' => $policy,
        ]);
    }

    /**
     * Display a policy.
     */
    public function show(AttendancePolicy $attendancePolicy): JsonResponse
    {
        return response()->json([
            'success' => true,
            'data' => $attendancePolicy,
        ]);
    }

    /**
     * Update attendance policy.
     */
    /*public function update(
        Request $request,
        AttendancePolicy $attendancePolicy): JsonResponse {
        $validator = Validator::make($request->all(), [
            'name' => [
                'required',
                'string',
                'max:255',
            ],

            'description' => [
                'nullable',
                'string',
                'max:2000',
            ],

            'late_arrival_grace' => [
                'required',
                'integer',
                'min:0',
                'max:1440',
            ],

            'early_departure_grace' => [
                'required',
                'integer',
                'min:0',
                'max:1440',
            ],

            'overtime_rate' => [
                'required',
                'numeric',
                'min:0',
                'max:99999999.99',
            ],

            'status' => [
                'required',
                'in:active,inactive',
            ],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Please correct the errors below.',
                'errors' => $validator->errors(),
            ], 422);
        }

        $attendancePolicy->update([
            'name' => $request->name,
            'description' => $request->description,
            'late_arrival_grace' => $request->late_arrival_grace,
            'early_departure_grace' => $request->early_departure_grace,
            'overtime_rate' => $request->overtime_rate,
            'status' => $request->status,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Attendance policy updated successfully.',
            'data' => $attendancePolicy->fresh(),
        ]);
    }*/

    public function update(Request $request, AttendancePolicy $attendancePolicy)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'late_arrival_grace' => 'required|integer|min:0',
            'early_departure_grace' => 'required|integer|min:0',
            'overtime_rate' => 'required|numeric|min:0',
            'status' => 'required|in:active,inactive',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'errors' => $validator->errors(),
            ], 422);
        }

        $attendancePolicy->update([
            'name' => $request->name,
            'description' => $request->description,
            'late_arrival_grace' => $request->late_arrival_grace,
            'early_departure_grace' => $request->early_departure_grace,
            'overtime_rate' => $request->overtime_rate,
            'status' => $request->status,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Attendance policy updated successfully.',
            'data' => $attendancePolicy,
        ]);
    }

    /**
     * Delete attendance policy.
     */
    public function destroy(
        AttendancePolicy $attendancePolicy
    ): JsonResponse {
        $attendancePolicy->delete();

        return response()->json([
            'success' => true,
            'message' => 'Attendance policy deleted successfully.',
        ]);
    }
}