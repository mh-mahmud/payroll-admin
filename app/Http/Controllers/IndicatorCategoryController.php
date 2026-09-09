<?php

namespace App\Http\Controllers;

use App\Models\IndicatorCategory;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class IndicatorCategoryController extends Controller
{
    public function index(Request $request)
    {
        $query = IndicatorCategory::query()
            ->when($request->filled('search'), fn ($query) => $query->where(function ($nested) use ($request) {
                $nested->where('name', 'like', '%'.$request->search.'%')
                    ->orWhere('description', 'like', '%'.$request->search.'%');
            }))
            ->when($request->status !== null && $request->status !== '', fn ($query) => $query->where('status', $request->status))
            ->latest();

        $perPage = in_array((int) $request->per_page, [10, 25, 50], true) ? (int) $request->per_page : 10;

        return view('indicator-categories.index', [
            'categories' => $query->paginate($perPage)->withQueryString(),
            'allCount' => IndicatorCategory::count(),
            'activeCount' => IndicatorCategory::where('status', true)->count(),
            'inactiveCount' => IndicatorCategory::where('status', false)->count(),
        ]);
    }

    public function store(Request $request)
    {
        IndicatorCategory::create($this->validated($request));
        return back()->with('success', 'Indicator category created successfully.');
    }

    public function update(Request $request, IndicatorCategory $indicatorCategory)
    {
        $indicatorCategory->update($this->validated($request, $indicatorCategory->id));
        return back()->with('success', 'Indicator category updated successfully.');
    }

    public function toggle(IndicatorCategory $indicatorCategory)
    {
        $indicatorCategory->update(['status' => ! $indicatorCategory->status]);
        return back()->with('success', 'Indicator category status updated successfully.');
    }

    public function destroy(IndicatorCategory $indicatorCategory)
    {
        $indicatorCategory->delete();
        return back()->with('success', 'Indicator category deleted successfully.');
    }

    private function validated(Request $request, ?int $id = null): array
    {
        return $request->validate([
            'name' => ['required', 'string', 'min:2', 'max:191', Rule::unique('indicator_categories')->ignore($id)],
            'description' => ['nullable', 'string', 'max:1000'],
            'status' => ['required', 'boolean'],
        ]);
    }
}
