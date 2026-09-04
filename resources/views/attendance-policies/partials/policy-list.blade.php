@if($policies->count())

    <div class="policy-grid">

        @foreach($policies as $policy)

            <div class="policy-card">

                <div class="policy-card-header">

                    <div class="policy-title-area">

                        <div class="policy-icon">
                            <div class="p-2.5 rounded-lg bg-blue-100 text-blue-600 dark:bg-blue-900/30 dark:text-blue-400"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-shield h-5 w-5"><path d="M20 13c0 5-3.5 7.5-7.66 8.95a1 1 0 0 1-.67-.01C7.5 20.5 4 18 4 13V6a1 1 0 0 1 1-1c2 0 4.5-1.2 6.24-2.72a1.17 1.17 0 0 1 1.52 0C14.51 3.81 17 5 19 5a1 1 0 0 1 1 1z"></path></svg></div>
                        </div>

                        <div>

                            <div class="policy-name">
                                {{ $policy->name }}
                            </div>

                            @if($policy->status === 'active')

                                <span class="status-badge status-active">
                                    Active
                                </span>

                            @else

                                <span class="status-badge status-inactive">
                                    Inactive
                                </span>

                            @endif

                        </div>

                    </div>


                    <div class="policy-actions">

                        {{-- View --}}
                        <button
                            type="button"
                            title="View"
                            onclick="viewPolicy({{ $policy->id }})"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-eye h-4 w-4"><path d="M2.062 12.348a1 1 0 0 1 0-.696 10.75 10.75 0 0 1 19.876 0 1 1 0 0 1 0 .696 10.75 10.75 0 0 1-19.876 0"></path><circle cx="12" cy="12" r="3"></circle></svg>
                        </button>


                        {{-- Edit --}}
                        <button
                            type="button"
                            title="Edit"
                            onclick="editPolicy({{ $policy->id }})"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-square-pen h-4 w-4"><path d="M12 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path><path d="M18.375 2.625a1 1 0 0 1 3 3l-9.013 9.014a2 2 0 0 1-.853.505l-2.873.84a.5.5 0 0 1-.62-.62l.84-2.873a2 2 0 0 1 .506-.852z"></path></svg>
                        </button>


                        {{-- Delete --}}
                        <button
                            type="button"
                            title="Delete"
                            onclick="deletePolicy({{ $policy->id }})"
                        >
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-4 w-4"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
                        </button>

                    </div>

                </div>


                <div class="policy-details">

                    {{-- Late --}}
                    <div class="detail-item">

                        <div class="detail-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock h-4 w-4 text-orange-500 mt-0.5"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                        </div>

                        <div>

                            <div class="detail-value">

                                {{ $policy->late_arrival_grace }}
                                minutes

                            </div>

                            <div class="detail-label">
                                Late Arrival Grace
                            </div>

                        </div>

                    </div>


                    {{-- Overtime --}}
                    <div class="detail-item">

                        <div class="detail-icon green">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-dollar-sign h-4 w-4 text-green-500 mt-0.5"><line x1="12" x2="12" y1="2" y2="22"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                        </div>

                        <div>

                            <div class="detail-value">

                                ${{ number_format(
                                    $policy->overtime_rate,
                                    2
                                ) }}/hr

                            </div>

                            <div class="detail-label">
                                Overtime Rate
                            </div>

                        </div>

                    </div>


                    {{-- Early departure --}}
                    <div class="detail-item">

                        <div class="detail-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock h-4 w-4 text-blue-500 mt-0.5"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                        </div>

                        <div>

                            <div class="detail-value">

                                {{ $policy->early_departure_grace }}
                                minutes

                            </div>

                            <div class="detail-label">
                                Early Departure Grace
                            </div>

                        </div>

                    </div>

                </div>


                @if($policy->description)

                    <div
                        class="policy-description"
                        title="{{ $policy->description }}"
                    >
                        {{ $policy->description }}
                    </div>

                @endif

            </div>

        @endforeach

    </div>


    {{-- Pagination --}}

    <div class="pagination-wrapper">

        {{ $policies->links() }}

    </div>

@else

    <div
        style="
            background:white;
            border:1px solid #e4e7ec;
            border-radius:12px;
            padding:50px;
            text-align:center;
        "
    >

        <h4>No attendance policies found</h4>

        <p style="color:#667085;">
            Create your first attendance policy to get started.
        </p>

        <button
            type="button"
            class="btn-add-policy"
            onclick="openCreateModal()"
        >
            + Add Attendance Policy
        </button>

    </div>

@endif