@extends('layouts.master')

@section('content')
<div class="toolbar py-2" id="kt_toolbar">
    <div class="container-fluid d-flex flex-stack flex-wrap">
        <div class="d-flex align-items-center gap-2">
            <ul class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-1">
                <li class="breadcrumb-item text-muted">
                    <a href="{{ route('dashboard') }}" class="text-muted text-hover-primary">Dashboard</a>
                </li>
                <li class="breadcrumb-item">
                    <span class="bullet bg-gray-200 w-5px h-2px"></span>
                </li>
                <li class="breadcrumb-item text-muted">Leave Management</li>
                <li class="breadcrumb-item">
                    <span class="bullet bg-gray-200 w-5px h-2px"></span>
                </li>
                <li class="breadcrumb-item text-dark">Leave Applications</li>
            </ul>
        </div>
    </div>
</div>

<div class="container-fluid py-3">
    @if(session('success'))
        <div class="alert alert-success d-flex align-items-center p-4 mb-4">
            <div class="d-flex flex-column">
                <span>{{ session('success') }}</span>
            </div>
        </div>
    @endif

    @if ($errors->any())
        <div class="alert alert-danger p-4 mb-4">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="d-flex flex-stack flex-wrap mb-6">
        <div class="me-2">
            <h1 class="text-dark fw-bold my-1 fs-3">Leave Applications</h1>
        </div>
        <button type="button" class="btn btn-success btn-sm fw-bold d-flex align-items-center gap-2" id="add_application_btn" data-bs-toggle="modal" data-bs-target="#leave_application_modal">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
            </svg>
            Add Leave Application
        </button>
    </div>

    <!-- Filters and Table Card -->
    <div class="card card-flush">
        <!-- Header Filters -->
        <div class="card-header pt-5 align-items-center flex-wrap gap-3">
            <form method="GET" action="{{ route('leave-applications') }}" class="d-flex flex-wrap align-items-center gap-3 w-100">
                <!-- Search -->
                <div class="position-relative w-md-250px">
                    <span class="position-absolute top-50 translate-middle-y ms-3">
                        <i class="bi bi-search fs-4 text-muted"></i>
                    </span>
                    <input type="text" name="search" class="form-control form-control-solid ps-10 form-control-sm" placeholder="Search..." value="{{ request('search') }}">
                </div>

                <!-- Employee select -->
                <div class="w-md-200px">
                    <select name="employee_id" class="form-select form-select-solid form-select-sm">
                        <option value="">All Employees</option>
                        @foreach($employees as $emp)
                            <option value="{{ $emp->id }}" {{ request('employee_id') == $emp->id ? 'selected' : '' }}>{{ $emp->name }}</option>
                        @endforeach
                    </select>
                </div>

                <!-- Leave Type select -->
                <div class="w-md-200px">
                    <select name="leave_type_id" class="form-select form-select-solid form-select-sm">
                        <option value="">All Leave Types</option>
                        @foreach($leaveTypes as $type)
                            <option value="{{ $type->id }}" {{ request('leave_type_id') == $type->id ? 'selected' : '' }}>{{ $type->name }}</option>
                        @endforeach
                    </select>
                </div>

                <!-- Hidden Tab Filter -->
                <input type="hidden" name="tab" id="tab_filter_val" value="{{ $tab }}">

                <button type="submit" class="btn btn-secondary btn-sm fw-bold">Filters</button>
            </form>

            <!-- Status Tabs -->
            <div class="d-flex gap-5 border-top w-100 pt-4 mt-2">
                @foreach($counts as $statusKey => $count)
                    <a class="pb-3 fw-bold fs-7 {{ $tab === $statusKey ? 'text-success border-bottom border-success border-3' : 'text-muted' }}" 
                       href="javascript:void(0)" 
                       onclick="changeTab('{{ $statusKey }}')">
                        {{ $statusKey }} Leaves <span class="badge badge-light-success ms-1">{{ $count }}</span>
                    </a>
                @endforeach
            </div>
        </div>

        <!-- Table Body -->
        <div class="card-body pt-0">
            <div class="table-responsive">
                <table class="table align-middle table-row-dashed fs-6 gy-5">
                    <thead>
                        <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                            <th class="w-50px">#</th>
                            <th class="min-w-200px">Employee</th>
                            <th class="min-w-150px">Leave Type</th>
                            <th class="min-w-120px">Start Date</th>
                            <th class="min-w-120px">End Date</th>
                            <th class="min-w-80px">Days</th>
                            <th class="min-w-100px">Status</th>
                            <th class="min-w-120px">Applied On</th>
                            <th class="text-end min-w-120px">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="fw-semibold text-gray-600">
                        @forelse($applications as $index => $app)
                            <tr>
                                <td>{{ $applications->firstItem() + $index }}</td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <!-- Employee Avatar -->
                                        <div class="symbol symbol-35px symbol-circle me-3">
                                            @if($app->employee?->profile_image)
                                                <img src="{{ asset('storage/' . $app->employee->profile_image) }}" alt="avatar" />
                                            @else
                                                <div class="symbol-label fs-6 fw-semibold bg-light-danger text-danger">
                                                    {{ strtoupper(substr($app->employee?->name ?? 'E', 0, 1)) }}
                                                </div>
                                            @endif
                                        </div>
                                        <div class="d-flex flex-column">
                                            <span class="text-gray-800 fw-bold fs-6">{{ $app->employee?->name }}</span>
                                            <span class="text-muted fs-7">{{ $app->employee?->email }}</span>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <span class="w-10px h-10px rounded-circle me-2 d-inline-block" style="background-color: {{ $app->leaveType?->color ?? '#CCCCCC' }}"></span>
                                        <span class="text-gray-800">{{ $app->leaveType?->name ?? 'N/A' }}</span>
                                    </div>
                                </td>
                                <td>{{ $app->start_date?->format('Y-m-d') }}</td>
                                <td>{{ $app->end_date?->format('Y-m-d') }}</td>
                                <td>{{ $app->days_count }}</td>
                                <td>
                                    @php
                                        $badgeColor = 'warning';
                                        if($app->status === 'Approved') $badgeColor = 'success';
                                        if($app->status === 'Rejected') $badgeColor = 'danger';
                                    @endphp
                                    <span class="badge badge-light-{{ $badgeColor }} fs-8">{{ $app->status }}</span>
                                </td>
                                <td>{{ $app->applied_on?->format('Y-m-d') }}</td>
                                <td class="text-end">
                                    <div class="d-flex justify-content-end gap-2">
                                        <!-- View reason/attachment details -->
                                        <button type="button" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm view-app-btn" 
                                            data-name="{{ $app->employee?->name }}"
                                            data-leave-type="{{ $app->leaveType?->name ?? 'N/A' }}"
                                            data-start-date="{{ $app->start_date?->format('Y-m-d') }}"
                                            data-end-date="{{ $app->end_date?->format('Y-m-d') }}"
                                            data-total-days="{{ $app->days_count }}"
                                            data-status="{{ $app->status }}"
                                            data-reason="{{ $app->reason }}"
                                            data-attachment="{{ $app->attachment_path ? asset('storage/' . $app->attachment_path) : '' }}"
                                            data-bs-toggle="modal" data-bs-target="#view_application_modal" title="View details">
                                            <i class="bi bi-eye fs-4"></i>
                                        </button>

                                        @if($app->status === 'Pending')
                                            <!-- Approve Button -->
                                            <form action="{{ route('leave-applications-approve', $app) }}" method="POST" class="d-inline" onsubmit="return confirm('Approve this leave application?')">
                                                @csrf
                                                <button type="submit" class="btn btn-icon btn-bg-light btn-active-color-success btn-sm" title="Approve">
                                                    <i class="bi bi-check-circle fs-4"></i>
                                                </button>
                                            </form>

                                            <!-- Reject Button -->
                                            <form action="{{ route('leave-applications-reject', $app) }}" method="POST" class="d-inline" onsubmit="return confirm('Reject this leave application?')">
                                                @csrf
                                                <button type="submit" class="btn btn-icon btn-bg-light btn-active-color-danger btn-sm" title="Reject">
                                                    <i class="bi bi-x-circle fs-4"></i>
                                                </button>
                                            </form>
                                        @endif

                                        @if($app->status !== 'Approved')
                                            <!-- Delete Button -->
                                            <form action="{{ route('leave-applications-delete', $app) }}" method="POST" class="d-inline" onsubmit="return confirm('Delete this leave application?')">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-icon btn-bg-light btn-active-color-danger btn-sm" title="Delete">
                                                    <i class="bi bi-trash fs-4"></i>
                                                </button>
                                            </form>
                                        @endif
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="9" class="text-center text-muted py-10">No leave applications found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            @if($applications->hasPages())
                <div class="mt-4">
                    {{ $applications->links() }}
                </div>
            @endif
        </div>
    </div>
</div>

<!-- Modal Form: Add Leave Application -->
<div class="modal fade" id="leave_application_modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="fw-bold">Add New Leave Application</h2>
                <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                    <i class="bi bi-x fs-1"></i>
                </div>
            </div>
            <form id="leaveApplicationForm" method="POST" action="{{ route('leave-applications-store') }}" enctype="multipart/form-data" novalidate>
                @csrf
                <div class="modal-body py-10 px-lg-17">
                    <!-- Employee -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Employee</label>
                        <select name="employee_id" class="form-select form-select-solid" required>
                            <option value="">Select Employee</option>
                            @foreach($employees as $emp)
                                <option value="{{ $emp->id }}">{{ $emp->name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Leave Type -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Leave Type</label>
                        <select name="leave_type_id" class="form-select form-select-solid" required>
                            <option value="">Select Leave Type</option>
                            @foreach($leaveTypes as $type)
                                <option value="{{ $type->id }}">{{ $type->name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Start Date -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Start Date</label>
                        <input type="date" name="start_date" class="form-control form-control-solid" required>
                    </div>

                    <!-- End Date -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">End Date</label>
                        <input type="date" name="end_date" class="form-control form-control-solid" required>
                    </div>

                    <!-- Reason -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Reason</label>
                        <textarea name="reason" class="form-control form-control-solid" rows="3" placeholder="e.g., Family emergency, Medical appointment..." required></textarea>
                    </div>

                    <!-- Attachment -->
                    <div class="mb-5 fv-row">
                        <label class="fs-6 fw-bold mb-2">Attachment</label>
                        <input type="file" name="attachment" class="form-control form-control-solid">
                    </div>
                </div>

                <div class="modal-footer flex-center">
                    <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success fw-bold">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<style>
    #leave_application_modal .modal-content { border: 0; border-radius: 12px; }
    #leave_application_modal .modal-header { padding: 22px 25px; border-bottom: 1px solid #e5e7eb; }
    #leave_application_modal .modal-body { padding: 20px 25px !important; max-height: 70vh; overflow-y: auto; }
    #leave_application_modal .modal-footer { padding: 15px 25px; border-top: 1px solid #e5e7eb; justify-content: flex-end !important; }
    #leave_application_modal .form-control,
    #leave_application_modal .form-select { min-height: 42px; border: 1px solid #d9dee7; background-color: #fff; }
    #leave_application_modal textarea.form-control { min-height: 80px; }
    #leave_application_modal .leave-field-error { color: #f1414d; font-size: 12px; margin-top: 7px; }
    #leave_application_modal .leave-invalid { border-color: #f1414d !important; box-shadow: none !important; }
    #leave_application_modal .leave-invalid:focus { border-color: #f1414d !important; box-shadow: 0 0 0 2px rgba(241,65,77,.08) !important; }
</style>
<script>
document.addEventListener('DOMContentLoaded', function () {
    var form = document.getElementById('leaveApplicationForm');
    if (!form) return;

    form.noValidate = true;
    form.querySelectorAll('[required]').forEach(function (field) {
        field.removeAttribute('required');
    });

    var rules = {
        employee_id: function (field) { return field.value ? '' : 'Employee is required'; },
        leave_type_id: function (field) { return field.value ? '' : 'Leave Type is required'; },
        start_date: function (field) { return field.value ? '' : 'Start Date is required'; },
        end_date: function (field) {
            if (!field.value) return 'End Date is required';
            var start = form.elements.start_date.value;
            return start && field.value < start ? 'End Date must be after or equal to Start Date' : '';
        },
        reason: function (field) {
            var value = field.value.trim();
            if (!value) return 'Reason is required';
            return value.length < 3 ? 'Reason must be at least 3 characters' : '';
        },
        attachment: function (field) {
            return field.files[0] && field.files[0].size > 5 * 1024 * 1024 ? 'Attachment may not be greater than 5 MB' : '';
        }
    };

    function errorBox(field) {
        var box = field.parentElement.querySelector('.leave-field-error');
        if (!box) {
            box = document.createElement('div');
            box.className = 'leave-field-error';
            field.insertAdjacentElement('afterend', box);
        }
        return box;
    }

    function validateField(field) {
        var message = rules[field.name] ? rules[field.name](field) : '';
        var box = errorBox(field);
        field.classList.toggle('leave-invalid', Boolean(message));
        field.setAttribute('aria-invalid', message ? 'true' : 'false');
        box.textContent = message;
        box.style.display = message ? 'block' : 'none';
        return !message;
    }

    Object.keys(rules).forEach(function (name) {
        var field = form.elements[name];
        if (!field) return;
        field.addEventListener(field.tagName === 'SELECT' || field.type === 'date' || field.type === 'file' ? 'change' : 'input', function () {
            validateField(field);
            if (name === 'start_date' && form.elements.end_date.value) validateField(form.elements.end_date);
        });
        field.addEventListener('blur', function () { validateField(field); });
    });

    form.addEventListener('submit', function (event) {
        var firstInvalid = null;
        Object.keys(rules).forEach(function (name) {
            var field = form.elements[name];
            if (field && !validateField(field) && !firstInvalid) firstInvalid = field;
        });
        if (firstInvalid) {
            event.preventDefault();
            firstInvalid.focus();
            firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
        }
    });

    document.getElementById('leave_application_modal').addEventListener('hidden.bs.modal', function () {
        form.reset();
        form.querySelectorAll('.leave-invalid').forEach(function (field) { field.classList.remove('leave-invalid'); field.removeAttribute('aria-invalid'); });
        form.querySelectorAll('.leave-field-error').forEach(function (box) { box.remove(); });
    });
});
</script>

<!-- Modal: View Application Details -->
<style>
    #view_application_modal .modal-dialog { max-width: 670px; }
    #view_application_modal .modal-content { border: 0; border-radius: 12px; box-shadow: 0 12px 35px rgba(15,23,42,.22); }
    #view_application_modal .modal-header { padding: 24px 26px; border-bottom: 1px solid #e5e7eb; }
    #view_application_modal .leave-detail-head-icon { width: 38px; height: 38px; display: grid; place-items: center; border-radius: 10px; color: #00ad7b; background: #e7fbf4; }
    #view_application_modal .leave-detail-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 22px 48px; padding: 26px; }
    #view_application_modal .leave-detail-label { display: flex; align-items: center; gap: 9px; color: #6f7a90; margin-bottom: 5px; }
    #view_application_modal .leave-detail-label i { width: 16px; }
    #view_application_modal .leave-detail-value { color: #111827; font-weight: 500; word-break: break-word; }
    #view_application_modal .leave-detail-full { grid-column: 1 / -1; }
    @media(max-width:575px) { #view_application_modal .leave-detail-grid { grid-template-columns: 1fr; } #view_application_modal .leave-detail-full { grid-column: auto; } }
</style>
<div class="modal fade" id="view_application_modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <div class="d-flex align-items-center gap-3">
                    <span class="leave-detail-head-icon"><i class="bi bi-calendar3 fs-3"></i></span>
                    <h2 class="fw-bold mb-0">Leave Application Details</h2>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="leave-detail-grid">
                <div><div class="leave-detail-label"><i class="bi bi-person"></i> Employee</div><div id="view_emp_name" class="leave-detail-value">—</div></div>
                <div><div class="leave-detail-label"><i class="bi bi-tag"></i> Leave Type</div><div id="view_leave_type" class="leave-detail-value">—</div></div>
                <div><div class="leave-detail-label"><i class="bi bi-calendar3"></i> Start Date</div><div id="view_start_date" class="leave-detail-value">—</div></div>
                <div><div class="leave-detail-label"><i class="bi bi-calendar3"></i> End Date</div><div id="view_end_date" class="leave-detail-value">—</div></div>
                <div><div class="leave-detail-label"><i class="bi bi-hash"></i> Total Days</div><div id="view_total_days" class="leave-detail-value">—</div></div>
                <div><div class="leave-detail-label"><i class="bi bi-file-earmark-text"></i> Status</div><div><span id="view_status" class="badge">—</span></div></div>
                <div class="leave-detail-full"><div class="leave-detail-label"><i class="bi bi-file-earmark-text"></i> Reason</div><div id="view_reason" class="leave-detail-value">—</div></div>
                <div id="attachment_block" class="leave-detail-full d-none"><div class="leave-detail-label"><i class="bi bi-paperclip"></i> Attachment</div><a href="" id="view_attachment_link" target="_blank" class="btn btn-sm btn-light-primary fw-bold">Download Attachment</a></div>
            </div>
        </div>
    </div>
</div>

<script>
    function changeTab(status) {
        document.getElementById('tab_filter_val').value = status;
        document.getElementById('tab_filter_val').form.submit();
    }

    document.addEventListener('DOMContentLoaded', function () {
        // Details View modal population
        document.querySelectorAll('.view-app-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.getElementById('view_emp_name').innerText = this.getAttribute('data-name');
                document.getElementById('view_leave_type').innerText = this.getAttribute('data-leave-type') || '—';
                document.getElementById('view_start_date').innerText = this.getAttribute('data-start-date') || '—';
                document.getElementById('view_end_date').innerText = this.getAttribute('data-end-date') || '—';
                document.getElementById('view_total_days').innerText = this.getAttribute('data-total-days') || '—';
                document.getElementById('view_reason').innerText = this.getAttribute('data-reason');
                const status = this.getAttribute('data-status') || 'Pending';
                const statusBadge = document.getElementById('view_status');
                statusBadge.innerText = status;
                statusBadge.className = 'badge badge-light-' + (status === 'Approved' ? 'success' : (status === 'Rejected' ? 'danger' : 'warning'));
                
                const attachment = this.getAttribute('data-attachment');
                const attachBlock = document.getElementById('attachment_block');
                const attachLink = document.getElementById('view_attachment_link');
                
                if (attachment) {
                    attachLink.setAttribute('href', attachment);
                    attachBlock.classList.remove('d-none');
                } else {
                    attachLink.setAttribute('href', '#');
                    attachBlock.classList.add('d-none');
                }
            });
        });
    });
</script>
@endsection
