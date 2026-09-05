@if($shifts->count())

<div class="shift-grid">

    @foreach($shifts as $shift)

        <div class="shift-card">

            {{-- Card Header --}}
            <div class="shift-card-header">

                <div class="shift-title-section">

                    <div class="shift-icon">

                        @if($shift->is_night_shift)
                            <div class="p-2.5 rounded-lg bg-slate-100 text-slate-600 dark:bg-slate-800 dark:text-slate-400"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-moon h-5 w-5"><path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"></path></svg></div>
                        @else
                            <div class="p-2.5 rounded-lg bg-gray-100 text-gray-600 dark:bg-gray-700 dark:text-gray-400"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-sun h-5 w-5"><circle cx="12" cy="12" r="4"></circle><path d="M12 2v2"></path><path d="M12 20v2"></path><path d="m4.93 4.93 1.41 1.41"></path><path d="m17.66 17.66 1.41 1.41"></path><path d="M2 12h2"></path><path d="M20 12h2"></path><path d="m6.34 17.66-1.41 1.41"></path><path d="m19.07 4.93-1.41 1.41"></path></svg></div>
                        @endif

                    </div>

                    <div>

                        <h3>
                            {{ $shift->name }}
                        </h3>

                        <div class="shift-badges">

                            <span
                                class="shift-type-badge
                                {{ $shift->is_night_shift
                                    ? 'night'
                                    : 'day' }}"
                            >
                                {{ $shift->type }}
                            </span>

                            <span
                                class="status-badge
                                {{ $shift->status }}"
                            >
                                {{ ucfirst($shift->status) }}
                            </span>

                        </div>

                    </div>

                </div>


                {{-- Actions --}}
                <div class="shift-actions">

                    <button
                        type="button"
                        onclick="viewShift({{ $shift->id }})"
                        title="View"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-eye h-4 w-4"><path d="M2.062 12.348a1 1 0 0 1 0-.696 10.75 10.75 0 0 1 19.876 0 1 1 0 0 1 0 .696 10.75 10.75 0 0 1-19.876 0"></path><circle cx="12" cy="12" r="3"></circle></svg>
                    </button>

                    <button
                        type="button"
                        onclick="editShift({{ $shift->id }})"
                        title="Edit"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-square-pen h-4 w-4"><path d="M12 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.375 2.625a1 1 0 0 1 3 3l-9.013 9.014a2 2 0 0 1-.853.505l-2.873.84a.5.5 0 0 1-.62-.62l.84-2.873a2 2 0 0 1 .506-.852z"></path></svg>
                    </button>

                    <button
                        type="button"
                        onclick="deleteShift({{ $shift->id }})"
                        title="Delete"
                    >
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-4 w-4"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
                    </button>

                </div>

            </div>


            {{-- Details --}}
            <div class="shift-details">

                <div class="shift-detail">

                    <span class="detail-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock h-4 w-4 text-gray-500 mt-0.5"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    </span>

                    <div>

                        <strong>
                            {{ \Carbon\Carbon::parse($shift->start_time)->format('H:i') }}
                            -
                            {{ \Carbon\Carbon::parse($shift->end_time)->format('H:i') }}
                        </strong>

                        <small>
                            Shift Hours
                        </small>

                    </div>

                </div>


                <div class="shift-detail">

                    <span class="detail-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock h-4 w-4 text-gray-500 mt-0.5"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                    </span>

                    <div>

                        <strong>
                            {{ $shift->break_duration }}
                            minutes
                        </strong>

                        <small>
                            Break Duration
                        </small>

                    </div>

                </div>


                <div class="shift-detail">

                    <span class="detail-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-4 w-4 text-gray-500 mt-0.5"><path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>
                    </span>

                    <div>

                        <strong>
                            {{ number_format($shift->working_hours, 1) }}
                            hours
                        </strong>

                        <small>
                            Working Time
                        </small>

                    </div>

                </div>


                <div class="shift-detail">

                    <span class="detail-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-4 w-4 text-gray-500 mt-0.5"><path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>
                    </span>

                    <div>

                        <strong>
                            {{ $shift->grace_period }}
                            minutes
                        </strong>

                        <small>
                            Grace Period
                        </small>

                    </div>

                </div>

            </div>


            {{-- Description --}}
            <div class="shift-description">

                {{ $shift->description ?: 'No description provided.' }}

            </div>

        </div>

    @endforeach

</div>


{{-- Pagination --}}
<div class="pagination-container">

    <div class="pagination-info">

        Showing
        {{ $shifts->firstItem() }}
        to
        {{ $shifts->lastItem() }}
        of
        {{ $shifts->total() }}
        results

    </div>

    <div class="pagination-links">

        @if($shifts->onFirstPage())

            <button disabled>
                « Previous
            </button>

        @else

            <button
                onclick="loadShifts({{ $shifts->currentPage() - 1 }})"
            >
                « Previous
            </button>

        @endif


        <button class="current">
            {{ $shifts->currentPage() }}
        </button>


        @if($shifts->hasMorePages())

            <button
                onclick="loadShifts({{ $shifts->currentPage() + 1 }})"
            >
                Next »
            </button>

        @else

            <button disabled>
                Next »
            </button>

        @endif

    </div>

</div>

@else

<div class="empty-state">

    <div class="empty-icon">
        ◷
    </div>

    <h3>
        No shifts found
    </h3>

    <p>
        No shifts match your current search or filters.
    </p>

</div>

@endif


<style>

.shift-grid {
    display: grid;
    grid-template-columns:
        repeat(3, minmax(0, 1fr));
    gap: 24px;
}

.shift-card {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 11px;
    padding: 24px;
    box-shadow:
        0 1px 2px rgba(0,0,0,.05);
}

.shift-card-header {
    display: flex;
    justify-content: space-between;
    gap: 10px;
}

.shift-title-section {
    display: flex;
    gap: 12px;
}

.shift-icon {
    width: 40px;
    height: 40px;
    background: #f1f5f9;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 21px;
}

.shift-card h3 {
    margin: 0 0 7px;
    font-size: 17px;
    color: #111827;
}

.shift-badges {
    display: flex;
    gap: 7px;
}

.shift-type-badge,
.status-badge {
    font-size: 11px;
    padding: 4px 8px;
    border-radius: 6px;
}

.shift-type-badge.day {
    color: #92400e;
    background: #fef3c7;
    border: 1px solid #fde68a;
}

.shift-type-badge.night {
    color: #334155;
    background: #f1f5f9;
    border: 1px solid #cbd5e1;
}

.status-badge.active {
    color: #047857;
    background: #ecfdf5;
    border: 1px solid #a7f3d0;
}

.status-badge.inactive {
    color: #64748b;
    background: #f8fafc;
    border: 1px solid #cbd5e1;
}

.shift-actions {
    display: flex;
    gap: 7px;
}

.shift-actions button {
    border: none;
    background: transparent;
    color: #64748b;
    cursor: pointer;
    font-size: 17px;
}

.shift-actions button:hover {
    color: #111827;
}

.shift-details {
    margin-top: 24px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 22px;
}

.shift-detail {
    display: flex;
    gap: 10px;
}

.detail-icon {
    color: #64748b;
    font-size: 18px;
}

.shift-detail strong {
    display: block;
    color: #111827;
    font-size: 13px;
}

.shift-detail small {
    display: block;
    color: #64748b;
    margin-top: 3px;
    font-size: 11px;
}

.shift-description {
    border-top: 1px solid #e5e7eb;
    margin-top: 20px;
    padding-top: 18px;
    color: #475569;
    font-size: 13px;
    line-height: 1.5;
}

.pagination-container {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 11px;
    margin-top: 24px;
    padding: 16px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.pagination-info {
    color: #64748b;
    font-size: 13px;
}

.pagination-links {
    display: flex;
    gap: 6px;
}

.pagination-links button {
    border: 1px solid #e2e8f0;
    background: white;
    border-radius: 7px;
    padding: 8px 12px;
    color: #64748b;
    cursor: pointer;
}

.pagination-links button.current {
    background: #10b981;
    color: white;
    border-color: #10b981;
}

.pagination-links button:disabled {
    opacity: .5;
    cursor: not-allowed;
}

.empty-state {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 11px;
    padding: 60px 20px;
    text-align: center;
}

.empty-icon {
    font-size: 40px;
    color: #94a3b8;
}

.empty-state h3 {
    margin: 12px 0 5px;
}

.empty-state p {
    color: #64748b;
}

@media(max-width: 1100px) {

    .shift-grid {
        grid-template-columns: 1fr 1fr;
    }
}

@media(max-width: 700px) {

    .shift-grid {
        grid-template-columns: 1fr;
    }

    .pagination-container {
        flex-direction: column;
        gap: 12px;
    }
}

</style>