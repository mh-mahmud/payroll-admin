@extends('layouts.master')

@section('content')
<meta name="csrf-token" content="{{ csrf_token() }}">

<div class="container-fluid py-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h3 class="mb-1">Break Time</h3>
            <p class="text-muted mb-0">Manage break times and calculation rules.</p>
        </div>
        <button class="btn btn-success" id="addBreakBtn">
            + Add Break Time
        </button>
    </div>

    <div class="card">
        <div class="card-body">
            <input type="search" id="breakSearch"
                   class="form-control mb-3"
                   placeholder="Search break name...">

            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>Break Name</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Duration</th>
                            <th>Calculation Type</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="breakTableBody">
                        @include('break-times.partials.rows')
                    </tbody>
                </table>
            </div>

            <div id="breakPagination">
                {{ $breakTimes->links() }}
            </div>
        </div>
    </div>
</div>

<!-- Create/Edit Modal -->
<div class="bt-overlay" id="breakFormOverlay">
    <div class="bt-modal">
        <div class="bt-modal-header">
            <h5 id="breakModalTitle">Add Break Time</h5>
            <button type="button" class="bt-close"
                    data-close-break>&times;</button>
        </div>

        <form id="breakTimeForm">
            @csrf
            <div class="bt-modal-body">
                <div class="mb-3">
                    <label for="break_name" class="form-label">
                        Break Name <span class="text-danger">*</span>
                    </label>
                    <input type="text" id="break_name" name="break_name"
                           class="form-control" maxlength="100">
                    <div class="invalid-feedback"></div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="start_time" class="form-label">
                            Start Time <span class="text-danger">*</span>
                        </label>
                        <input type="text" id="start_time" name="start_time"
                               class="form-control">
                        <div class="invalid-feedback"></div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="end_time" class="form-label">
                            End Time <span class="text-danger">*</span>
                        </label>
                        <input type="text" id="end_time" name="end_time"
                               class="form-control">
                        <div class="invalid-feedback"></div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="duration_mins" class="form-label">
                            Duration (minutes) <span class="text-danger">*</span>
                        </label>
                        <input type="number" id="duration_mins"
                               name="duration_mins" min="1" max="1440"
                               step="1" class="form-control">
                        <div class="invalid-feedback"></div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="calculation_type" class="form-label">
                            Calculation Type <span class="text-danger">*</span>
                        </label>
                        <select id="calculation_type" name="calculation_type"
                                class="form-select">
                            <option value="">Select calculation type</option>
                            <option value="fixed">Fixed Duration</option>
                            <option value="actual">Actual Duration</option>
                        </select>
                        <div class="invalid-feedback"></div>
                    </div>
                </div>
            </div>

            <div class="bt-modal-footer">
                <button type="button" class="btn btn-light"
                        data-close-break>Cancel</button>
                <button type="submit" class="btn btn-success"
                        id="saveBreakBtn">Save Break Time</button>
            </div>
        </form>
    </div>
</div>

<!-- View Details Modal -->
<div class="bt-overlay" id="breakViewOverlay">
    <div class="bt-modal">
        <div class="bt-modal-header">
            <h5>Break Time Details</h5>
            <button type="button" class="bt-close"
                    data-close-break>&times;</button>
        </div>
        <div class="bt-modal-body" id="breakDetailsBody"></div>
    </div>
</div>
@endsection
