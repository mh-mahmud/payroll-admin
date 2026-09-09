<?php

namespace App\Http\Controllers;

use App\Models\IndicatorCategory;
use App\Models\PerformanceIndicator;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class PerformanceIndicatorController extends Controller
{
    public function index(Request $request)
    {
        $query = PerformanceIndicator::with('category')
            ->when($request->filled('search'), fn ($query) => $query->where(function ($nested) use ($request) {
                $nested->where('name', 'like', '%'.$request->search.'%')
                    ->orWhere('description', 'like', '%'.$request->search.'%')
                    ->orWhere('measurement_unit', 'like', '%'.$request->search.'%');
            }))
            ->when($request->filled('category_id'), fn ($query) => $query->where('indicator_category_id', $request->category_id))
            ->when($request->status !== null && $request->status !== '', fn ($query) => $query->where('status', $request->status))
            ->latest();

        $perPage = in_array((int) $request->per_page, [10, 25, 50], true) ? (int) $request->per_page : 10;

        return view('indicators.index', [
            'indicators' => $query->paginate($perPage)->withQueryString(),
            'categories' => IndicatorCategory::where('status', true)->orderBy('name')->get(),
            'allCount' => PerformanceIndicator::count(),
            'activeCount' => PerformanceIndicator::where('status', true)->count(),
            'inactiveCount' => PerformanceIndicator::where('status', false)->count(),
        ]);
    }

    public function store(Request $request)
    {
        PerformanceIndicator::create($this->validated($request));
        return back()->with('success', 'Performance indicator created successfully.');
    }

    public function update(Request $request, PerformanceIndicator $indicator)
    {
        $indicator->update($this->validated($request, $indicator->id));
        return back()->with('success', 'Performance indicator updated successfully.');
    }

    public function toggle(PerformanceIndicator $indicator)
    {
        $indicator->update(['status' => ! $indicator->status]);
        return back()->with('success', 'Performance indicator status updated successfully.');
    }

    public function destroy(PerformanceIndicator $indicator)
    {
        $indicator->delete();
        return back()->with('success', 'Performance indicator deleted successfully.');
    }

    private function validated(Request $request, ?int $id = null): array
    {
        return $request->validate([
            'name' => ['required', 'string', 'min:2', 'max:191', Rule::unique('performance_indicators')->ignore($id)],
            'indicator_category_id' => ['required', 'exists:indicator_categories,id'],
            'description' => ['nullable', 'string', 'max:1000'],
            'measurement_unit' => ['required', 'string', 'max:100'],
            'target_value' => ['required', 'string', 'max:100'],
            'status' => ['required', 'boolean'],
        ]);
    }
}
