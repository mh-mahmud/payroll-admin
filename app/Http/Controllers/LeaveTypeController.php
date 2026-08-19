<?php

namespace App\Http\Controllers;

use App\Models\LeaveType;
use Illuminate\Http\Request;

class LeaveTypeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        $query = LeaveType::query();

        if ($request->filled('search')) {
            $query->where('name', 'like', '%' . $request->search . '%')
                  ->orWhere('description', 'like', '%' . $request->search . '%');
        }

        if ($request->filled('status') && $request->status !== 'All') {
            $query->where('status', $request->status);
        }

        $leaveTypes = $query->latest()->get();

        return view('leave_types.index', [
            'leaveTypes' => $leaveTypes,
            'editingLeaveType' => null
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:191',
            'description' => 'nullable|string',
            'max_days' => 'required|integer|min:0',
            'color' => 'required|string|max:20',
            'is_paid' => 'nullable',
            'status' => 'required|string|in:Active,Inactive',
        ]);

        $validated['is_paid'] = $request->has('is_paid') ? true : false;

        LeaveType::create($validated);

        return redirect()->route('leave-types')->with('success', 'Leave type created successfully.');
    }

    public function edit(LeaveType $leaveType)
    {
        $leaveTypes = LeaveType::latest()->get();

        return view('leave_types.index', [
            'leaveTypes' => $leaveTypes,
            'editingLeaveType' => $leaveType
        ]);
    }

    public function update(Request $request, LeaveType $leaveType)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:191',
            'description' => 'nullable|string',
            'max_days' => 'required|integer|min:0',
            'color' => 'required|string|max:20',
            'is_paid' => 'nullable',
            'status' => 'required|string|in:Active,Inactive',
        ]);

        $validated['is_paid'] = $request->has('is_paid') ? true : false;

        $leaveType->update($validated);

        return redirect()->route('leave-types')->with('success', 'Leave type updated successfully.');
    }

    public function destroy(LeaveType $leaveType)
    {
        $leaveType->delete();
        return redirect()->route('leave-types')->with('success', 'Leave type deleted successfully.');
    }
}
