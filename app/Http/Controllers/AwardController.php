<?php

namespace App\Http\Controllers;

use App\Models\Award;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class AwardController extends Controller
{
    public function index(Request $request)
    {
        $query = Award::with('employee')->latest('award_date');
        $query->when($request->search, function ($q, $search) {
            $q->where(function ($sub) use ($search) {
                $sub->where('gift', 'like', "%{$search}%")
                    ->orWhere('description', 'like', "%{$search}%")
                    ->orWhereHas('employee', fn($employee) => $employee->where('name', 'like', "%{$search}%")->orWhere('email', 'like', "%{$search}%"));
            });
        });
        $query->when($request->award_type_id, fn($q, $id) => $q->where('award_type_id', $id));
        $query->when($request->employee_id, fn($q, $id) => $q->where('employee_id', $id));
        $query->when($request->from, fn($q, $date) => $q->whereDate('award_date', '>=', $date));
        $query->when($request->to, fn($q, $date) => $q->whereDate('award_date', '<=', $date));

        return view('employees.awards', [
            'awards' => $query->paginate(10)->withQueryString(),
            'employees' => Employee::orderBy('name')->get(['id','name','email','profile_image']),
            'awardTypes' => DB::table('award_types')->where('status', 1)->orderBy('name')->get(['id','name']),
        ]);
    }

    public function store(Request $request){$this->saveAward($request, new Award());return back()->with('success','Award created successfully.');}
    public function update(Request $request, Award $award){$this->saveAward($request,$award);return back()->with('success','Award updated successfully.');}

    public function destroy(Award $award)
    {
        foreach ([$award->certificate_path, $award->photo_path] as $path) if ($path) Storage::disk('public')->delete($path);
        $award->delete();
        return back()->with('success','Award deleted successfully.');
    }

    private function saveAward(Request $request, Award $award): void
    {
        $data = $request->validate([
            'employee_id' => 'required|exists:employees,id',
            'award_type_id' => 'required|exists:award_types,id',
            'award_date' => 'required|date',
            'gift' => 'nullable|string|max:191',
            'description' => 'required|string|max:2000',
            'certificate' => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:5120',
            'photo' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:5120',
            'remove_certificate' => 'nullable|boolean',
            'remove_photo' => 'nullable|boolean',
        ]);
        unset($data['certificate'],$data['photo'],$data['remove_certificate'],$data['remove_photo']);
        foreach (['certificate','photo'] as $field) if ($request->boolean('remove_'.$field)) {
            $column = $field.'_path';
            if ($award->$column) Storage::disk('public')->delete($award->$column);
            $data[$column] = null;
        }
        foreach (['certificate','photo'] as $field) if ($request->hasFile($field)) {
            $column = $field.'_path';
            if ($award->$column) Storage::disk('public')->delete($award->$column);
            $data[$column] = $request->file($field)->store('awards/'.$field,'public');
        }
        $award->fill($data)->save();
    }
}
