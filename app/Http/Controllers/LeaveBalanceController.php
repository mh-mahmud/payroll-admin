<?php

namespace App\Http\Controllers;

use App\Models\LeaveBalance;
use App\Models\LeaveApplication;
use App\Models\LeaveType;
use App\Models\Employee;
use Illuminate\Http\Request;
use Carbon\Carbon;

class LeaveBalanceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $year = $request->input('year', now()->year);

        $query = Employee::where('employment_status', 'Active');

        if ($request->filled('search')) {
            $query->where(function($q) use ($request) {
                $q->where('name', 'like', '%' . $request->search . '%')
                  ->orWhere('employee_code', 'like', '%' . $request->search . '%')
                  ->orWhere('email', 'like', '%' . $request->search . '%');
            });
        }

        if ($request->filled('employee_id')) {
            $query->where('id', $request->employee_id);
        }

        $employees = $query->paginate(9)->withQueryString();
        $allEmployees = Employee::where('employment_status', 'Active')->get();

        // Get all balances for the page's employees
        $employeeIds = $employees->pluck('id');
        $balances = LeaveBalance::whereIn('employee_id', $employeeIds)
            ->where('year', $year)
            ->with('leaveType')
            ->get()
            ->groupBy('employee_id');

        $leaveTypes = LeaveType::where('status', 'Active')->get();

        // Available years for dropdown
        $years = [now()->year - 1, now()->year, now()->year + 1];

        // Format balances so every employee has a row for every active leave type (even if not synced in DB yet)
        $formattedBalances = [];
        foreach ($employees as $emp) {
            $empBalances = $balances->get($emp->id, collect());
            $formattedBalances[$emp->id] = [];

            foreach ($leaveTypes as $type) {
                $existing = $empBalances->firstWhere('leave_type_id', $type->id);
                if ($existing) {
                    $formattedBalances[$emp->id][] = $existing;
                } else {
                    // Temporary instance to show on UI
                    $temporaryBalance = new LeaveBalance([
                        'employee_id' => $emp->id,
                        'leave_type_id' => $type->id,
                        'year' => $year,
                        'total_days' => $type->max_days,
                        'used_days' => 0,
                        'available_days' => $type->max_days,
                    ]);
                    $temporaryBalance->setRelation('leaveType', $type);
                    $formattedBalances[$emp->id][] = $temporaryBalance;
                }
            }
        }

        return view('leave_balances.index', compact('employees', 'allEmployees', 'formattedBalances', 'year', 'years', 'leaveTypes'));
    }

    public function sync(Request $request)
    {
        $year = $request->input('year', now()->year);
        $employees = Employee::where('employment_status', 'Active')->get();
        $leaveTypes = LeaveType::where('status', 'Active')->get();

        foreach ($employees as $emp) {
            foreach ($leaveTypes as $type) {
                // Calculate used days from approved applications
                $usedDays = LeaveApplication::where([
                    'employee_id' => $emp->id,
                    'leave_type_id' => $type->id,
                    'status' => 'Approved'
                ])
                ->whereYear('start_date', $year)
                ->sum('days_count');

                $totalDays = $type->max_days;
                $availableDays = max(0, $totalDays - $usedDays);

                LeaveBalance::updateOrCreate(
                    [
                        'employee_id' => $emp->id,
                        'leave_type_id' => $type->id,
                        'year' => $year
                    ],
                    [
                        'total_days' => $totalDays,
                        'used_days' => $usedDays,
                        'available_days' => $availableDays
                    ]
                );
            }
        }

        return redirect()->route('leave-balances', ['year' => $year])
            ->with('success', 'Leave balances synced successfully.');
    }
}
