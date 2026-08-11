<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class EmployeeController extends Controller
{
    public function __construct() { $this->middleware('auth'); }

    public function index(Request $request)
    {
        $employees = Employee::query()
            ->when($request->search, fn ($q, $search) => $q->where(fn ($q) => $q->where('name','like',"%{$search}%")->orWhere('email','like',"%{$search}%")->orWhere('employee_code','like',"%{$search}%")))
            ->when($request->department, fn ($q, $value) => $q->where('department',$value))
            ->when($request->designation, fn ($q, $value) => $q->where('designation',$value))
            ->when($request->status, fn ($q, $value) => $q->where('employment_status',$value))
            ->latest()->paginate(10)->withQueryString();

        $departments = Employee::whereNotNull('department')->distinct()->orderBy('department')->pluck('department');
        $designations = Employee::whereNotNull('designation')->distinct()->orderBy('designation')->pluck('designation');
        $counts = ['All'=>Employee::count()];
        foreach (['Active','Inactive','Probation','Terminated'] as $status) $counts[$status] = Employee::where('employment_status',$status)->count();
        return view('employees.index', compact('employees','departments','designations','counts'));
    }

    public function create() { return view('employees.form', ['employee'=>new Employee(['employee_code'=>$this->nextCode()])]); }
    public function edit(Employee $employee) { return view('employees.form', compact('employee')); }

    public function store(Request $request)
    {
        Employee::create($this->validated($request));
        return redirect()->route('employee-list')->with('success','Employee created successfully.');
    }

    public function update(Request $request, Employee $employee)
    {
        $employee->update($this->validated($request, $employee));
        return redirect()->route('employee-list')->with('success','Employee updated successfully.');
    }

    public function destroy(Employee $employee)
    {
        $employee->delete();
        return back()->with('success','Employee deleted successfully.');
    }

    private function nextCode(): string { return 'EMP'.str_pad((string)((int)Employee::max('id')+1),6,'0',STR_PAD_LEFT); }

    private function validated(Request $request, ?Employee $employee=null): array
    {
        return $request->validate([
            'employee_code'=>['required','max:50',Rule::unique('employees')->ignore($employee)],
            'name'=>['required','max:191'], 'email'=>['required','email',Rule::unique('employees')->ignore($employee)],
            'phone'=>['required','max:30'], 'branch'=>['required','max:191'], 'department'=>['required','max:191'],
            'designation'=>['required','max:191'], 'date_of_joining'=>['required','date'],
            'employment_status'=>['required',Rule::in(['Active','Inactive','Probation','Terminated'])],
            'login_status'=>['required','boolean'],
        ]);
    }
}
