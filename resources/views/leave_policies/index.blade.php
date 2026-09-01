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
                <li class="breadcrumb-item text-dark">Leave Policies</li>
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
            <h1 class="text-dark fw-bold my-1 fs-3">Leave Policies</h1>
            <div class="text-muted fs-7">Manage leave policies for your organization.</div>
        </div>
        <button type="button" class="btn btn-success btn-sm fw-bold d-flex align-items-center gap-2" id="add_policy_btn" data-bs-toggle="modal" data-bs-target="#leave_policy_modal">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
            </svg>
            Add Leave Policy
        </button>
    </div>

    <!-- Filters and Table Card -->
    <div class="card card-flush">
        <!-- Header Filters -->
        <div class="card-header pt-5 align-items-center flex-wrap gap-3">
            <form method="GET" action="{{ route('leave-policies') }}" class="d-flex flex-wrap align-items-center gap-3 w-100">
                <!-- Search -->
                <div class="position-relative w-md-250px">
                    <span class="position-absolute top-50 translate-middle-y ms-3">
                        <i class="bi bi-search fs-4 text-muted"></i>
                    </span>
                    <input type="text" name="search" class="form-control form-control-solid ps-10 form-control-sm" placeholder="Search..." value="{{ request('search') }}">
                </div>

                <!-- Leave Type -->
                <div class="w-md-200px">
                    <select name="leave_type_id" class="form-select form-select-solid form-select-sm">
                        <option value="">All Leave Types</option>
                        @foreach($leaveTypes as $type)
                            <option value="{{ $type->id }}" {{ request('leave_type_id') == $type->id ? 'selected' : '' }}>{{ $type->name }}</option>
                        @endforeach
                    </select>
                </div>

                <!-- Status Filter hidden, managed by tab click -->
                <input type="hidden" name="status" id="status_filter_val" value="{{ request('status', 'All') }}">

                <!-- Filter Buttons -->
                <button type="submit" class="btn btn-secondary btn-sm fw-bold"><i class="bi bi-funnel me-1"></i>Filters</button>
                @if(request()->hasAny(['search', 'leave_type_id']) || (request('status') && request('status') !== 'All'))
                    <a href="{{ route('leave-policies') }}" class="btn btn-light-danger btn-sm fw-bold">Clear</a>
                @endif
            </form>

            <!-- Status Tabs -->
            <div class="d-flex gap-5 border-top w-100 pt-4 mt-2">
                @foreach($counts as $statusKey => $count)
                    <a class="pb-3 fw-bold fs-7 {{ request('status', 'All') === $statusKey ? 'text-success border-bottom border-success border-3' : 'text-muted' }}" 
                       href="javascript:void(0)" 
                       onclick="filterByStatus('{{ $statusKey }}')">
                        <i class="bi {{ $statusKey === 'All' ? 'bi-grid' : ($statusKey === 'Active' ? 'bi-check-circle' : 'bi-x-circle') }} me-1"></i>{{ $statusKey }} <span class="badge badge-light-success ms-1">{{ $count }}</span>
                    </a>
                @endforeach
            </div>
        </div>

        <!-- Table Body -->
        <div class="card-body pt-0">
            <div class="table-responsive">
                <table class="table align-middle table-row-dashed fs-6 gy-5 w-100">
                    <thead>
                        <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                            <th class="w-50px">#</th>
                            <th class="min-w-200px w-25">Policy Name</th>
                            <th class="min-w-150px w-20">Leave Type</th>
                            <th class="min-w-120px w-15">Carry Forward</th>
                            <th class="min-w-120px w-12">Approval</th>
                            <th class="min-w-100px w-10">Status</th>
                            <th class="min-w-140px w-15">Created At</th>
                            <th class="text-end min-w-120px">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="fw-semibold text-gray-600">
                        @forelse($leavePolicies as $index => $policy)
                            <tr>
                                <td>{{ $leavePolicies->firstItem() + $index }}</td>
                                <td>
                                    <div class="d-flex flex-column">
                                        <span class="text-gray-800 fw-bold fs-6">{{ $policy->name }}</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <span class="w-10px h-10px rounded-circle me-2 d-inline-block" style="background-color: {{ $policy->leaveType?->color ?? '#CCCCCC' }}"></span>
                                        <span class="text-gray-800">{{ $policy->leaveType?->name ?? 'N/A' }}</span>
                                    </div>
                                </td>
                                <td>
                                    {{ $policy->carry_forward_limit }} days
                                </td>
                                <td>
                                    @if($policy->requires_approval)
                                        <span class="badge badge-light-warning fs-8">Required</span>
                                    @else
                                        <span class="badge badge-light-success fs-8">Not Required</span>
                                    @endif
                                </td>
                                <td>
                                    <span class="badge badge-light-{{ $policy->status === 'Active' ? 'success' : 'danger' }} fs-8">{{ $policy->status }}</span>
                                </td>
                                <td>
                                    <span class="d-inline-flex align-items-center gap-2"><i class="bi bi-calendar3 text-muted"></i>{{ $policy->created_at?->format('Y-m-d') }}</span>
                                </td>
                                <td class="text-end">
                                    <div class="d-flex justify-content-end gap-2">
                                        <button type="button" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm view-policy-btn"
                                            data-name="{{ $policy->name }}"
                                            data-description="{{ $policy->description }}"
                                            data-leave-type="{{ $policy->leaveType?->name ?? 'N/A' }}"
                                            data-carry-forward="{{ $policy->carry_forward_limit }}"
                                            data-min-days="{{ $policy->min_days }}"
                                            data-max-days="{{ $policy->max_days }}"
                                            data-approval="{{ $policy->requires_approval ? 'Required' : 'Not Required' }}"
                                            data-status="{{ $policy->status }}"
                                            data-created="{{ $policy->created_at?->format('Y-m-d') }}"
                                            data-bs-toggle="modal" data-bs-target="#view_policy_modal" title="View">
                                            <i class="bi bi-eye fs-4"></i>
                                        </button>
                                        <!-- Edit button -->
                                        <button type="button" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm edit-policy-btn" 
                                            data-id="{{ $policy->id }}"
                                            data-name="{{ $policy->name }}"
                                            data-description="{{ $policy->description }}"
                                            data-leave_type_id="{{ $policy->leave_type_id }}"
                                            data-carry_forward_limit="{{ $policy->carry_forward_limit }}"
                                            data-min_days="{{ $policy->min_days }}"
                                            data-max_days="{{ $policy->max_days }}"
                                            data-requires_approval="{{ $policy->requires_approval ? '1' : '0' }}"
                                            data-status="{{ $policy->status }}"
                                            data-action="{{ route('leave-policies-update', $policy) }}">
                                            <i class="bi bi-pencil fs-4"></i>
                                        </button>

                                        <form action="{{ route('leave-policies-toggle-status', $policy) }}" method="POST" class="d-inline policy-confirm" data-message="{{ $policy->status === 'Active' ? 'Deactivate' : 'Activate' }} this leave policy?">
                                            @csrf
                                            @method('PATCH')
                                            <button type="submit" class="btn btn-icon btn-bg-light btn-active-color-warning btn-sm" title="Change status">
                                                <i class="bi bi-lock fs-4"></i>
                                            </button>
                                        </form>

                                        <!-- Delete -->
                                        <form action="{{ route('leave-policies-delete', $policy) }}" method="POST" class="d-inline policy-confirm" data-message="Delete this leave policy permanently?">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-icon btn-bg-light btn-active-color-danger btn-sm" title="Delete">
                                                <i class="bi bi-trash fs-4"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="8" class="text-center text-muted py-10">No leave policies found.</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
            
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-3 p-5 border-top">
                <span class="text-muted">Showing {{ $leavePolicies->firstItem() ?? 0 }} to {{ $leavePolicies->lastItem() ?? 0 }} of {{ $leavePolicies->total() }} results</span>
                <div>{{ $leavePolicies->links() }}</div>
            </div>
        </div>
    </div>
</div>

<style>
    #leave_policy_modal .modal-dialog { max-width: 520px; }
    #leave_policy_modal .modal-content, #view_policy_modal .modal-content { border: 0; border-radius: 12px; box-shadow: 0 12px 35px rgba(15,23,42,.22); }
    #leave_policy_modal .modal-header, #view_policy_modal .modal-header { padding: 22px 25px; border-bottom: 1px solid #e5e7eb; }
    #leave_policy_modal .modal-body { max-height: 70vh; overflow-y: auto; padding: 20px 25px !important; }
    #leave_policy_modal .modal-footer { justify-content: flex-end !important; padding: 14px 25px; }
    #leave_policy_modal .form-control, #leave_policy_modal .form-select { min-height: 42px; border: 1px solid #d9dee7; background: #fff; }
    #leave_policy_modal .policy-status-field { display: none; }
    #leave_policy_modal .policy-invalid { border-color: #f1414d !important; box-shadow: none !important; }
    #leave_policy_modal .policy-error { color: #f1414d; font-size: 12px; margin-top: 7px; }
    #view_policy_modal .policy-detail-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 22px 45px; padding: 25px; }
    #view_policy_modal .policy-detail-label { color: #6f7a90; margin-bottom: 5px; }
    #view_policy_modal .policy-detail-value { color: #111827; font-weight: 500; }
    #view_policy_modal .policy-detail-full { grid-column: 1/-1; }
    @media(max-width:575px){#view_policy_modal .policy-detail-grid{grid-template-columns:1fr}#view_policy_modal .policy-detail-full{grid-column:auto}}
</style>

<div class="modal fade" id="view_policy_modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <div class="d-flex align-items-center gap-3">
                    <span class="w-40px h-40px rounded d-grid place-items-center bg-light-success text-success">
                        <i class="bi bi-calendar-check fs-3"></i>
                    </span>
                    <h2 class="fw-bold mb-0">Leave Policy Details</h2>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="policy-detail-grid">
                <div>
                    <div class="policy-detail-label">Policy Name</div>
                    <div class="policy-detail-value" data-policy-view="name">—</div>
                </div>
                <div>
                    <div class="policy-detail-label">Leave Type</div>
                    <div class="policy-detail-value" data-policy-view="leave-type">—</div>
                </div>
                <div>
                    <div class="policy-detail-label">Carry Forward</div>
                    <div class="policy-detail-value" data-policy-view="carry-forward">—</div>
                </div>
                <div>
                    <div class="policy-detail-label">Approval</div>
                    <div data-policy-view="approval">—</div>
                </div>
                <div>
                    <div class="policy-detail-label">Min Days Per Application</div>
                    <div class="policy-detail-value" data-policy-view="min-days">—</div>
                </div>
                <div>
                    <div class="policy-detail-label">Max Days Per Application</div>
                    <div class="policy-detail-value" data-policy-view="max-days">—</div>
                </div>
                <div>
                    <div class="policy-detail-label">Status</div>
                    <div data-policy-view="status">—</div>
                </div>
                <div>
                    <div class="policy-detail-label">Created At</div>
                    <div class="policy-detail-value" data-policy-view="created">—</div>
                </div>
                <div class="policy-detail-full">
                    <div class="policy-detail-label">Description</div>
                    <div class="policy-detail-value" data-policy-view="description">—</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal Form -->
<div class="modal fade" id="leave_policy_modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="fw-bold" id="modal_title">Add New Leave Policy</h2>
                <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                    <i class="bi bi-x fs-1"></i>
                </div>
            </div>
            <form id="leave_policy_form" method="POST" action="{{ route('leave-policies-store') }}" novalidate>
                @csrf
                <input type="hidden" name="_method" id="form_method" value="POST">

                <div class="modal-body py-10 px-lg-17">
                    <!-- Policy Name -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Policy Name</label>
                        <input type="text" name="name" id="policy_name_input" class="form-control form-control-solid" placeholder="e.g., Annual Leave Policy" required>
                    </div>

                    <!-- Description -->
                    <div class="mb-5 fv-row">
                        <label class="fs-6 fw-bold mb-2">Description</label>
                        <textarea name="description" id="policy_description_input" class="form-control form-control-solid" rows="3" placeholder="e.g., Standard annual leave policy for all employees..."></textarea>
                    </div>

                    <!-- Leave Type -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Leave Type</label>
                        <select name="leave_type_id" id="policy_leave_type_input" class="form-select form-select-solid" required>
                            <option value="">Select Leave Type</option>
                            @foreach($leaveTypes as $type)
                                <option value="{{ $type->id }}">{{ $type->name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Carry Forward Limit -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Carry Forward Limit (Days)</label>
                        <input type="number" name="carry_forward_limit" id="policy_carry_forward_input" class="form-control form-control-solid" value="0" min="0" required>
                    </div>

                    <!-- Min Days -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Min Days Per Application</label>
                        <input type="number" name="min_days" id="policy_min_days_input" class="form-control form-control-solid" value="1" min="1" required>
                    </div>

                    <!-- Max Days -->
                    <div class="mb-5 fv-row">
                        <label class="required fs-6 fw-bold mb-2">Max Days Per Application</label>
                        <input type="number" name="max_days" id="policy_max_days_input" class="form-control form-control-solid" value="14" min="1" required>
                    </div>

                    <!-- Requires Approval Checkbox -->
                    <div class="mb-5 fv-row d-flex align-items-center">
                        <div class="form-check form-check-custom form-check-solid">
                            <input class="form-check-input" type="checkbox" name="requires_approval" value="1" id="requires_approval_checkbox" checked />
                            <label class="form-check-label fw-bold text-gray-800 ms-3" for="requires_approval_checkbox">
                                Requires Approval
                            </label>
                        </div>
                    </div>

                    <!-- Status -->
                    <div class="mb-5 fv-row policy-status-field">
                        <label class="required fs-6 fw-bold mb-2">Status</label>
                        <select name="status" id="policy_status_input" class="form-select form-select-solid" required>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
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

<script>
    function filterByStatus(status) {
        document.getElementById('status_filter_val').value = status;
        document.getElementById('status_filter_val').form.submit();
    }

    document.addEventListener('DOMContentLoaded', function () {
        const modalElement = document.getElementById('leave_policy_modal');
        const modalForm = document.getElementById('leave_policy_form');
        const modalTitle = document.getElementById('modal_title');
        const methodInput = document.getElementById('form_method');
        
        // Add Policy Button Reset
        document.getElementById('add_policy_btn').addEventListener('click', function() {
            modalTitle.innerText = 'Add New Leave Policy';
            modalForm.setAttribute('action', "{{ route('leave-policies-store') }}");
            methodInput.value = 'POST';
            
            modalForm.reset();
            document.getElementById('requires_approval_checkbox').checked = true;
        });

        // Edit Policy Buttons
        document.querySelectorAll('.edit-policy-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                modalTitle.innerText = 'Edit Leave Policy';
                modalForm.setAttribute('action', this.getAttribute('data-action'));
                methodInput.value = 'PUT';
                
                document.getElementById('policy_name_input').value = this.getAttribute('data-name');
                document.getElementById('policy_description_input').value = this.getAttribute('data-description');
                document.getElementById('policy_leave_type_input').value = this.getAttribute('data-leave_type_id');
                document.getElementById('policy_carry_forward_input').value = this.getAttribute('data-carry_forward_limit');
                document.getElementById('policy_min_days_input').value = this.getAttribute('data-min_days');
                document.getElementById('policy_max_days_input').value = this.getAttribute('data-max_days');
                
                const reqApproval = this.getAttribute('data-requires_approval') === '1';
                document.getElementById('requires_approval_checkbox').checked = reqApproval;
                
                document.getElementById('policy_status_input').value = this.getAttribute('data-status');
                
                // Show modal (Bootstrap 5)
                const modal = bootstrap.Modal.getInstance(modalElement) || new bootstrap.Modal(modalElement);
                modal.show();
            });
        });
    });
</script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    var form = document.getElementById('leave_policy_form');
    if (!form) return;
    form.noValidate = true;
    form.querySelectorAll('[required]').forEach(function (field) { field.removeAttribute('required'); });

    var rules = {
        name: function (field) {
            var value = field.value.trim();
            if (!value) return 'Policy Name is required';
            if (value.length < 2) return 'Policy Name must be at least 2 characters';
            return value.length > 191 ? 'Policy Name may not be greater than 191 characters' : '';
        },
        leave_type_id: function (field) { return field.value ? '' : 'Leave Type is required'; },
        carry_forward_limit: function (field) {
            if (field.value === '') return 'Carry Forward Limit (Days) is required';
            return /^\d+$/.test(field.value) ? '' : 'Carry Forward Limit must be a positive whole number';
        },
        min_days: function (field) {
            if (field.value === '') return 'Min Days Per Application is required';
            return /^\d+$/.test(field.value) && Number(field.value) >= 1 ? '' : 'Min Days must be at least 1';
        },
        max_days: function (field) {
            if (field.value === '') return 'Max Days Per Application is required';
            if (!/^\d+$/.test(field.value) || Number(field.value) < 1) return 'Max Days must be at least 1';
            return Number(field.value) < Number(form.elements.min_days.value || 0) ? 'Max Days must be greater than or equal to Min Days' : '';
        }
    };

    function errorBox(field) {
        var box = field.parentElement.querySelector('.policy-error[data-for="' + field.name + '"]');
        if (!box) { box = document.createElement('div'); box.className = 'policy-error'; box.dataset.for = field.name; field.insertAdjacentElement('afterend', box); }
        return box;
    }
    function validateField(field) {
        var message = rules[field.name] ? rules[field.name](field) : '', box = errorBox(field);
        field.classList.toggle('policy-invalid', Boolean(message));
        field.setAttribute('aria-invalid', message ? 'true' : 'false');
        box.textContent = message; box.style.display = message ? 'block' : 'none';
        return !message;
    }
    function clearPolicyErrors() {
        form.querySelectorAll('.policy-invalid').forEach(function (field) { field.classList.remove('policy-invalid'); field.removeAttribute('aria-invalid'); });
        form.querySelectorAll('.policy-error').forEach(function (box) { box.remove(); });
    }
    Object.keys(rules).forEach(function (name) {
        var field = form.elements[name];
        field.addEventListener(field.tagName === 'SELECT' ? 'change' : 'input', function () { validateField(field); if (name === 'min_days' && form.elements.max_days.value) validateField(form.elements.max_days); });
        field.addEventListener('blur', function () { validateField(field); });
    });
    form.addEventListener('submit', function (event) {
        var firstInvalid = null;
        Object.keys(rules).forEach(function (name) { var field = form.elements[name]; if (!validateField(field) && !firstInvalid) firstInvalid = field; });
        if (firstInvalid) { event.preventDefault(); firstInvalid.focus(); firstInvalid.scrollIntoView({behavior:'smooth',block:'center'}); }
    });
    document.getElementById('add_policy_btn').addEventListener('click', clearPolicyErrors);
    document.querySelectorAll('.edit-policy-btn').forEach(function (button) { button.addEventListener('click', clearPolicyErrors); });

    document.querySelectorAll('.view-policy-btn').forEach(function (button) {
        button.addEventListener('click', function () {
            var modal = document.getElementById('view_policy_modal');
            ['name','description','leave-type','min-days','max-days','created'].forEach(function (key) { modal.querySelector('[data-policy-view="'+key+'"]').textContent = button.dataset[key] || '—'; });
            modal.querySelector('[data-policy-view="carry-forward"]').textContent = (button.dataset.carryForward || '0') + ' days';
            var approval = modal.querySelector('[data-policy-view="approval"]'); approval.innerHTML = '<span class="badge badge-light-'+(button.dataset.approval === 'Required'?'warning':'success')+'"></span>'; approval.firstChild.textContent = button.dataset.approval;
            var status = modal.querySelector('[data-policy-view="status"]'); status.innerHTML = '<span class="badge badge-light-'+(button.dataset.status === 'Active'?'success':'danger')+'"></span>'; status.firstChild.textContent = button.dataset.status;
        });
    });
    document.querySelectorAll('.policy-confirm').forEach(function (confirmForm) {
        confirmForm.addEventListener('submit', function (event) {
            if (confirmForm.dataset.confirmed) return;
            event.preventDefault();
            Swal.fire({title:confirmForm.dataset.message,icon:'warning',showCancelButton:true,confirmButtonColor:'#00b783'}).then(function(result){if(result.isConfirmed){confirmForm.dataset.confirmed='1';confirmForm.submit();}});
        });
    });
});
</script>
@endsection
