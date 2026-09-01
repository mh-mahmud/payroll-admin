<?php

namespace App\Http\Controllers;

use App\Models\LeavePolicy;
use App\Models\LeaveType;
use Illuminate\Http\Request;

class LeavePolicyController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = LeavePolicy::with('leaveType');

        if ($request->filled('search')) {
            $query->where('name', 'like', '%' . $request->search . '%')
                  ->orWhere('description', 'like', '%' . $request->search . '%');
        }

        if ($request->filled('leave_type_id')) {
            $query->where('leave_type_id', $request->leave_type_id);
        }

        $statusFilter = $request->input('status', 'All');
        if ($statusFilter !== 'All') {
            $query->where('status', $statusFilter);
        }

        // Get count for status tabs
        $counts = [
            'All' => LeavePolicy::count(),
            'Active' => LeavePolicy::where('status', 'Active')->count(),
            'Inactive' => LeavePolicy::where('status', 'Inactive')->count(),
        ];

        $leavePolicies = $query->latest()->paginate(10)->withQueryString();
        $leaveTypes = LeaveType::where('status', 'Active')->get();

        return view('leave_policies.index', compact('leavePolicies', 'leaveTypes', 'counts'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:191',
            'description' => 'nullable|string',
            'leave_type_id' => 'required|exists:leave_types,id',
            'carry_forward_limit' => 'required|integer|min:0',
            'min_days' => 'required|integer|min:1',
            'max_days' => 'required|integer|min:1|gte:min_days',
            'requires_approval' => 'nullable',
            'status' => 'required|string|in:Active,Inactive',
        ]);

        $validated['requires_approval'] = $request->has('requires_approval') ? true : false;

        LeavePolicy::create($validated);

        return redirect()->route('leave-policies')->with('success', 'Leave policy created successfully.');
    }

    public function update(Request $request, LeavePolicy $leavePolicy)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:191',
            'description' => 'nullable|string',
            'leave_type_id' => 'required|exists:leave_types,id',
            'carry_forward_limit' => 'required|integer|min:0',
            'min_days' => 'required|integer|min:1',
            'max_days' => 'required|integer|min:1|gte:min_days',
            'requires_approval' => 'nullable',
            'status' => 'required|string|in:Active,Inactive',
        ]);

        $validated['requires_approval'] = $request->has('requires_approval') ? true : false;

        $leavePolicy->update($validated);

        return redirect()->route('leave-policies')->with('success', 'Leave policy updated successfully.');
    }

    public function destroy(LeavePolicy $leavePolicy)
    {
        $leavePolicy->delete();
        return redirect()->route('leave-policies')->with('success', 'Leave policy deleted successfully.');
    }

    public function toggleStatus(LeavePolicy $leavePolicy)
    {
        $leavePolicy->update(['status' => $leavePolicy->status === 'Active' ? 'Inactive' : 'Active']);
        return back()->with('success', 'Leave policy status updated successfully.');
    }
}
