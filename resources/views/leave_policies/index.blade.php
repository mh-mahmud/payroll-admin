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

                <!-- Filter Button -->
                <button type="submit" class="btn btn-secondary btn-sm fw-bold">Filters</button>
            </form>

            <!-- Status Tabs -->
            <div class="d-flex gap-5 border-top w-100 pt-4 mt-2">
                @foreach($counts as $statusKey => $count)
                    <a class="pb-3 fw-bold fs-7 {{ request('status', 'All') === $statusKey ? 'text-success border-bottom border-success border-3' : 'text-muted' }}" 
                       href="javascript:void(0)" 
                       onclick="filterByStatus('{{ $statusKey }}')">
                        {{ $statusKey }} <span class="badge badge-light-success ms-1">{{ $count }}</span>
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
                            <th class="min-w-150px">Policy Name</th>
                            <th class="min-w-125px">Leave Type</th>
                            <th class="min-w-100px">Carry Forward</th>
                            <th class="min-w-100px">Approval</th>
                            <th class="min-w-100px">Status</th>
                            <th class="min-w-125px">Created At</th>
                            <th class="text-end min-w-100px">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="fw-semibold text-gray-600">
                        @forelse($leavePolicies as $index => $policy)
                            <tr>
                                <td>{{ $leavePolicies->firstItem() + $index }}</td>
                                <td>
                                    <div class="d-flex flex-column">
                                        <span class="text-gray-800 fw-bold fs-6">{{ $policy->name }}</span>
                                        @if($policy->description)
                                            <span class="text-muted fs-7">{{ \Illuminate\Support\Str::limit($policy->description, 60) }}</span>
                                        @endif
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
                                    <span class="badge badge-light-success fs-8">{{ $policy->status }}</span>
                                </td>
                                <td>
                                    {{ $policy->created_at?->format('Y-m-d') }}
                                </td>
                                <td class="text-end">
                                    <div class="d-flex justify-content-end gap-2">
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

                                        <!-- Delete -->
                                        <form action="{{ route('leave-policies-delete', $policy) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this leave policy?')">
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
            
            @if($leavePolicies->hasPages())
                <div class="mt-4">
                    {{ $leavePolicies->links() }}
                </div>
            @endif
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
            <form id="leave_policy_form" method="POST" action="{{ route('leave-policies-store') }}">
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
                    <div class="mb-5 fv-row">
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
@endsection
