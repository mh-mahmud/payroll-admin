@extends('layouts.master')

@section('content')

<meta name="csrf-token" content="{{ csrf_token() }}">

<div class="page-container">

    {{-- Header --}}
    <div class="page-header">

        <div>
            <h1>Shifts</h1>
            <p>Manage work shifts and schedules.</p>
        </div>

        <button
            type="button"
            class="btn-add"
            onclick="openShiftModal()"
        >
            <span>+</span>
            Add Shift
        </button>

    </div>


    {{-- Statistics --}}
    <div class="stats-grid">

        {{-- Total --}}
        <div class="stat-card">

            <div class="stat-content">

                <div class="stat-title">
                    Total Shifts
                </div>

                <div
                    class="stat-number"
                    id="totalShifts"
                >
                    {{ $totalShifts }}
                </div>

                <div class="stat-description">
                    All shifts
                </div>

            </div>

            <div class="stat-icon stat-icon-gray">
                <div class="relative z-10 p-3 bg-gray-100 dark:bg-gray-700 rounded-xl"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-users h-7 w-7 text-gray-600 dark:text-gray-400"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M22 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg></div>
            </div>

        </div>


        {{-- Active --}}
        <div class="stat-card">

            <div class="stat-content">

                <div class="stat-title">
                    Active Shifts
                </div>

                <div
                    class="stat-number"
                    id="activeShifts"
                >
                    {{ $activeShifts }}
                </div>

                <div class="stat-description green">
                    Currently active
                </div>

            </div>

            <div class="stat-icon stat-icon-green">
                <div class="relative z-10 p-3 bg-green-100 dark:bg-green-900/40 rounded-xl"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-sun h-7 w-7 text-green-600 dark:text-green-400"><circle cx="12" cy="12" r="4"></circle><path d="M12 2v2"></path><path d="M12 20v2"></path><path d="m4.93 4.93 1.41 1.41"></path><path d="m17.66 17.66 1.41 1.41"></path><path d="M2 12h2"></path><path d="M20 12h2"></path><path d="m6.34 17.66-1.41 1.41"></path><path d="m19.07 4.93-1.41 1.41"></path></svg></div>
            </div>

        </div>


        {{-- Night --}}
        <div class="stat-card">

            <div class="stat-content">

                <div class="stat-title">
                    Night Shifts
                </div>

                <div
                    class="stat-number"
                    id="nightShifts"
                >
                    {{ $nightShifts }}
                </div>

                <div class="stat-description">
                    Night schedule
                </div>

            </div>

            <div class="stat-icon stat-icon-gray">
                <div class="relative z-10 p-3 bg-slate-100 dark:bg-slate-800 rounded-xl"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-moon h-7 w-7 text-slate-600 dark:text-slate-400"><path d="M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z"></path></svg></div>
            </div>

        </div>


        {{-- Day --}}
        <div class="stat-card">

            <div class="stat-content">

                <div class="stat-title">
                    Day Shifts
                </div>

                <div class="stat-number" id="dayShifts">
                    {{ $dayShifts }}
                </div>

                <div class="stat-description blue">
                    Day schedule
                </div>

            </div>

            <div class="stat-icon stat-icon-blue">
                <div class="relative z-10 p-3 bg-blue-100 dark:bg-blue-900/40 rounded-xl"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-sun h-7 w-7 text-blue-600 dark:text-blue-400"><circle cx="12" cy="12" r="4"></circle><path d="M12 2v2"></path><path d="M12 20v2"></path><path d="m4.93 4.93 1.41 1.41"></path><path d="m17.66 17.66 1.41 1.41"></path><path d="M2 12h2"></path><path d="M20 12h2"></path><path d="m6.34 17.66-1.41 1.41"></path><path d="m19.07 4.93-1.41 1.41"></path></svg></div>
            </div>

        </div>

    </div>


    {{-- Search / Filters --}}
    <div class="filter-container">

        <div class="filter-row">

            <div class="search-box">

                <span class="search-icon">
                    ⌕
                </span>

                <input
                    type="text"
                    id="searchInput"
                    placeholder="Search..."
                >

            </div>


            <select id="typeFilter" class="type-select">

                <option value="all">
                    All Types
                </option>

                <option value="day">
                    Day Shift
                </option>

                <option value="night">
                    Night Shift
                </option>

            </select>


            <button
                type="button"
                class="filter-button"
                onclick="loadShifts()"
            >
                ⚱ &nbsp; Filters
            </button>

        </div>


        {{-- Tabs --}}
        <div class="tabs">

            <button
                class="tab active"
                data-status="all"
                onclick="changeStatus('all', this)"
            >
                ▦
                All
                <span id="allCount">
                    {{ $totalShifts }}
                </span>
            </button>


            <button
                class="tab"
                data-status="active"
                onclick="changeStatus('active', this)"
            >
                ⊙
                Active
                <span id="activeCount">
                    {{ $activeShifts }}
                </span>
            </button>


            <button
                class="tab"
                data-status="inactive"
                onclick="changeStatus('inactive', this)"
            >
                ⊗
                Inactive
                <span id="inactiveCount">
                    {{ $totalShifts - $activeShifts }}
                </span>
            </button>

        </div>

    </div>


    {{-- Shift List --}}
    <div id="shiftList">

        @include(
            'shifts.partials.shift-list',
            ['shifts' => $shifts]
        )

    </div>

</div>


{{-- ========================================================= --}}
{{-- ADD / EDIT SHIFT MODAL --}}
{{-- ========================================================= --}}

<div
    class="modal-overlay"
    id="shiftModal"
>

    <div class="modal-box">

        <div class="modal-header">

            <div>
                <h2 id="modalTitle">
                    Add Shift
                </h2>

                <p>
                    Create or update a work shift.
                </p>
            </div>

            <button
                type="button"
                class="modal-close"
                onclick="closeShiftModal()"
            >
                ×
            </button>

        </div>


        <form id="shiftForm">

            @csrf

            <input
                type="hidden"
                id="shift_id"
                name="shift_id"
            >


            {{-- Shift Name --}}
            <div class="form-group">

                <label for="name">
                    Shift Name
                    <span class="required">*</span>
                </label>

                <input
                    type="text"
                    id="name"
                    name="name"
                    class="form-control"
                    placeholder="e.g. Morning Shift"
                >

                <div
                    class="invalid-feedback"
                    id="error-name"
                ></div>

            </div>


            {{-- Description --}}
            <div class="form-group">

                <label for="description">
                    Description
                </label>

                <textarea
                    id="description"
                    name="description"
                    class="form-control"
                    rows="3"
                    placeholder="Describe this shift..."
                ></textarea>

                <div
                    class="invalid-feedback"
                    id="error-description"
                ></div>

            </div>


            {{-- Start / End --}}
            <div class="form-row">

                <div class="form-group">

                    <label for="start_time">
                        Start Time
                        <span class="required">*</span>
                    </label>

                    <input
                        type="time"
                        id="start_time"
                        name="start_time"
                        class="form-control"
                    >

                    <div
                        class="invalid-feedback"
                        id="error-start_time"
                    ></div>

                </div>


                <div class="form-group">

                    <label for="end_time">
                        End Time
                        <span class="required">*</span>
                    </label>

                    <input
                        type="time"
                        id="end_time"
                        name="end_time"
                        class="form-control"
                    >

                    <div
                        class="invalid-feedback"
                        id="error-end_time"
                    ></div>

                </div>

            </div>


            {{-- Break Duration --}}
            <div class="form-group">

                <label for="break_duration">

                    Break Duration (minutes)
                    <span class="required">*</span>

                </label>

                <input
                    type="number"
                    id="break_duration"
                    name="break_duration"
                    class="form-control"
                    min="0"
                    placeholder="60"
                >

                <div
                    class="invalid-feedback"
                    id="error-break_duration"
                ></div>

            </div>


            {{-- Break Start / End --}}
            <div class="form-row">

                <div class="form-group">

                    <label for="break_start_time">
                        Break Start Time
                    </label>

                    <input
                        type="time"
                        id="break_start_time"
                        name="break_start_time"
                        class="form-control"
                    >

                    <div
                        class="invalid-feedback"
                        id="error-break_start_time"
                    ></div>

                </div>


                <div class="form-group">

                    <label for="break_end_time">
                        Break End Time
                    </label>

                    <input
                        type="time"
                        id="break_end_time"
                        name="break_end_time"
                        class="form-control"
                    >

                    <div
                        class="invalid-feedback"
                        id="error-break_end_time"
                    ></div>

                </div>

            </div>


            {{-- Grace --}}
            <div class="form-group">

                <label for="grace_period">

                    Grace Period (minutes)
                    <span class="required">*</span>

                </label>

                <input
                    type="number"
                    id="grace_period"
                    name="grace_period"
                    class="form-control"
                    min="0"
                    placeholder="15"
                >

                <div
                    class="invalid-feedback"
                    id="error-grace_period"
                ></div>

            </div>


            {{-- Night Shift --}}
            <div class="checkbox-group">

                <input
                    type="checkbox"
                    id="is_night_shift"
                    name="is_night_shift"
                    value="1"
                >

                <label for="is_night_shift">
                    Night Shift
                </label>

            </div>


            {{-- Status --}}
            <div class="form-group">

                <label for="status">

                    Status
                    <span class="required">*</span>

                </label>

                <select
                    id="status"
                    name="status"
                    class="form-control"
                >

                    <option value="active">
                        Active
                    </option>

                    <option value="inactive">
                        Inactive
                    </option>

                </select>

                <div
                    class="invalid-feedback"
                    id="error-status"
                ></div>

            </div>


            {{-- Footer --}}
            <div class="modal-footer">

                <button
                    type="button"
                    class="btn-cancel"
                    onclick="closeShiftModal()"
                >
                    Cancel
                </button>

                <button
                    type="submit"
                    class="btn-save"
                    id="saveShiftBtn"
                >
                    Save
                </button>

            </div>

        </form>

    </div>

</div>


{{-- ========================================================= --}}
{{-- VIEW MODAL --}}
{{-- ========================================================= --}}

<div
    class="modal-overlay"
    id="viewShiftModal"
>

    <div class="modal-box">

        <div class="modal-header">

            <div>
                <h2 id="viewShiftName">
                    Shift
                </h2>

                <p>
                    Shift details
                </p>
            </div>

            <button
                type="button"
                class="modal-close"
                onclick="closeViewShiftModal()"
            >
                ×
            </button>

        </div>


        <div class="view-details">

            <div class="detail-item">
                <span>Type</span>
                <strong id="viewShiftType"></strong>
            </div>

            <div class="detail-item">
                <span>Status</span>
                <strong id="viewShiftStatus"></strong>
            </div>

            <div class="detail-item">
                <span>Shift Hours</span>
                <strong id="viewShiftHours"></strong>
            </div>

            <div class="detail-item">
                <span>Break Duration</span>
                <strong id="viewBreakDuration"></strong>
            </div>

            <div class="detail-item">
                <span>Grace Period</span>
                <strong id="viewGracePeriod"></strong>
            </div>

            <div class="detail-item">
                <span>Break Time</span>
                <strong id="viewBreakTime"></strong>
            </div>

            <div class="detail-description">
                <span>Description</span>
                <p id="viewShiftDescription"></p>
            </div>

        </div>

    </div>

</div>


<style>

/* =========================================================
   PAGE
========================================================= */

.page-container {
    padding: 22px 44px;
    background: #f8fafc;
    min-height: calc(100vh - 60px);
}

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
}

.page-header h1 {
    margin: 0;
    font-size: 22px;
    color: #111827;
}

.page-header p {
    margin: 4px 0 0;
    font-size: 13px;
    color: #64748b;
}


/* =========================================================
   BUTTON
========================================================= */

.btn-add {
    border: none;
    background: #10b981;
    color: white;
    padding: 9px 15px;
    border-radius: 8px;
    font-weight: 600;
    cursor: pointer;
}

.btn-add span {
    font-size: 20px;
    margin-right: 5px;
}


/* =========================================================
   STATS
========================================================= */

.stats-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    margin-bottom: 16px;
}

.stat-card {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 11px;
    min-height: 120px;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    box-shadow: 0 1px 2px rgba(0,0,0,.05);
}

.stat-title {
    color: #64748b;
    font-size: 14px;
}

.stat-number {
    font-size: 24px;
    font-weight: 700;
    color: #111827;
    margin-top: 6px;
}

.stat-description {
    font-size: 12px;
    color: #64748b;
    margin-top: 7px;
}

.stat-description.green {
    color: #00a86b;
}

.stat-description.blue {
    color: #2563eb;
}

.stat-icon {
    width: 52px;
    height: 52px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 27px;
}

.stat-icon-gray {
    background: #f1f5f9;
}

.stat-icon-green {
    background: #dcfce7;
}

.stat-icon-blue {
    background: #dbeafe;
}


/* =========================================================
   FILTER
========================================================= */

.filter-container {
    background: white;
    border: 1px solid #e2e8f0;
    border-radius: 11px;
    margin-bottom: 16px;
}

.filter-row {
    padding: 12px;
    display: flex;
    gap: 8px;
}

.search-box {
    width: 257px;
    position: relative;
}

.search-box input {
    width: 100%;
    box-sizing: border-box;
    padding: 9px 12px 9px 36px;
    border: 1px solid #dbe1e8;
    border-radius: 8px;
    outline: none;
}

.search-icon {
    position: absolute;
    left: 12px;
    top: 7px;
    color: #64748b;
    font-size: 20px;
}

.type-select {
    width: 160px;
    border: 1px solid #dbe1e8;
    border-radius: 8px;
    padding: 9px 12px;
    background: white;
}

.filter-button {
    margin-left: auto;
    border: 1px solid #dbe1e8;
    background: white;
    border-radius: 8px;
    padding: 8px 14px;
    cursor: pointer;
}

.tabs {
    border-top: 1px solid #e2e8f0;
    display: flex;
    padding-left: 12px;
}

.tab {
    border: none;
    background: transparent;
    padding: 13px 16px;
    cursor: pointer;
    color: #64748b;
    border-bottom: 2px solid transparent;
}

.tab.active {
    color: #00a878;
    border-bottom-color: #00b783;
}

.tab span {
    background: #f1f5f9;
    border-radius: 20px;
    padding: 2px 7px;
    font-size: 11px;
    margin-left: 3px;
}


/* =========================================================
   MODAL
========================================================= */

.modal-overlay {
    display: none;
    position: fixed;
    inset: 0;
    background: rgba(15, 23, 42, .45);
    z-index: 9999;
    align-items: center;
    justify-content: center;
    padding: 20px;
}

.modal-overlay.show {
    display: flex;
}

.modal-box {
    background: white;
    width: 560px;
    max-width: 100%;
    max-height: 90vh;
    overflow-y: auto;
    border-radius: 12px;
    box-shadow: 0 20px 50px rgba(0,0,0,.2);
}

.modal-header {
    display: flex;
    justify-content: space-between;
    padding: 20px 22px;
    border-bottom: 1px solid #e5e7eb;
}

.modal-header h2 {
    margin: 0;
    font-size: 19px;
}

.modal-header p {
    margin: 4px 0 0;
    color: #64748b;
    font-size: 12px;
}

.modal-close {
    border: none;
    background: transparent;
    font-size: 27px;
    color: #64748b;
    cursor: pointer;
}

#shiftForm {
    padding: 20px 22px;
}


/* =========================================================
   FORM
========================================================= */

.form-group {
    margin-bottom: 16px;
}

.form-group label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    color: #334155;
    margin-bottom: 6px;
}

.required {
    color: #ef4444;
}

.form-control {
    width: 100%;
    box-sizing: border-box;
    border: 1px solid #dbe1e8;
    border-radius: 7px;
    padding: 9px 11px;
    outline: none;
    font-size: 14px;
}

.form-control:focus {
    border-color: #10b981;
    box-shadow: 0 0 0 2px rgba(16,185,129,.1);
}

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
}

.invalid-feedback {
    display: none;
    color: #dc2626;
    font-size: 12px;
    margin-top: 5px;
}

.form-control.is-invalid {
    border-color: #dc2626;
}

.checkbox-group {
    display: flex;
    align-items: center;
    gap: 8px;
    margin: 4px 0 18px;
}

.checkbox-group input {
    width: 16px;
    height: 16px;
}

.checkbox-group label {
    font-size: 13px;
    cursor: pointer;
}


/* =========================================================
   MODAL FOOTER
========================================================= */

.modal-footer {
    display: flex;
    justify-content: flex-end;
    gap: 8px;
    padding-top: 8px;
}

.btn-cancel {
    border: 1px solid #dbe1e8;
    background: white;
    padding: 9px 16px;
    border-radius: 7px;
    cursor: pointer;
}

.btn-save {
    border: none;
    background: #10b981;
    color: white;
    padding: 9px 20px;
    border-radius: 7px;
    cursor: pointer;
}

.btn-save:disabled {
    opacity: .6;
    cursor: not-allowed;
}


/* =========================================================
   VIEW
========================================================= */

.view-details {
    padding: 22px;
}

.detail-item {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #f1f5f9;
}

.detail-item span,
.detail-description span {
    color: #64748b;
    font-size: 13px;
}

.detail-item strong {
    color: #111827;
    font-size: 13px;
}

.detail-description {
    padding-top: 16px;
}

.detail-description p {
    color: #334155;
    font-size: 13px;
    line-height: 1.6;
}


/* =========================================================
   RESPONSIVE
========================================================= */

@media(max-width: 900px) {

    .stats-grid {
        grid-template-columns: 1fr 1fr;
    }

    .page-container {
        padding: 20px;
    }
}

@media(max-width: 600px) {

    .stats-grid {
        grid-template-columns: 1fr;
    }

    .form-row {
        grid-template-columns: 1fr;
    }

    .filter-row {
        flex-wrap: wrap;
    }

    .search-box {
        width: 100%;
    }

    .type-select {
        width: 100%;
    }

}

</style>


<script>

document.addEventListener('DOMContentLoaded', function () {

    let currentStatus = 'all';

    const form = document.getElementById('shiftForm');

    /*
    |--------------------------------------------------------------------------
    | Open Add Modal
    |--------------------------------------------------------------------------
    */

    window.openShiftModal = function () {

        form.reset();

        document.getElementById('shift_id').value = '';

        document.getElementById('modalTitle').innerText =
            'Add Shift';

        document.getElementById('status').value =
            'active';

        clearValidationErrors();

        document
            .getElementById('shiftModal')
            .classList.add('show');
    };


    /*
    |--------------------------------------------------------------------------
    | Close Modal
    |--------------------------------------------------------------------------
    */

    window.closeShiftModal = function () {

        document
            .getElementById('shiftModal')
            .classList.remove('show');

        clearValidationErrors();
    };


    /*
    |--------------------------------------------------------------------------
    | View Modal
    |--------------------------------------------------------------------------
    */

    window.closeViewShiftModal = function () {

        document
            .getElementById('viewShiftModal')
            .classList.remove('show');
    };


    /*
    |--------------------------------------------------------------------------
    | Change Status Tab
    |--------------------------------------------------------------------------
    */

    window.changeStatus = function (status, button) {

        currentStatus = status;

        document
            .querySelectorAll('.tab')
            .forEach(tab => {
                tab.classList.remove('active');
            });

        button.classList.add('active');

        loadShifts();
    };


    /*
    |--------------------------------------------------------------------------
    | Load Shifts
    |--------------------------------------------------------------------------
    */

    window.loadShifts = function (page = 1) {

        const search =
            document.getElementById('searchInput').value;

        const type =
            document.getElementById('typeFilter').value;

        const params = new URLSearchParams();

        params.append('page', page);
        params.append('search', search);
        params.append('status', currentStatus);
        params.append('type', type);

        fetch(
            "{{ route('shifts.index') }}?" +
            params.toString(),
            {
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'Accept': 'application/json'
                }
            }
        )
        .then(response => response.json())
        .then(data => {

            document.getElementById('shiftList')
                .innerHTML = data.html;

            updateStats(data.stats);

        })
        .catch(error => {

            console.error(error);

            Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Unable to load shifts.'
            });

        });
    };


    /*
    |--------------------------------------------------------------------------
    | Update Statistics
    |--------------------------------------------------------------------------
    */

    function updateStats(stats) {

        document.getElementById('totalShifts')
            .innerText = stats.total;

        document.getElementById('activeShifts')
            .innerText = stats.active;

        document.getElementById('nightShifts')
            .innerText = stats.night;

        document.getElementById('dayShifts')
            .innerText = stats.day;

        document.getElementById('allCount')
            .innerText = stats.total;

        document.getElementById('activeCount')
            .innerText = stats.active;

        document.getElementById('inactiveCount')
            .innerText =
            stats.total - stats.active;
    }


    /*
    |--------------------------------------------------------------------------
    | Submit Form
    |--------------------------------------------------------------------------
    */

    form.addEventListener('submit', function (e) {

        e.preventDefault();

        clearValidationErrors();

        const saveBtn =
            document.getElementById('saveShiftBtn');

        saveBtn.disabled = true;

        saveBtn.innerText = 'Saving...';

        const formData = new FormData(form);

        const shiftId =
            document.getElementById('shift_id').value;

        let url =
            "{{ route('shifts.store') }}";


        /*
        |--------------------------------------------------------------------------
        | Update
        |--------------------------------------------------------------------------
        */

        if (shiftId) {

            url =
                "{{ url('shifts') }}/" +
                shiftId;

            formData.set('_method', 'PUT');
        }


        /*
        |--------------------------------------------------------------------------
        | Checkbox
        |--------------------------------------------------------------------------
        */

        if (
            !document.getElementById(
                'is_night_shift'
            ).checked
        ) {
            formData.set(
                'is_night_shift',
                '0'
            );
        }


        fetch(url, {

            method: 'POST',

            body: formData,

            headers: {

                'X-CSRF-TOKEN':
                    document.querySelector(
                        'meta[name="csrf-token"]'
                    ).getAttribute('content'),

                'Accept':
                    'application/json',

                'X-Requested-With':
                    'XMLHttpRequest'
            }

        })
        .then(async response => {

            const data =
                await response.json();

            if (!response.ok) {

                throw {
                    status: response.status,
                    data: data
                };
            }

            return data;

        })
        .then(data => {

            if (data.success) {

                closeShiftModal();

                loadShifts();

                Swal.fire({
                    icon: 'success',
                    title: 'Success!',
                    text: data.message,
                    timer: 1800,
                    showConfirmButton: false
                });
            }

        })
        .catch(error => {

            console.error(error);

            /*
            |--------------------------------------------------------------------------
            | Laravel Validation Error
            |--------------------------------------------------------------------------
            */

            if (
                error.status === 422 &&
                error.data &&
                error.data.errors
            ) {

                showValidationErrors(
                    error.data.errors
                );

                // IMPORTANT:
                // Modal remains open
            }

            /*
            |--------------------------------------------------------------------------
            | Other Error
            |--------------------------------------------------------------------------
            */

            else {

                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text:
                        error.data?.message ||
                        'Something went wrong. Please try again.'
                });
            }

        })
        .finally(() => {

            saveBtn.disabled = false;

            saveBtn.innerText = 'Save';

        });

    });


    /*
    |--------------------------------------------------------------------------
    | Show Validation Errors
    |--------------------------------------------------------------------------
    */

    function showValidationErrors(errors) {

        Object.keys(errors).forEach(function (field) {

            const input =
                document.getElementById(field);

            const errorElement =
                document.getElementById(
                    'error-' + field
                );

            if (input) {

                input.classList.add(
                    'is-invalid'
                );
            }

            if (errorElement) {

                errorElement.innerText =
                    errors[field][0];

                errorElement.style.display =
                    'block';
            }

        });
    }


    /*
    |--------------------------------------------------------------------------
    | Clear Validation Errors
    |--------------------------------------------------------------------------
    */

    function clearValidationErrors() {

        document
            .querySelectorAll(
                '#shiftForm .is-invalid'
            )
            .forEach(function (element) {

                element.classList.remove(
                    'is-invalid'
                );

            });


        document
            .querySelectorAll(
                '#shiftForm .invalid-feedback'
            )
            .forEach(function (element) {

                element.innerText = '';

                element.style.display =
                    'none';

            });
    }


    /*
    |--------------------------------------------------------------------------
    | Edit Shift
    |--------------------------------------------------------------------------
    */

    window.editShift = function (id) {

        clearValidationErrors();

        fetch(
            "{{ url('shifts') }}/" + id,
            {
                headers: {
                    'Accept': 'application/json',
                    'X-Requested-With':
                        'XMLHttpRequest'
                }
            }
        )
        .then(response => response.json())
        .then(data => {

            const shift = data.data;

            document.getElementById(
                'shift_id'
            ).value = shift.id;

            document.getElementById(
                'name'
            ).value = shift.name || '';

            document.getElementById(
                'description'
            ).value = shift.description || '';

            document.getElementById(
                'start_time'
            ).value =
                shift.start_time.substring(0, 5);

            document.getElementById(
                'end_time'
            ).value =
                shift.end_time.substring(0, 5);

            document.getElementById(
                'break_duration'
            ).value =
                shift.break_duration;

            document.getElementById(
                'break_start_time'
            ).value =
                shift.break_start_time
                    ? shift.break_start_time.substring(0, 5)
                    : '';

            document.getElementById(
                'break_end_time'
            ).value =
                shift.break_end_time
                    ? shift.break_end_time.substring(0, 5)
                    : '';

            document.getElementById(
                'grace_period'
            ).value =
                shift.grace_period;

            document.getElementById(
                'is_night_shift'
            ).checked =
                Boolean(shift.is_night_shift);

            document.getElementById(
                'status'
            ).value =
                shift.status;

            document.getElementById(
                'modalTitle'
            ).innerText =
                'Edit Shift';

            document
                .getElementById('shiftModal')
                .classList.add('show');

        })
        .catch(error => {

            console.error(error);

            Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Unable to load shift details.'
            });

        });
    };


    /*
    |--------------------------------------------------------------------------
    | View Shift
    |--------------------------------------------------------------------------
    */

    window.viewShift = function (id) {

        fetch(
            "{{ url('shifts') }}/" + id,
            {
                headers: {
                    'Accept': 'application/json'
                }
            }
        )
        .then(response => response.json())
        .then(data => {

            const shift = data.data;

            document.getElementById(
                'viewShiftName'
            ).innerText = shift.name;

            document.getElementById(
                'viewShiftType'
            ).innerText =
                shift.type;

            document.getElementById(
                'viewShiftStatus'
            ).innerText =
                shift.status === 'active'
                    ? 'Active'
                    : 'Inactive';

            document.getElementById(
                'viewShiftHours'
            ).innerText =
                shift.start_time.substring(0, 5) +
                ' - ' +
                shift.end_time.substring(0, 5) +
                ' (' +
                shift.working_hours +
                ' hours)';

            document.getElementById(
                'viewBreakDuration'
            ).innerText =
                shift.break_duration +
                ' minutes';

            document.getElementById(
                'viewGracePeriod'
            ).innerText =
                shift.grace_period +
                ' minutes';

            document.getElementById(
                'viewBreakTime'
            ).innerText =
                shift.break_start_time &&
                shift.break_end_time
                    ? shift.break_start_time.substring(0, 5) +
                      ' - ' +
                      shift.break_end_time.substring(0, 5)
                    : 'Not specified';

            document.getElementById(
                'viewShiftDescription'
            ).innerText =
                shift.description ||
                'No description provided.';

            document
                .getElementById('viewShiftModal')
                .classList.add('show');

        })
        .catch(error => {

            console.error(error);

            Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Unable to load shift details.'
            });

        });
    };


    /*
    |--------------------------------------------------------------------------
    | Delete Shift
    |--------------------------------------------------------------------------
    */

    window.deleteShift = function (id) {

        Swal.fire({

            title: 'Delete Shift?',

            text:
                'This action cannot be undone.',

            icon: 'warning',

            showCancelButton: true,

            confirmButtonColor: '#dc2626',

            cancelButtonColor: '#64748b',

            confirmButtonText:
                'Yes, delete it!'

        }).then((result) => {

            if (!result.isConfirmed) {
                return;
            }

            fetch(
                "{{ url('shifts') }}/" + id,
                {
                    method: 'DELETE',

                    headers: {

                        'X-CSRF-TOKEN':
                            document.querySelector(
                                'meta[name="csrf-token"]'
                            ).getAttribute('content'),

                        'Accept':
                            'application/json',

                        'X-Requested-With':
                            'XMLHttpRequest'
                    }
                }
            )
            .then(response => response.json())
            .then(data => {

                if (data.success) {

                    loadShifts();

                    Swal.fire({
                        icon: 'success',
                        title: 'Deleted!',
                        text: data.message,
                        timer: 1800,
                        showConfirmButton: false
                    });
                }

            })
            .catch(error => {

                console.error(error);

                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'Unable to delete shift.'
                });

            });

        });
    };


    /*
    |--------------------------------------------------------------------------
    | Search
    |--------------------------------------------------------------------------
    */

    let searchTimer;

    document
        .getElementById('searchInput')
        .addEventListener('input', function () {

            clearTimeout(searchTimer);

            searchTimer = setTimeout(
                function () {
                    loadShifts();
                },
                400
            );

        });


    /*
    |--------------------------------------------------------------------------
    | Close modal when clicking outside
    |--------------------------------------------------------------------------
    */

    document
        .getElementById('shiftModal')
        .addEventListener('click', function (e) {

            if (e.target === this) {
                closeShiftModal();
            }

        });


    document
        .getElementById('viewShiftModal')
        .addEventListener('click', function (e) {

            if (e.target === this) {
                closeViewShiftModal();
            }

        });

});

</script>

@endsection