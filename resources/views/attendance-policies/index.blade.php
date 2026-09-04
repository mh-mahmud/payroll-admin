@extends('layouts.master')

@section('title', 'Attendance Policies')

@section('content')

<div class="attendance-page">

    {{-- Header --}}
    <div class="page-header">

        <div>
            <h2>Attendance Policies</h2>

            <p>
                Manage attendance rules and policies for your organization.
            </p>
        </div>

        <button
            type="button"
            class="btn-add-policy"
            onclick="openCreateModal()"
        >
            <span>+</span>
            Add Attendance Policy
        </button>

    </div>


    {{-- Statistics --}}
    <div class="statistics-grid">

        {{-- Total --}}
        <div class="stat-card">

            <div class="stat-content">

                <div class="stat-label">
                    Total Policies
                </div>

                <div
                    class="stat-value"
                    id="totalPolicies"
                >
                    {{ $totalPolicies }}
                </div>

                <div class="stat-description">
                    All policies
                </div>

            </div>

            <div class="stat-icon gray">
                🛡
            </div>

        </div>


        {{-- Active --}}
        <div class="stat-card">

            <div class="stat-content">

                <div class="stat-label">
                    Active Policies
                </div>

                <div
                    class="stat-value"
                    id="activePolicies"
                >
                    {{ $activePolicies }}
                </div>

                <div class="stat-description success">
                    Currently active
                </div>

            </div>

            <div class="stat-icon green">
                ✓
            </div>

        </div>


        {{-- Average late grace --}}
        <div class="stat-card">

            <div class="stat-content">

                <div class="stat-label">
                    Avg Late Grace
                </div>

                <div class="stat-value">

                    <span id="avgLateGrace">
                        {{ round($avgLateGrace) }}
                    </span>

                    <small>min</small>

                </div>

                <div class="stat-description warning">
                    Late arrival grace
                </div>

            </div>

            <div class="stat-icon orange">
                ◷
            </div>

        </div>


        {{-- Average overtime --}}
        <div class="stat-card">

            <div class="stat-content">

                <div class="stat-label">
                    Avg Overtime Rate
                </div>

                <div class="stat-value">

                    $<span id="avgOvertimeRate">
                        {{ number_format($avgOvertimeRate, 2) }}
                    </span>

                </div>

                <div class="stat-description success">
                    Per hour
                </div>

            </div>

            <div class="stat-icon green">
                $
            </div>

        </div>

    </div>


    {{-- Search/filter --}}
    <div class="filter-box">

        <div class="search-row">

            <div class="search-wrapper">

                <span class="search-icon">
                    ⌕
                </span>

                <input
                    type="text"
                    id="search"
                    class="search-input"
                    placeholder="Search..."
                    value="{{ request('search') }}"
                >

            </div>

        </div>


        <div class="tabs">

            <button
                type="button"
                class="filter-tab active"
                data-status="all"
            >
                ▦ All
                <span id="allCount">
                    {{ $totalPolicies }}
                </span>
            </button>


            <button
                type="button"
                class="filter-tab"
                data-status="active"
            >
                ◉ Active
                <span id="activeCount">
                    {{ $activePolicies }}
                </span>
            </button>


            <button
                type="button"
                class="filter-tab"
                data-status="inactive"
            >
                ⊗ Inactive
                <span id="inactiveCount">
                    {{ $totalPolicies - $activePolicies }}
                </span>
            </button>

        </div>

    </div>


    {{-- Policies --}}
    <div id="policyList">

        @include(
            'attendance-policies.partials.policy-list',
            ['policies' => $policies]
        )

    </div>

</div>


{{-- ========================================================= --}}
{{-- CREATE / EDIT MODAL --}}
{{-- ========================================================= --}}

<div
    class="modal-overlay"
    id="policyModal"
>

    <div class="policy-modal">

        <div class="modal-header">

            <div>

                <h3 id="modalTitle">
                    Add New Attendance Policy
                </h3>

            </div>

            <button
                type="button"
                class="modal-close"
                onclick="closePolicyModal()"
            >
                ×
            </button>

        </div>


        <form id="policyForm" method="POST" action="{{ route('attendance-policies.store') }}">

            @csrf

            <input
                type="hidden"
                id="policyId"
                name="policy_id"
            >

            <div class="form-group">

                <label>
                    Policy Name <span>*</span>
                </label>

                <input
                    type="text"
                    name="name"
                    id="policyName"
                    placeholder="e.g. Standard Attendance Policy"
                >

                <div class="field-error" id="error-name"></div>

            </div>


            <div class="form-group">

                <label>
                    Description
                </label>

                <textarea
                    name="description"
                    id="policyDescription"
                    rows="4"
                    placeholder="e.g. Default attendance policy for all employees..."
                ></textarea>

                <div class="field-error" id="error-description"></div>

            </div>


            <div class="form-group">

                <label>
                    Late Arrival Grace (minutes)
                    <span>*</span>
                </label>

                <input
                    type="number"
                    name="late_arrival_grace"
                    id="lateArrivalGrace"
                    min="0"
                    value="15"
                >

                <div
                    class="field-error"
                    id="error-late_arrival_grace"
                ></div>

            </div>


            <div class="form-group">

                <label>
                    Early Departure Grace (minutes)
                    <span>*</span>
                </label>

                <input
                    type="number"
                    name="early_departure_grace"
                    id="earlyDepartureGrace"
                    min="0"
                    value="15"
                >

                <div
                    class="field-error"
                    id="error-early_departure_grace"
                ></div>

            </div>


            <div class="form-group">

                <label>
                    Overtime Rate Per Hour
                    <span>*</span>
                </label>

                <input
                    type="number"
                    name="overtime_rate"
                    id="overtimeRate"
                    min="0"
                    step="0.01"
                    value="150"
                >

                <div
                    class="field-error"
                    id="error-overtime_rate"
                ></div>

            </div>


            <div class="form-group">

                <label>
                    Status <span>*</span>
                </label>

                <select
                    name="status"
                    id="policyStatus"
                >
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>

                <div class="field-error" id="error-status"></div>

            </div>


            <div class="modal-footer">

                <button
                    type="button"
                    class="btn-cancel"
                    onclick="closePolicyModal()"
                >
                    Cancel
                </button>

                <button
                    type="submit"
                    class="btn-save"
                    id="saveButton"
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
    id="viewPolicyModal"
>

    <div class="policy-modal view-modal">

        <div class="modal-header">

            <h3>Attendance Policy</h3>

            <button
                type="button"
                class="modal-close"
                onclick="closeViewModal()"
            >
                ×
            </button>

        </div>


        <div class="view-policy-content">

            <div class="view-row">
                <span>Policy Name</span>
                <strong id="viewName"></strong>
            </div>

            <div class="view-row">
                <span>Description</span>
                <strong id="viewDescription"></strong>
            </div>

            <div class="view-row">
                <span>Late Arrival Grace</span>
                <strong>
                    <span id="viewLateGrace"></span> minutes
                </strong>
            </div>

            <div class="view-row">
                <span>Early Departure Grace</span>
                <strong>
                    <span id="viewEarlyGrace"></span> minutes
                </strong>
            </div>

            <div class="view-row">
                <span>Overtime Rate</span>
                <strong>
                    $<span id="viewOvertimeRate"></span>/hour
                </strong>
            </div>

            <div class="view-row">
                <span>Status</span>
                <strong id="viewStatus"></strong>
            </div>

        </div>

    </div>

</div>


{{-- CSS --}}
<style>

.attendance-page {
    padding: 20px;
    background: #f7f9fc;
    min-height: calc(100vh - 70px);
}

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 20px;
}

.page-header h2 {
    margin: 0;
    font-size: 22px;
    font-weight: 700;
    color: #101828;
}

.page-header p {
    margin: 4px 0 0;
    color: #667085;
    font-size: 13px;
}

.btn-add-policy {
    border: 0;
    background: #0bbf83;
    color: white;
    border-radius: 9px;
    padding: 10px 17px;
    font-weight: 600;
    cursor: pointer;
}

.btn-add-policy span {
    font-size: 20px;
    margin-right: 6px;
    vertical-align: middle;
}


/* Statistics */

.statistics-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    margin-bottom: 16px;
}

.stat-card {
    background: white;
    border: 1px solid #e4e7ec;
    border-radius: 12px;
    min-height: 120px;
    padding: 18px 20px;
    display: flex;
    justify-content: space-between;
    position: relative;
    overflow: hidden;
}

.stat-content {
    position: relative;
    z-index: 2;
}

.stat-label {
    font-size: 14px;
    color: #475467;
}

.stat-value {
    font-size: 23px;
    font-weight: 700;
    margin-top: 8px;
    color: #101828;
}

.stat-value small {
    font-size: 13px;
    font-weight: 400;
}

.stat-description {
    font-size: 12px;
    margin-top: 7px;
    color: #667085;
}

.stat-description.success {
    color: #00a86b;
}

.stat-description.warning {
    color: #ff4d00;
}

.stat-icon {
    width: 42px;
    height: 42px;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 22px;
}

.stat-icon.gray {
    background: #f2f4f7;
    color: #475467;
}

.stat-icon.green {
    background: #dcfae9;
    color: #00a86b;
}

.stat-icon.orange {
    background: #fff0dc;
    color: #ff7900;
}


/* Filter */

.filter-box {
    background: white;
    border: 1px solid #e4e7ec;
    border-radius: 12px;
    margin-bottom: 16px;
}

.search-row {
    padding: 13px;
    border-bottom: 1px solid #eaecf0;
}

.search-wrapper {
    width: 255px;
    position: relative;
}

.search-icon {
    position: absolute;
    left: 12px;
    top: 8px;
    color: #667085;
}

.search-input {
    width: 100%;
    height: 34px;
    border: 1px solid #d0d5dd;
    border-radius: 8px;
    padding: 0 12px 0 35px;
    outline: none;
}

.search-input:focus {
    border-color: #0bbf83;
}

.tabs {
    display: flex;
    padding-left: 13px;
}

.filter-tab {
    border: 0;
    background: transparent;
    padding: 12px 15px;
    color: #475467;
    cursor: pointer;
    border-bottom: 2px solid transparent;
}

.filter-tab.active {
    color: #00a86b;
    border-bottom-color: #00a86b;
}

.filter-tab span {
    background: #f2f4f7;
    border-radius: 10px;
    padding: 2px 7px;
    font-size: 11px;
    margin-left: 3px;
}


/* Cards */

.policy-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 24px;
}

.policy-card {
    background: white;
    border: 1px solid #e4e7ec;
    border-radius: 12px;
    padding: 22px;
}

.policy-card-header {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
}

.policy-title-area {
    display: flex;
    align-items: center;
    gap: 12px;
}

.policy-icon {
    width: 42px;
    height: 42px;
    background: #e7f0ff;
    color: #1264ff;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.policy-name {
    font-size: 17px;
    font-weight: 700;
    color: #101828;
}

.status-badge {
    display: inline-block;
    margin-top: 7px;
    padding: 3px 9px;
    border-radius: 15px;
    font-size: 11px;
    font-weight: 600;
}

.status-active {
    color: #039855;
    background: #ecfdf3;
    border: 1px solid #abefc6;
}

.status-inactive {
    color: #d92d20;
    background: #fef3f2;
    border: 1px solid #fecdca;
}

.policy-actions {
    display: flex;
    gap: 10px;
}

.policy-actions button {
    border: 0;
    background: transparent;
    color: #667085;
    cursor: pointer;
    font-size: 16px;
}

.policy-actions button:hover {
    color: #101828;
}

.policy-details {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 18px;
    margin-top: 25px;
}

.detail-item {
    display: flex;
    gap: 10px;
}

.detail-icon {
    color: #ff6500;
    font-size: 18px;
}

.detail-icon.green {
    color: #00b76a;
}

.detail-value {
    font-size: 14px;
    font-weight: 600;
    color: #101828;
}

.detail-label {
    color: #667085;
    font-size: 12px;
    margin-top: 3px;
}

.policy-description {
    border-top: 1px solid #eaecf0;
    margin-top: 18px;
    padding-top: 17px;
    color: #475467;
    font-size: 13px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}


/* Pagination */

.pagination-wrapper {
    background: white;
    border: 1px solid #e4e7ec;
    border-radius: 12px;
    margin-top: 24px;
    padding: 14px 17px;
}

.pagination {
    margin: 0;
}


/* Modal */

.modal-overlay {
    position: fixed;
    inset: 0;
    background: rgba(16, 24, 40, 0.45);
    display: none;
    align-items: center;
    justify-content: center;
    z-index: 9999;
}

.modal-overlay.show {
    display: flex;
}

.policy-modal {
    background: white;
    width: 510px;
    max-width: calc(100% - 30px);
    border-radius: 12px;
    box-shadow: 0 20px 40px rgba(16, 24, 40, .18);
    max-height: 90vh;
    overflow-y: auto;
}

.modal-header {
    padding: 20px 24px;
    border-bottom: 1px solid #eaecf0;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.modal-header h3 {
    margin: 0;
    font-size: 19px;
    color: #101828;
}

.modal-close {
    border: 0;
    background: transparent;
    font-size: 25px;
    color: #667085;
    cursor: pointer;
}

#policyForm {
    padding: 20px 24px 0;
}

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    font-size: 14px;
    font-weight: 500;
    color: #101828;
}

.form-group label span {
    color: #f04438;
}

.form-group input,
.form-group textarea,
.form-group select {
    width: 100%;
    box-sizing: border-box;
    border: 1px solid #d0d5dd;
    border-radius: 8px;
    padding: 10px 12px;
    font-size: 14px;
    outline: none;
    background: white;
}

.form-group textarea {
    resize: vertical;
}

.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus {
    border-color: #0bbf83;
    box-shadow: 0 0 0 3px rgba(11, 191, 131, .08);
}

.field-error {
    color: #d92d20;
    font-size: 12px;
    margin-top: 5px;
}

.modal-footer {
    border-top: 1px solid #eaecf0;
    margin-top: 25px;
    padding: 17px 0;
    display: flex;
    justify-content: flex-end;
    gap: 8px;
}

.btn-cancel,
.btn-save {
    border-radius: 8px;
    padding: 9px 18px;
    font-weight: 600;
    cursor: pointer;
}

.btn-cancel {
    background: white;
    border: 1px solid #d0d5dd;
    color: #344054;
}

.btn-save {
    border: 0;
    background: #0bbf83;
    color: white;
}

.btn-save:disabled {
    opacity: .6;
    cursor: not-allowed;
}


/* View */

.view-policy-content {
    padding: 20px 24px;
}

.view-row {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    padding: 13px 0;
    border-bottom: 1px solid #eaecf0;
}

.view-row span:first-child {
    color: #667085;
}

.view-row strong {
    color: #101828;
    text-align: right;
}


/* Responsive */

@media (max-width: 1100px) {

    .statistics-grid {
        grid-template-columns: repeat(2, 1fr);
    }

    .policy-grid {
        grid-template-columns: repeat(2, 1fr);
    }

}

@media (max-width: 700px) {

    .statistics-grid,
    .policy-grid {
        grid-template-columns: 1fr;
    }

    .page-header {
        flex-direction: column;
        gap: 15px;
    }

    .search-wrapper {
        width: 100%;
    }

}

</style>


{{-- JavaScript --}}
<script>

let editingPolicyId = null;

let currentStatus = 'all';

const csrfToken =
    document.querySelector('meta[name="csrf-token"]').getAttribute('content');


/*
|--------------------------------------------------------------------------
| Open Create Modal
|--------------------------------------------------------------------------
*/

function openCreateModal()
{
    editingPolicyId = null;

    document.getElementById('modalTitle').innerText =
        'Add New Attendance Policy';

    document.getElementById('policyForm').reset();

    document.getElementById('policyId').value = '';

    document.getElementById('lateArrivalGrace').value = 15;

    document.getElementById('earlyDepartureGrace').value = 15;

    document.getElementById('overtimeRate').value = 150;

    document.getElementById('policyStatus').value = 'active';

    clearErrors();

    document.getElementById('policyModal')
        .classList.add('show');
}


/*
|--------------------------------------------------------------------------
| Close Modal
|--------------------------------------------------------------------------
*/

function closePolicyModal()
{
    document.getElementById('policyModal')
        .classList.remove('show');
}


/*
|--------------------------------------------------------------------------
| Edit Policy
|--------------------------------------------------------------------------
*/

async function editPolicy(id)
{
    try {

        const response = await fetch(
            `/attendance-policies/${id}`
        );

        const result = await response.json();

        if (!result.success) {
            alert('Unable to load policy.');
            return;
        }

        const policy = result.data;

        editingPolicyId = id;

        document.getElementById('modalTitle').innerText =
            'Edit Attendance Policy';

        document.getElementById('policyId').value =
            policy.id;

        document.getElementById('policyName').value =
            policy.name;

        document.getElementById('policyDescription').value =
            policy.description ?? '';

        document.getElementById('lateArrivalGrace').value =
            policy.late_arrival_grace;

        document.getElementById('earlyDepartureGrace').value =
            policy.early_departure_grace;

        document.getElementById('overtimeRate').value =
            policy.overtime_rate;

        document.getElementById('policyStatus').value =
            policy.status;

        clearErrors();

        document.getElementById('policyModal')
            .classList.add('show');

    } catch (error) {

        console.error(error);

        alert('Something went wrong.');

    }
}


/*
|--------------------------------------------------------------------------
| Submit Form
|--------------------------------------------------------------------------
*/

document.addEventListener('DOMContentLoaded', function () {

    const form = document.getElementById('policyForm');

    if (!form) {
        console.error('Attendance policy form not found.');
        return;
    }

    form.addEventListener('submit', async function (event) {

        event.preventDefault();

        console.log('Attendance policy form submitted');

        clearErrors();

        const saveButton =
            document.getElementById('saveButton');

        saveButton.disabled = true;
        saveButton.innerText = 'Saving...';


        /*
        |--------------------------------------------------------------------------
        | CSRF Token
        |--------------------------------------------------------------------------
        */

        const csrfElement =
            document.querySelector('meta[name="csrf-token"]');

        if (!csrfElement) {

            console.error(
                'CSRF meta tag not found.'
            );

            alert(
                'CSRF token not found. Please add csrf-token meta tag to your layout.'
            );

            saveButton.disabled = false;
            saveButton.innerText = 'Save';

            return;
        }


        const csrfToken =
            csrfElement.getAttribute('content');


        /*
        |--------------------------------------------------------------------------
        | Form Data
        |--------------------------------------------------------------------------
        */

        const formData =
            new FormData(form);


        /*
        |--------------------------------------------------------------------------
        | Determine Create / Update
        |--------------------------------------------------------------------------
        */

        const policyId =
            document.getElementById('policyId').value;


        let url =
            "{{ route('attendance-policies.store') }}";


        if (policyId) {

            url =
                "{{ url('attendance-policies') }}/" + policyId;

            formData.append('_method', 'PUT');
        }


        console.log('URL:', url);

        console.log(
            'Form Data:',
            Object.fromEntries(formData.entries())
        );


        /*
        |--------------------------------------------------------------------------
        | Send Request
        |--------------------------------------------------------------------------
        */

        try {

            const response = await fetch(url, {

                method: 'POST',

                headers: {

                    'X-CSRF-TOKEN': csrfToken,

                    'X-Requested-With': 'XMLHttpRequest',

                    'Accept': 'application/json'

                },

                body: formData

            });


            /*
            |--------------------------------------------------------------------------
            | Read Response
            |--------------------------------------------------------------------------
            */

            const contentType =
                response.headers.get('content-type');


            let result;


            if (
                contentType &&
                contentType.includes('application/json')
            ) {

                result = await response.json();

            } else {

                const text =
                    await response.text();

                console.error(
                    'Non JSON response:',
                    text
                );

                throw new Error(
                    `Server returned ${response.status} instead of JSON.`
                );
            }


            console.log(
                'Server response:',
                result
            );


            /*
            |--------------------------------------------------------------------------
            | Validation Errors
            |--------------------------------------------------------------------------
            */

            if (response.status === 422) {

                showErrors(result.errors);

                return;
            }


            /*
            |--------------------------------------------------------------------------
            | CSRF / Session Error
            |--------------------------------------------------------------------------
            */

            if (response.status === 419) {

                alert(
                    'Your session has expired. Please refresh the page and try again.'
                );

                return;
            }


            /*
            |--------------------------------------------------------------------------
            | Other Server Errors
            |--------------------------------------------------------------------------
            */

            if (!response.ok) {

                console.error(
                    'Server error:',
                    result
                );

                alert(
                    result.message ||
                    'Unable to save attendance policy.'
                );

                return;
            }


            /*
            |--------------------------------------------------------------------------
            | Success
            |--------------------------------------------------------------------------
            */

            if (result.success) {

                closePolicyModal();

                await loadPolicies();

                // alert(
                //     result.message ||
                //     'Attendance policy saved successfully.'
                // );


                // Show SweetAlert success message
                Swal.fire({
                    icon: 'success',
                    title: 'Success!',
                    text: result.message,
                    confirmButtonText: 'OK'
                });

            } else {

                /*alert(
                    result.message ||
                    'Unable to save attendance policy.'
                );*/

                // Server/system error
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: result.message || 'Unable to save attendance policy.',
                    confirmButtonText: 'OK'
                });

            }


        } catch (error) {

            console.error(
                'Attendance policy error:',
                error
            );

            /*alert(
                error.message ||
                'Something went wrong while saving the policy.'
            );*/

            // Server/system error
            Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: error.message || 'Something went wrong. Please try again.',
                confirmButtonText: 'OK'
            });


        } finally {

            saveButton.disabled = false;

            saveButton.innerText = 'Save';

        }

    });

});


/*
|--------------------------------------------------------------------------
| Show Validation Errors
|--------------------------------------------------------------------------
*/

function showErrors(errors)
{
    Object.keys(errors).forEach(function (field) {

        const element =
            document.getElementById(
                `error-${field}`
            );

        if (element) {

            element.innerText =
                errors[field][0];

        }

    });
}


/*
|--------------------------------------------------------------------------
| Clear Errors
|--------------------------------------------------------------------------
*/

function clearErrors()
{
    document
        .querySelectorAll('.field-error')
        .forEach(function (element) {

            element.innerText = '';

        });
}


/*
|--------------------------------------------------------------------------
| View Policy
|--------------------------------------------------------------------------
*/

async function viewPolicy(id)
{
    try {

        const response = await fetch(
            `/attendance-policies/${id}`
        );

        const result = await response.json();

        if (!result.success) {
            alert('Unable to load policy.');
            return;
        }

        const policy = result.data;

        document.getElementById('viewName').innerText =
            policy.name;

        document.getElementById('viewDescription').innerText =
            policy.description || '-';

        document.getElementById('viewLateGrace').innerText =
            policy.late_arrival_grace;

        document.getElementById('viewEarlyGrace').innerText =
            policy.early_departure_grace;

        document.getElementById('viewOvertimeRate').innerText =
            Number(policy.overtime_rate).toFixed(2);

        document.getElementById('viewStatus').innerText =
            policy.status === 'active'
                ? 'Active'
                : 'Inactive';

        document.getElementById('viewPolicyModal')
            .classList.add('show');

    } catch (error) {

        console.error(error);

        alert('Something went wrong.');

    }
}


/*
|--------------------------------------------------------------------------
| Close View Modal
|--------------------------------------------------------------------------
*/

function closeViewModal()
{
    document.getElementById('viewPolicyModal')
        .classList.remove('show');
}


/*
|--------------------------------------------------------------------------
| Delete Policy
|--------------------------------------------------------------------------
*/

async function deletePolicy(id)
{
    if (!confirm(
        'Are you sure you want to delete this attendance policy?'
    )) {
        return;
    }

    try {

        const response = await fetch(
            `/attendance-policies/${id}`,
            {
                method: 'DELETE',

                headers: {
                    'X-CSRF-TOKEN': csrfToken,
                    'Accept': 'application/json',
                }
            }
        );

        const result =
            await response.json();

        if (!response.ok) {

            alert(
                result.message ||
                'Unable to delete policy.'
            );

            return;
        }

        alert(result.message);

        await loadPolicies();

    } catch (error) {

        console.error(error);

        alert('Something went wrong.');

    }
}


/*
|--------------------------------------------------------------------------
| Load Policies
|--------------------------------------------------------------------------
*/

async function loadPolicies()
{
    const search =
        document.getElementById('search').value;

    const params =
        new URLSearchParams();

    if (search) {
        params.append('search', search);
    }

    if (currentStatus !== 'all') {
        params.append('status', currentStatus);
    }

    const response = await fetch(
        `/attendance-policies?${params.toString()}`,
        {
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Accept': 'application/json'
            }
        }
    );

    const result =
        await response.json();

    document.getElementById('policyList').innerHTML =
        result.html;

    updateStats(result.stats);
}


/*
|--------------------------------------------------------------------------
| Update Statistics
|--------------------------------------------------------------------------
*/

function updateStats(stats)
{
    document.getElementById('totalPolicies')
        .innerText = stats.total;

    document.getElementById('activePolicies')
        .innerText = stats.active;

    document.getElementById('avgLateGrace')
        .innerText = stats.avg_late_grace;

    document.getElementById('avgOvertimeRate')
        .innerText = stats.avg_overtime_rate;

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
| Search
|--------------------------------------------------------------------------
*/

let searchTimer;

document.getElementById('search')
    .addEventListener('keyup', function () {

        clearTimeout(searchTimer);

        searchTimer = setTimeout(function () {

            loadPolicies();

        }, 400);

    });


/*
|--------------------------------------------------------------------------
| Status tabs
|--------------------------------------------------------------------------
*/

document
    .querySelectorAll('.filter-tab')
    .forEach(function (button) {

        button.addEventListener(
            'click',
            function () {

                document
                    .querySelectorAll('.filter-tab')
                    .forEach(function (tab) {

                        tab.classList.remove('active');

                    });

                this.classList.add('active');

                currentStatus =
                    this.dataset.status;

                loadPolicies();

            }
        );

    });


/*
|--------------------------------------------------------------------------
| Close modal when clicking outside
|--------------------------------------------------------------------------
*/

document
    .getElementById('policyModal')
    .addEventListener('click', function (event) {

        if (event.target === this) {
            closePolicyModal();
        }

    });


document
    .getElementById('viewPolicyModal')
    .addEventListener('click', function (event) {

        if (event.target === this) {
            closeViewModal();
        }

    });

</script>

@endsection