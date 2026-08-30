<?php
namespace App\Http\Controllers;
use App\Models\OrganizationItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
class OrganizationController extends Controller {
 private array $types=['branches'=>'Branches','departments'=>'Departments','designations'=>'Designations','holidays'=>'Holidays','announcements'=>'Announcements','award-types'=>'Award Types','shifts'=>'Shifts','attendance-policies'=>'Attendance Policies','document-types'=>'Document Types'];
 public function __construct(){ $this->middleware('auth'); }
 public function branches(Request $r){return $this->index($r,'branches');} public function departments(Request $r){return $this->index($r,'departments');}
 public function designations(Request $r){return $this->index($r,'designations');} public function shifts(Request $r){return $this->index($r,'shifts');}
 public function attendancePolicies(Request $r){return $this->index($r,'attendance-policies');} public function documentTypes(Request $r){return $this->index($r,'document-types');}
 public function holidays(Request $r){return $this->index($r,'holidays');} public function announcements(Request $r){return $this->index($r,'announcements');} public function awardTypes(Request $r){return $this->index($r,'award-types');}
 public function holidayCalendar(Request $r){
  $year=(int)$r->input('year',now()->year);
  $holidays=DB::table('holidays')->whereYear('holiday_date',$year)->orderBy('holiday_date')->get();
  $colors=['National'=>'#3b82f6','Religious'=>'#a855f7','Company-specific'=>'#10b981','Regional'=>'#f59e0b'];
  $events=$holidays->map(fn($holiday)=>[
   'title'=>$holiday->name,
   'start'=>$holiday->start_date??$holiday->holiday_date,
   'end'=>$holiday->end_date?Carbon::parse($holiday->end_date)->addDay()->toDateString():null,
   'backgroundColor'=>$colors[$holiday->category]??'#64748b',
   'borderColor'=>'transparent',
  ])->values();
  $initialDate=$year.'-'.str_pad((string)($year==now()->year?now()->month:1),2,'0',STR_PAD_LEFT).'-01';
  return view('organization.holiday-calendar',compact('holidays','year','events','initialDate'));
 }
 public function holidayPdf(Request $r){$year=(int)$r->input('year',now()->year);$holidays=DB::table('holidays')->whereYear('holiday_date',$year)->orderBy('holiday_date')->get();$branches=DB::table('branches')->pluck('branch_name','id');return Pdf::loadView('organization.holiday-pdf',compact('holidays','branches','year'))->setPaper('a4','landscape')->download("holidays-$year.pdf");}
 public function holidayIcal(Request $r){$year=(int)$r->input('year',now()->year);$holidays=DB::table('holidays')->whereYear('holiday_date',$year)->orderBy('holiday_date')->get();$lines=['BEGIN:VCALENDAR','VERSION:2.0','PRODID:-//Fox Payroll//Holiday Calendar//EN','CALSCALE:GREGORIAN','METHOD:PUBLISH','X-WR-CALNAME:Company Holidays '.$year];foreach($holidays as $holiday){$start=Carbon::parse($holiday->start_date??$holiday->holiday_date);$end=Carbon::parse($holiday->end_date??$start)->addDay();$escape=fn($value)=>str_replace(["\\",";",",","\r\n","\n"],["\\\\","\\;","\\,","\\n","\\n"],(string)$value);$lines[]='BEGIN:VEVENT';$lines[]='UID:holiday-'.$holiday->id.'@fox-payroll';$lines[]='DTSTAMP:'.now('UTC')->format('Ymd\THis\Z');$lines[]='DTSTART;VALUE=DATE:'.$start->format('Ymd');$lines[]='DTEND;VALUE=DATE:'.$end->format('Ymd');$lines[]='SUMMARY:'.$escape($holiday->name);$lines[]='DESCRIPTION:'.$escape($holiday->description??'');$lines[]='CATEGORIES:'.$escape($holiday->category??'Holiday');$lines[]='END:VEVENT';}$lines[]='END:VCALENDAR';return response(implode("\r\n",$lines)."\r\n",200,['Content-Type'=>'text/calendar; charset=utf-8','Content-Disposition'=>'attachment; filename="holidays-'.$year.'.ics"']);}
 public function announcementStatistics(int $id){
  $announcement=DB::table('announcements')->find($id);abort_unless($announcement,404);
  $branchIds=json_decode($announcement->branch_ids??'[]',true)?:[];$departmentIds=json_decode($announcement->department_ids??'[]',true)?:[];
  $employees=DB::table('employees');
  if(!($announcement->is_company_wide??false)){$employees->when($branchIds,fn($q)=>$q->whereIn('branch_id',$branchIds))->when($departmentIds,fn($q)=>$q->whereIn('department_id',$departmentIds));}
  $totalEmployees=$employees->count();$views=min((int)($announcement->views_count??0),$totalEmployees);$viewRate=$totalEmployees?round(($views/$totalEmployees)*100):0;
  $branchNames=DB::table('branches')->whereIn('id',$branchIds)->pluck('branch_name');$departmentNames=DB::table('departments')->whereIn('id',$departmentIds)->pluck('name');
  return view('organization.announcement-statistics',compact('announcement','totalEmployees','views','viewRate','branchNames','departmentNames'));
 }
 public function announcementDetails(Request $request,int $id){
  $announcement=DB::table('announcements')->find($id);abort_unless($announcement,404);
  $sessionKey='viewed_announcement_'.$id;
  if(!$request->session()->has($sessionKey)){DB::table('announcements')->where('id',$id)->increment('views_count');$request->session()->put($sessionKey,true);$announcement->views_count++;}
  $branchIds=json_decode($announcement->branch_ids??'[]',true)?:[];$departmentIds=json_decode($announcement->department_ids??'[]',true)?:[];
  $employees=DB::table('employees');
  if(!($announcement->is_company_wide??false)){$employees->when($branchIds,fn($q)=>$q->whereIn('branch_id',$branchIds))->when($departmentIds,fn($q)=>$q->whereIn('department_id',$departmentIds));}
  $totalEmployees=$employees->count();$views=min((int)($announcement->views_count??0),$totalEmployees);$viewRate=$totalEmployees?round(($views/$totalEmployees)*100):0;
  return view('organization.announcement-details',compact('announcement','totalEmployees','views','viewRate'));
 }
 public function announcementTargetDepartments(Request $request){
  $branchIds=array_values(array_filter((array)$request->input('branch_ids',[]),fn($id)=>ctype_digit((string)$id)));
  if(!$branchIds)return response()->json([]);
  return response()->json(DB::table('departments')->where('status',1)->whereIn('branch_id',$branchIds)->orderBy('name')->get(['id','name','branch_id']));
 }
 private function table(string $type):string{abort_unless(isset($this->types[$type]),404);return str_replace('-','_',$type);}
 public function index(Request $r,string $type){$table=$this->table($type);$query=DB::table($table);if($type==='branches')$query->select('*','branch_name as name','branch_code as code');$query->when($r->search,fn($q,$s)=>$q->where($type==='branches'?'branch_name':'name','like',"%$s%"))->when($r->status!==null&&$r->status!=='',fn($q)=>$q->where('status',$r->status));if($type==='departments'&&$r->branch_id)$query->where('branch_id',$r->branch_id);if($type==='designations'&&$r->department_id)$query->where('department_id',$r->department_id);if($type==='document-types'&&$r->is_required!==null&&$r->is_required!=='')$query->where('is_required',$r->is_required);if($type==='holidays')$query->when($r->category,fn($q,$v)=>$q->where('category',$v))->when($r->year,fn($q,$v)=>$q->whereYear('holiday_date',$v))->when($r->from,fn($q,$v)=>$q->whereDate('holiday_date','>=',$v))->when($r->to,fn($q,$v)=>$q->whereDate('holiday_date','<=',$v));if($type==='announcements')$query->when($r->branch_id,fn($q,$v)=>$q->where(fn($sub)=>$sub->where('is_company_wide',1)->orWhereJsonContains('branch_ids',(string)$v)))->when($r->department_id,fn($q,$v)=>$q->where(fn($sub)=>$sub->where('is_company_wide',1)->orWhereJsonContains('department_ids',(string)$v)))->when($r->from,fn($q,$v)=>$q->whereDate('start_date','>=',$v))->when($r->to,fn($q,$v)=>$q->whereDate('end_date','<=',$v));$items=$query->latest()->paginate($type==='holidays'?20:10)->withQueryString();return view('organization.index',['type'=>$type,'title'=>$this->types[$type],'items'=>$items,'branches'=>DB::table('branches')->where('status',1)->select('id','branch_name as name')->get(),'departments'=>DB::table('departments')->where('status',1)->get(),'allCount'=>DB::table($table)->count(),'activeCount'=>DB::table($table)->where('status',1)->count(),'inactiveCount'=>DB::table($table)->where('status',0)->count()]);}
 public function create(string $type){$this->table($type);return view('organization.form',['type'=>$type,'title'=>$this->types[$type],'item'=>null,'branches'=>DB::table('branches')->where('status',1)->select('id','branch_name as name')->get(),'departments'=>DB::table('departments')->where('status',1)->get()]);}
 public function edit(string $type,int $id){$table=$this->table($type);$item=DB::table($table)->find($id);if($type==='branches'){$item->name=$item->branch_name;$item->code=$item->branch_code;}return view('organization.form',['type'=>$type,'title'=>$this->types[$type],'item'=>$item,'branches'=>DB::table('branches')->where('status',1)->select('id','branch_name as name')->get(),'departments'=>DB::table('departments')->where('status',1)->get()]);}
 public function store(Request $r,string $type){$table=$this->table($type);$data=$this->data($r,$type);if($type==='announcements'&&$r->hasFile('attachment'))$data['attachment']=$r->file('attachment')->store('announcements','public');DB::table($table)->insert($data+['created_at'=>now(),'updated_at'=>now()]);return redirect()->route('organization.index',$type)->with('success','Created successfully.');}
 public function update(Request $r,string $type,int $id){$data=$this->data($r,$type,$id);if($type==='announcements'&&$r->hasFile('attachment'))$data['attachment']=$r->file('attachment')->store('announcements','public');DB::table($this->table($type))->where('id',$id)->update($data+['updated_at'=>now()]);return redirect()->route('organization.index',$type)->with('success','Updated successfully.');}
 public function destroy(string $type,int $id){DB::table($this->table($type))->where('id',$id)->delete();return back()->with('success','Deleted successfully.');}
 public function toggleStatus(string $type,int $id){$table=$this->table($type);$item=DB::table($table)->find($id);abort_unless($item,404);DB::table($table)->where('id',$id)->update(['status'=>!$item->status,'updated_at'=>now()]);return back()->with('success','Status updated successfully.');}
 private function data(Request $r,string $type,?int $id=null):array{
  $r->merge(['name'=>trim((string)$r->input('name'))]);
  $nameRules=['required','string','min:2','max:100','regex:/^[\pL\pM0-9 .&()\'\/-]+$/u'];
  $codeRules=['nullable','string','max:50'];
  if($type==='branches'){$nameRules[]=Rule::unique('branches','branch_name')->ignore($id);$codeRules[]='regex:/^[A-Za-z0-9_-]+$/';$codeRules[]=Rule::unique('branches','branch_code')->ignore($id);}
  if($type==='departments'){$nameRules[]=Rule::unique('departments','name')->where(fn($q)=>$q->where('branch_id',$r->branch_id))->ignore($id);$r->validate(['branch_id'=>'required|exists:branches,id'],['branch_id.required'=>'Please select a branch.']);}
  if($type==='designations'){$nameRules[]=Rule::unique('designations','name')->where(fn($q)=>$q->where('department_id',$r->department_id))->ignore($id);$r->validate(['department_id'=>'required|exists:departments,id'],['department_id.required'=>'Please select a department.']);}
  if($type==='holidays')$r->validate(['category'=>'required|in:National,Religious,Company-specific,Regional','start_date'=>'required|date','end_date'=>'nullable|date|after_or_equal:start_date','branch_ids'=>'required|array|min:1','branch_ids.*'=>'exists:branches,id'],['branch_ids.required'=>'Please select at least one branch.']);
  if($type==='announcements'){$r->validate(['name'=>'required|string|max:191','category'=>'required|string|max:100','short_description'=>'required|string|max:500','content'=>'required|string','start_date'=>'required|date','end_date'=>'nullable|date|after_or_equal:start_date','attachment'=>'nullable|file|max:5120','branch_ids'=>'nullable|array','branch_ids.*'=>'exists:branches,id','department_ids'=>'nullable|array','department_ids.*'=>'exists:departments,id']);if(!$r->boolean('is_company_wide'))$r->validate(['branch_ids'=>'required_without:department_ids','department_ids'=>'required_without:branch_ids'],['branch_ids.required_without'=>'Select at least one target branch or department.','department_ids.required_without'=>'Select at least one target branch or department.']);}
  $data=$r->validate(['name'=>$nameRules,'code'=>$codeRules,'status'=>'required|boolean','email'=>'nullable|email|max:191','contact'=>'nullable|string|max:30','address'=>'nullable|string|max:500','city'=>'nullable|string|max:100','state'=>'nullable|string|max:100','country'=>'nullable|string|max:100','postal_code'=>'nullable|string|max:20','branch_id'=>'nullable|exists:branches,id','department_id'=>'nullable|exists:departments,id','start_time'=>'nullable','end_time'=>'nullable','late_after_minutes'=>'nullable|integer|min:0','working_hours'=>'nullable|numeric|min:0','holiday_date'=>'nullable|date','category'=>'nullable|max:100','description'=>'nullable|string','start_date'=>'nullable|date','end_date'=>'nullable|date','audience'=>'nullable|max:100','is_required'=>'nullable|boolean'],['name.required'=>'Branch name is required.','name.min'=>'Branch name must be at least 2 characters.','name.max'=>'Branch name may not be greater than 100 characters.','name.regex'=>'Branch name contains invalid characters.','name.unique'=>'This branch name already exists.','code.regex'=>'Branch code may contain letters, numbers, dash and underscore only.','code.unique'=>'This branch code already exists.']);
  if($type==='branches'){$data['branch_name']=$data['name'];$data['branch_code']=filled($data['code']??null)?strtoupper($data['code']):($id?DB::table('branches')->where('id',$id)->value('branch_code'):$this->nextBranchCode());unset($data['name'],$data['code']);}
  if($type==='departments'&&!filled($data['code']??null))$data['code']=$id?DB::table('departments')->where('id',$id)->value('code'):$this->nextDepartmentCode();
  if($type==='holidays'){$data['holiday_date']=$data['start_date'];$data['branch_ids']=json_encode($r->input('branch_ids',[]));$data['branch_id']=$r->input('branch_ids.0');$data['is_recurring']=$r->boolean('is_recurring');$data['is_paid']=$r->boolean('is_paid');}
  if($type==='announcements'){$data+=['short_description'=>$r->short_description,'content'=>$r->content,'is_featured'=>$r->boolean('is_featured'),'is_high_priority'=>$r->boolean('is_high_priority'),'is_company_wide'=>$r->boolean('is_company_wide'),'branch_ids'=>json_encode($r->input('branch_ids',[])),'department_ids'=>json_encode($r->input('department_ids',[])),'branch_id'=>$r->input('branch_ids.0'),'department_id'=>$r->input('department_ids.0'),'audience'=>$r->boolean('is_company_wide')?'Company-wide':'Targeted'];}
  return array_filter($data,fn($v,$k)=>in_array($k,DB::getSchemaBuilder()->getColumnListing($this->table($type)))&&$v!==null,ARRAY_FILTER_USE_BOTH);
 }
 private function nextBranchCode():string{$number=(int)DB::table('branches')->max('id')+1;do{$code='BR-'.str_pad((string)$number++,5,'0',STR_PAD_LEFT);}while(DB::table('branches')->where('branch_code',$code)->exists());return $code;}
 private function nextDepartmentCode():string{$number=(int)DB::table('departments')->max('id')+1;do{$code='DEPT-'.str_pad((string)$number++,5,'0',STR_PAD_LEFT);}while(DB::table('departments')->where('code',$code)->exists());return $code;}
}
