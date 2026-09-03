<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Designation;
use App\Models\Employee;
use App\Models\Promotion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class PromotionController extends Controller
{
    public function index(Request $request)
    {
        $query=Promotion::with(['employee','previousDesignation','newDesignation'])->latest('promotion_date');
        $query->when($request->search,fn($q,$v)=>$q->whereHas('employee',fn($e)=>$e->where('name','like',"%$v%")->orWhere('email','like',"%$v%")));
        $query->when($request->designation_id,fn($q,$v)=>$q->where('new_designation_id',$v));
        $query->when($request->from,fn($q,$v)=>$q->whereDate('promotion_date','>=',$v));
        $query->when($request->to,fn($q,$v)=>$q->whereDate('promotion_date','<=',$v));
        $query->when($request->status&&$request->status!=='All',fn($q)=>$q->where('status',$request->status));
        $counts=['All'=>Promotion::count(),'Pending'=>Promotion::where('status','Pending')->count(),'Approved'=>Promotion::where('status','Approved')->count(),'Rejected'=>Promotion::where('status','Rejected')->count()];
        return view('promotions.index',['promotions'=>$query->paginate(10)->withQueryString(),'employees'=>Employee::orderBy('name')->get(),'designations'=>Designation::where('status',1)->orderBy('name')->get(),'counts'=>$counts]);
    }

    public function store(Request $request){$this->savePromotion($request,new Promotion);return back()->with('success','Promotion created successfully.');}
    public function update(Request $request,Promotion $promotion){$this->savePromotion($request,$promotion);return back()->with('success','Promotion updated successfully.');}
    public function status(Request $request,Promotion $promotion)
    {
        $data=$request->validate(['status'=>'required|in:Pending,Approved,Rejected']);
        DB::transaction(function()use($promotion,$data){$promotion->update($data);if($data['status']==='Approved')$promotion->employee()->update(['designation_id'=>$promotion->new_designation_id]);});
        return back()->with('success','Promotion status updated successfully.');
    }
    public function destroy(Promotion $promotion){if($promotion->document_path)Storage::disk('public')->delete($promotion->document_path);$promotion->delete();return back()->with('success','Promotion deleted successfully.');}
    public function document(Promotion $promotion){abort_unless($promotion->document_path&&Storage::disk('public')->exists($promotion->document_path),404);return Storage::disk('public')->response($promotion->document_path);}

    private function savePromotion(Request $request,Promotion $promotion): void
    {
        $data=$request->validate(['employee_id'=>'required|exists:employees,id','new_designation_id'=>'required|exists:designations,id','promotion_date'=>'required|date','effective_date'=>'nullable|date|after_or_equal:promotion_date','reason'=>'nullable|string|max:2000','document'=>'nullable|file|mimes:pdf,jpg,jpeg,png,doc,docx|max:5120','status'=>'required|in:Pending,Approved,Rejected']);
        $employee=Employee::findOrFail($data['employee_id']);
        if(!$employee->designation_id)throw \Illuminate\Validation\ValidationException::withMessages(['employee_id'=>'The selected employee has no current designation.']);
        $data['previous_designation_id']=$employee->designation_id;
        unset($data['document']);
        if($request->hasFile('document')){if($promotion->document_path)Storage::disk('public')->delete($promotion->document_path);$data['document_path']=$request->file('document')->store('promotions','public');}
        DB::transaction(function()use($promotion,$data){$promotion->fill($data)->save();if($data['status']==='Approved')$promotion->employee()->update(['designation_id'=>$promotion->new_designation_id]);});
    }
}
