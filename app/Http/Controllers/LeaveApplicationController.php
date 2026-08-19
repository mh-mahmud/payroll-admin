<?php

namespace App\Http\Controllers;

use App\Models\LeaveApplication;
use App\Models\LeaveBalance;
use App\Models\LeaveType;
use App\Models\Employee;
use Illuminate\Http\Request;
use Carbon\Carbon;

class LeaveApplicationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = LeaveApplication::with(['employee', 'leaveType']);

        if ($request->filled('search')) {
            $query->whereHas('employee', function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->search . '%')
                  ->orWhere('email', 'like', '%' . $request->search . '%');
            });
        }

        if ($request->filled('employee_id')) {
            $query->where('employee_id', $request->employee_id);
        }

        if ($request->filled('leave_type_id')) {
            $query->where('leave_type_id', $request->leave_type_id);
        }

        $tab = $request->input('tab', 'Pending');
        $query->where('status', $tab);

        $counts = [
            'Pending' => LeaveApplication::where('status', 'Pending')->count(),
            'Approved' => LeaveApplication::where('status', 'Approved')->count(),
            'Rejected' => LeaveApplication::where('status', 'Rejected')->count(),
        ];

        $applications = $query->latest()->paginate(10)->withQueryString();
        $employees = Employee::where('employment_status', 'Active')->get();
        $leaveTypes = LeaveType::where('status', 'Active')->get();

        return view('leave_applications.index', compact('applications', 'employees', 'leaveTypes', 'counts', 'tab'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'employee_id' => 'required|exists:employees,id',
            'leave_type_id' => 'required|exists:leave_types,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
            'reason' => 'required|string',
            'attachment' => 'nullable|file|max:5120', // 5MB limit
        ]);

        $start = Carbon::parse($validated['start_date']);
        $end = Carbon::parse($validated['end_date']);
        $daysCount = $start->diffInDays($end) + 1;

        $attachmentPath = null;
        if ($request->hasFile('attachment')) {
            $attachmentPath = $request->file('attachment')->store('leave_attachments', 'public');
        }

        LeaveApplication::create([
            'employee_id' => $validated['employee_id'],
            'leave_type_id' => $validated['leave_type_id'],
            'start_date' => $validated['start_date'],
            'end_date' => $validated['end_date'],
            'days_count' => $daysCount,
            'reason' => $validated['reason'],
            'attachment_path' => $attachmentPath,
            'status' => 'Pending',
            'applied_on' => now()->toDateString(),
        ]);

        return redirect()->route('leave-applications')->with('success', 'Leave application submitted successfully.');
    }

    public function approve(LeaveApplication $leaveApplication)
    {
        if ($leaveApplication->status === 'Approved') {
            return back()->with('info', 'This application is already approved.');
        }

        $year = Carbon::parse($leaveApplication->start_date)->year;

        // Initialize or update leave balance
        $balance = LeaveBalance::firstOrCreate(
            [
                'employee_id' => $leaveApplication->employee_id,
                'leave_type_id' => $leaveApplication->leave_type_id,
                'year' => $year
            ],
            [
                'total_days' => $leaveApplication->leaveType?->max_days ?? 0,
                'used_days' => 0,
                'available_days' => $leaveApplication->leaveType?->max_days ?? 0
            ]
        );

        $balance->used_days += $leaveApplication->days_count;
        $balance->available_days = $balance->total_days - $balance->used_days;
        $balance->save();

        $leaveApplication->update(['status' => 'Approved']);

        return back()->with('success', 'Leave application approved successfully.');
    }

    public function reject(LeaveApplication $leaveApplication)
    {
        $previousStatus = $leaveApplication->status;
        
        if ($previousStatus === 'Approved') {
            // Revert balance changes
            $year = Carbon::parse($leaveApplication->start_date)->year;
            $balance = LeaveBalance::where([
                'employee_id' => $leaveApplication->employee_id,
                'leave_type_id' => $leaveApplication->leave_type_id,
                'year' => $year
            ])->first();

            if ($balance) {
                $balance->used_days = max(0, $balance->used_days - $leaveApplication->days_count);
                $balance->available_days = $balance->total_days - $balance->used_days;
                $balance->save();
            }
        }

        $leaveApplication->update(['status' => 'Rejected']);

        return back()->with('success', 'Leave application rejected.');
    }

    public function destroy(LeaveApplication $leaveApplication)
    {
        // Revert balance changes if it was approved
        if ($leaveApplication->status === 'Approved') {
            $year = Carbon::parse($leaveApplication->start_date)->year;
            $balance = LeaveBalance::where([
                'employee_id' => $leaveApplication->employee_id,
                'leave_type_id' => $leaveApplication->leave_type_id,
                'year' => $year
            ])->first();

            if ($balance) {
                $balance->used_days = max(0, $balance->used_days - $leaveApplication->days_count);
                $balance->available_days = $balance->total_days - $balance->used_days;
                $balance->save();
            }
        }

        $leaveApplication->delete();
        return back()->with('success', 'Leave application deleted successfully.');
    }
}
