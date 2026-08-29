<?php
namespace App\Http\Controllers;
use App\Models\Employee;
use App\Models\EmployeeDocument;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\{DB,Hash,Storage,Validator};
use Illuminate\Validation\Rule;
class EmployeeController extends Controller {
 public function __construct(){$this->middleware('auth');}
 public function index(Request $r){$employees=Employee::query()->when($r->search,fn($q,$s)=>$q->where(fn($q)=>$q->where('name','like',"%$s%")->orWhere('email','like',"%$s%")->orWhere('employee_code','like',"%$s%")))->when($r->branch_id,fn($q,$v)=>$q->where('branch_id',$v))->when($r->department_id,fn($q,$v)=>$q->where('department_id',$v))->when($r->designation_id,fn($q,$v)=>$q->where('designation_id',$v))->when($r->status,fn($q,$v)=>$q->where('employment_status',$v))->latest()->paginate(10)->withQueryString();$counts=['All'=>Employee::count()];foreach(['Active','Inactive','Probation','Terminated']as$s)$counts[$s]=Employee::where('employment_status',$s)->count();return view('employees.index',compact('employees','counts')+$this->lookups());}
 public function create(){return view('employees.form',['employee'=>new Employee(['employee_code'=>$this->nextCode()])]+$this->lookups());}
 public function show(Employee $employee){$employee->load('documents.type');$data=$this->lookups();$data['branch']=$data['branches']->firstWhere('id',$employee->branch_id);$data['department']=$data['departments']->firstWhere('id',$employee->department_id);$data['designation']=$data['designations']->firstWhere('id',$employee->designation_id);$data['shift']=$data['shifts']->firstWhere('id',$employee->shift_id);$data['policy']=$data['policies']->firstWhere('id',$employee->attendance_policy_id);return view('employees.show',compact('employee')+$data);}
 public function edit(Employee $employee){$employee->load('documents.type');return view('employees.form',compact('employee')+$this->lookups());}
 public function store(Request $r){DB::transaction(function()use($r){$e=Employee::create($this->prepare($r,$this->validated($r)));$this->documents($r,$e);});return redirect()->route('employee-list')->with('success','Employee created successfully.');}
 public function update(Request $r,Employee $employee){DB::transaction(function()use($r,$employee){$employee->update($this->prepare($r,$this->validated($r,$employee),$employee));$this->documents($r,$employee);});return redirect()->route('employee-list')->with('success','Employee updated successfully.');}
 public function destroy(Employee $employee){$employee->documents()->delete();$employee->delete();return back()->with('success','Employee deleted successfully.');}
 public function changePassword(Request $r,Employee $employee){$data=$r->validate(['password'=>['required','string','min:6','max:72','regex:/^[0-9]+$/','confirmed']],['password.regex'=>'Password must contain numbers only.']);$employee->update(['password'=>Hash::make($data['password'])]);return back()->with('success','Password changed successfully.');}
 public function toggleStatus(Employee $employee){$employee->update(['login_status'=>!$employee->login_status]);return back()->with('success','Employee login status changed successfully.');}
 public function profile(Employee $employee){abort_unless($employee->profile_image&&Storage::disk('public')->exists($employee->profile_image),404);return Storage::disk('public')->response($employee->profile_image);}
 public function downloadDocument(EmployeeDocument $document){abort_unless(Storage::disk('public')->exists($document->file_path),404);$name=($document->type?->name??'employee-document').'.'.pathinfo($document->file_path,PATHINFO_EXTENSION);return Storage::disk('public')->download($document->file_path,$name);}
 private function lookups(){return['branches'=>DB::table('branches')->where('status',1)->select('id','branch_name as name')->get(),'departments'=>DB::table('departments')->where('status',1)->get(),'designations'=>DB::table('designations')->where('status',1)->get(),'shifts'=>DB::table('shifts')->where('status',1)->get(),'policies'=>DB::table('attendance_policies')->where('status',1)->get(),'documentTypes'=>DB::table('document_types')->where('status',1)->get()];}
 private function nextCode(){return'EMP'.str_pad((string)((int)Employee::max('id')+1),7,'0',STR_PAD_LEFT);}
 private function validated(Request $r, ?Employee $e=null){
  $rules=[
   'employee_code'=>['required','string','max:50','regex:/^EMP[0-9]+$/',Rule::unique('employees','employee_code')->ignore($e?->id)],
   'biometric_code'=>['required','string','max:50','regex:/^[A-Za-z0-9_-]+$/',Rule::unique('employees','biometric_code')->ignore($e?->id)],
   'name'=>['required','string','min:3','max:191','regex:/^[\pL\pM .\'-]+$/u'],
   'email'=>['required','string','email:rfc','max:191',Rule::unique('employees','email')->ignore($e?->id)],
   'password'=>[$e?'nullable':'required','string','min:6','max:72','regex:/^[0-9]+$/'],
   'phone'=>['required','string','max:30','regex:/^\+?[0-9][0-9\s().-]{6,28}$/'],
   'date_of_birth'=>['required','date','before:today'], 'gender'=>['required',Rule::in(['Male','Female','Other'])],
   'profile_image'=>['nullable','image','mimes:jpg,jpeg,png,webp','max:2048'],
   'branch_id'=>['required',Rule::exists('branches','id')->where('status',1)],
   'department_id'=>['required',Rule::exists('departments','id')->where(fn($q)=>$q->where('status',1)->where('branch_id',$r->branch_id))],
   'designation_id'=>['required',Rule::exists('designations','id')->where(fn($q)=>$q->where('status',1)->where('department_id',$r->department_id))],
   'shift_id'=>['nullable',Rule::exists('shifts','id')->where('status',1)],
   'attendance_policy_id'=>['nullable',Rule::exists('attendance_policies','id')->where('status',1)],
   'date_of_joining'=>['required','date','after:date_of_birth','before_or_equal:today'],
   'employment_type'=>['required',Rule::in(['Full-time','Part-time','Contract','Intern'])],
   'employment_status'=>['required',Rule::in(['Active','Inactive','Probation','Terminated'])], 'login_status'=>['required','boolean'],
   'address_line_1'=>['required','string','min:5','max:255'], 'address_line_2'=>['nullable','string','max:255'],
   'city'=>['required','string','max:100'], 'state'=>['required','string','max:100'], 'country'=>['required','string','max:100'],
   'postal_code'=>['required','string','max:20','regex:/^[A-Za-z0-9 -]+$/'],
   'emergency_contact_name'=>['required','string','min:3','max:191'], 'emergency_contact_relationship'=>['required','string','max:100'],
   'emergency_contact_phone'=>['required','string','max:30','regex:/^\+?[0-9][0-9\s().-]{6,28}$/'],
   'bank_name'=>['required','string','max:191'], 'account_holder_name'=>['required','string','max:191'],
   'account_number'=>['required','string','max:100','regex:/^[A-Za-z0-9 -]+$/'], 'bank_identifier_code'=>['required','string','max:100','regex:/^[A-Za-z0-9-]+$/'],
   'bank_branch'=>['required','string','max:191'], 'tax_id'=>['nullable','string','max:100'], 'base_salary'=>['required','numeric','min:0','max:999999999999.99'],
   'document_type_id'=>['nullable','array','max:10'], 'document_type_id.*'=>['nullable',Rule::exists('document_types','id')->where('status',1)],
   'document_file'=>['nullable','array','max:10'], 'document_file.*'=>['nullable','file','mimes:pdf,jpg,jpeg,png,doc,docx','max:5120'],
   'document_expiry'=>['nullable','array','max:10'], 'document_expiry.*'=>['nullable','date','after_or_equal:today'],
  ];
  $messages=[
   'employee_code.regex'=>'Employee ID must start with EMP followed by numbers.', 'biometric_code.regex'=>'Employee Code may contain letters, numbers, dash and underscore only.',
   'name.regex'=>'Full Name may contain letters, spaces, apostrophes, dots and hyphens only.', 'password.regex'=>'Password must contain numbers only.',
   'phone.regex'=>'Enter a valid phone number.', 'emergency_contact_phone.regex'=>'Enter a valid emergency phone number.',
   'date_of_birth.before'=>'Date of Birth must be before today.', 'date_of_joining.after'=>'Joining date must be after Date of Birth.',
   'date_of_joining.before_or_equal'=>'Joining date cannot be in the future.', 'department_id.exists'=>'Select an active department belonging to the selected branch.',
   'designation_id.exists'=>'Select an active designation belonging to the selected department.', 'profile_image.max'=>'Profile image must not exceed 2MB.',
   'document_file.*.mimes'=>'Document must be PDF, JPG, PNG, DOC or DOCX.', 'document_file.*.max'=>'Each document must not exceed 5MB.',
   'document_expiry.*.after_or_equal'=>'Document expiry date cannot be in the past.',
  ];
  $validator=Validator::make($r->all(),$rules,$messages,['biometric_code'=>'employee code','branch_id'=>'branch','department_id'=>'department','designation_id'=>'designation','date_of_birth'=>'date of birth','date_of_joining'=>'date of joining','address_line_1'=>'address line 1','postal_code'=>'postal code','bank_identifier_code'=>'BIC / SWIFT','base_salary'=>'base salary']);
  $validator->after(function($validator)use($r){
   $types=$r->input('document_type_id',[]); $files=$r->file('document_file',[]);
   $count=max(count($types),count($files)); for($i=0;$i<$count;$i++){if(!empty($types[$i])&&empty($files[$i]))$validator->errors()->add("document_file.$i",'Please choose a file for the selected document type.');if(empty($types[$i])&&!empty($files[$i]))$validator->errors()->add("document_type_id.$i",'Please select a document type for this file.');}
  });
  return $validator->validate();
 }
 private function prepare(Request$r,array$d,?Employee$e=null){unset($d['profile_image'],$d['document_type_id'],$d['document_file'],$d['document_expiry']);$d['branch']=DB::table('branches')->where('id',$d['branch_id'])->value('branch_name');$d['department']=DB::table('departments')->where('id',$d['department_id'])->value('name');$d['designation']=DB::table('designations')->where('id',$d['designation_id'])->value('name');if(!empty($d['password']))$d['password']=Hash::make($d['password']);else unset($d['password']);if($r->hasFile('profile_image'))$d['profile_image']=$r->file('profile_image')->store('employees/profiles','public');elseif($e)$d['profile_image']=$e->profile_image;return$d;}
 private function documents(Request$r,Employee$e){foreach($r->input('document_type_id',[])as$i=>$type){$file=$r->file("document_file.$i");if($type&&$file)$e->documents()->create(['document_type_id'=>$type,'file_path'=>$file->store('employees/documents','public'),'expiry_date'=>$r->input("document_expiry.$i")]);}}
}
