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
                <li class="breadcrumb-item text-dark">Leave Types</li>
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

    <div class="mb-4">
        <h1 class="text-dark fw-bold my-1 fs-3">Leave Types</h1>
        <div class="text-muted fs-7">Manage leave types and their configurations.</div>
    </div>

    <div class="row g-6">
        <!-- Left Side: Add/Edit Form -->
        <div class="col-lg-4">
            <div class="card card-flush">
                <div class="card-header pt-5">
                    <div class="card-title flex-column">
                        <h3 class="fw-bold text-dark fs-4">{{ $editingLeaveType ? 'Edit Leave Type' : 'Add New Leave Type' }}</h3>
                        <span class="text-muted fs-7">{{ $editingLeaveType ? 'Update the details of the leave type' : 'Fill in the details to create a new leave type' }}</span>
                    </div>
                </div>
                <div class="card-body pt-0">
                    <form id="leaveTypeForm" method="POST" action="{{ $editingLeaveType ? route('leave-types-update', $editingLeaveType) : route('leave-types-store') }}" novalidate>
                        @csrf
                        @if($editingLeaveType)
                            @method('PUT')
                        @endif

                        <!-- Leave Type Name -->
                        <div class="mb-5">
                            <label class="form-label required fw-bold fs-7">Leave Type Name</label>
                            <input type="text" name="name" class="form-control form-control-solid" placeholder="e.g., Casual Leave, Sick Leave" value="{{ old('name', $editingLeaveType?->name) }}" required>
                            @error('name') <span class="text-danger fs-8">{{ $message }}</span> @enderror
                        </div>

                        <!-- Description -->
                        <div class="mb-5">
                            <label class="form-label fw-bold fs-7">Description</label>
                            <textarea name="description" class="form-control form-control-solid" rows="3" placeholder="Brief description of the leave policies">{{ old('description', $editingLeaveType?->description) }}</textarea>
                            @error('description') <span class="text-danger fs-8">{{ $message }}</span> @enderror
                        </div>

                        <!-- Max Days / Year & Color Pick -->
                        <div class="row g-5 mb-5">
                            <div class="col-6">
                                <label class="form-label required fw-bold fs-7">Max Days / Year</label>
                                <input type="number" name="max_days" class="form-control form-control-solid" value="{{ old('max_days', $editingLeaveType?->max_days ?? 0) }}" min="0" required>
                                @error('max_days') <span class="text-danger fs-8">{{ $message }}</span> @enderror
                            </div>
                            <div class="col-6">
                                <label class="form-label required fw-bold fs-7">Color</label>
                                <div class="d-flex align-items-center gap-2">
                                    <input type="color" id="color_picker" class="form-control form-control-color w-40px h-40px p-0 border-0" value="{{ old('color', $editingLeaveType?->color ?? '#3BB2F6') }}" onchange="document.getElementById('color_text').value = this.value">
                                    <input type="text" name="color" id="color_text" class="form-control form-control-solid uppercase-input" value="{{ old('color', $editingLeaveType?->color ?? '#3BB2F6') }}" maxlength="7" placeholder="#3BB2F6" oninput="document.getElementById('color_picker').value = this.value" required>
                                </div>
                                @error('color') <span class="text-danger fs-8">{{ $message }}</span> @enderror
                            </div>
                        </div>

                        <!-- Paid Leave Switch -->
                        <div class="mb-5 border rounded p-4 d-flex flex-stack bg-light bg-opacity-50">
                            <div class="d-flex flex-column">
                                <span class="fw-bold fs-6 text-gray-800">Paid Leave</span>
                                <span class="text-muted fs-8">Employees will receive salary for these days</span>
                            </div>
                            <div class="form-check form-switch form-check-custom form-check-solid">
                                <input class="form-check-input h-25px w-45px" type="checkbox" name="is_paid" value="1" id="is_paid_switch" {{ old('is_paid', $editingLeaveType ? $editingLeaveType->is_paid : true) ? 'checked' : '' }}>
                            </div>
                        </div>

                        <!-- Status -->
                        <div class="mb-6">
                            <label class="form-label required fw-bold fs-7">Status</label>
                            <select name="status" class="form-select form-select-solid" required>
                                <option value="Active" {{ old('status', $editingLeaveType?->status) === 'Active' ? 'selected' : '' }}>Active</option>
                                <option value="Inactive" {{ old('status', $editingLeaveType?->status) === 'Inactive' ? 'selected' : '' }}>Inactive</option>
                            </select>
                            @error('status') <span class="text-danger fs-8">{{ $message }}</span> @enderror
                        </div>

                        <!-- Submit Button -->
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success fw-bold">{{ $editingLeaveType ? 'Update Leave Type' : 'Add Leave Type' }}</button>
                            @if($editingLeaveType)
                                <a href="{{ route('leave-types') }}" class="btn btn-light fw-bold">Cancel</a>
                            @endif
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Right Side: List & Filters -->
        <div class="col-lg-8">
            <div class="card card-flush">
                <!-- Header Filters -->
                <div class="card-header pt-5 align-items-center">
                    <form method="GET" action="{{ route('leave-types') }}" class="w-100 row g-3">
                        <div class="col-md-7">
                            <div class="position-relative">
                                <span class="position-absolute top-50 translate-middle-y ms-3">
                                    <i class="bi bi-search fs-4 text-muted"></i>
                                </span>
                                <input type="text" name="search" class="form-control form-control-solid ps-10" placeholder="Search leave types..." value="{{ request('search') }}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <select name="status" class="form-select form-select-solid">
                                <option value="All" {{ request('status') === 'All' ? 'selected' : '' }}>All Statuses</option>
                                <option value="Active" {{ request('status') === 'Active' ? 'selected' : '' }}>Active</option>
                                <option value="Inactive" {{ request('status') === 'Inactive' ? 'selected' : '' }}>Inactive</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-success w-100">Search</button>
                        </div>
                    </form>
                </div>

                <!-- Table/List -->
                <div class="card-body pt-0">
                    <div class="table-responsive">
                        <table class="table align-middle table-row-dashed fs-6 gy-5">
                            <thead>
                                <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                                    <th class="min-w-150px">Leave Type</th>
                                    <th class="min-w-90px">Days/Year</th>
                                    <th class="min-w-90px">Payment Type</th>
                                    <th class="min-w-90px">Status</th>
                                    <th class="text-end min-w-100px">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="fw-semibold text-gray-600">
                                @forelse($leaveTypes as $type)
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <!-- Custom styled icon with chosen color -->
                                                <div class="w-40px h-40px rounded d-flex align-items-center justify-content-center me-3 text-white" style="background-color: {{ $type->color }}">
                                                    <!-- Calendar/Leave Icon -->
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                                        <line x1="16" y1="2" x2="16" y2="6"></line>
                                                        <line x1="8" y1="2" x2="8" y2="6"></line>
                                                        <line x1="3" y1="10" x2="21" y2="10"></line>
                                                    </svg>
                                                </div>
                                                <div class="d-flex flex-column">
                                                    <a href="{{ route('leave-types-edit', $type) }}" class="text-gray-800 text-hover-primary fs-6 fw-bold mb-1">{{ $type->name }}</a>
                                                    @if($type->description)
                                                        <div class="text-muted fs-7 text-truncate-description" style="max-width: 320px;">
                                                            <span class="desc-text" id="desc-{{ $type->id }}">{{ \Illuminate\Support\Str::limit($type->description, 50) }}</span>
                                                            @if(strlen($type->description) > 50)
                                                                <a href="javascript:void(0)" class="fs-8 text-primary toggle-desc ms-1" data-id="{{ $type->id }}" data-full="{{ $type->description }}" data-short="{{ \Illuminate\Support\Str::limit($type->description, 50) }}">Show more</a>
                                                            @endif
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </td>
                                        <td class="fw-bold text-gray-800">
                                            {{ $type->max_days }} Days
                                        </td>
                                        <td>
                                            @if($type->is_paid)
                                                <span class="badge badge-light-success fs-8">Paid</span>
                                            @else
                                                <span class="badge badge-light-warning fs-8">Unpaid</span>
                                            @endif
                                        </td>
                                        <td>
                                            <span class="badge badge-light-success fs-8">{{ $type->status }}</span>
                                        </td>
                                        <td class="text-end">
                                            <div class="d-flex justify-content-end gap-2">
                                                <a href="{{ route('leave-types-edit', $type) }}" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm" title="Edit">
                                                    <i class="bi bi-pencil fs-4"></i>
                                                </a>
                                                <form action="{{ route('leave-types-delete', $type) }}" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this leave type?')">
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
                                        <td colspan="5" class="text-center text-muted py-10">No leave types found.</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    #leaveTypeForm .leave-type-invalid { border-color: #f1414d !important; box-shadow: none !important; }
    #leaveTypeForm .leave-type-invalid:focus { border-color: #f1414d !important; box-shadow: 0 0 0 2px rgba(241,65,77,.08) !important; }
    #leaveTypeForm .leave-type-error { display: block; color: #f1414d; font-size: 12px; margin-top: 7px; }
</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('leaveTypeForm');
        if (!form) return;

        form.noValidate = true;
        form.querySelectorAll('[required]').forEach(field => field.removeAttribute('required'));

        const rules = {
            name(field) {
                const value = field.value.trim();
                if (!value) return 'Leave Type Name is required';
                if (value.length < 2) return 'Leave Type Name must be at least 2 characters';
                if (value.length > 191) return 'Leave Type Name may not be greater than 191 characters';
                return '';
            },
            max_days(field) {
                const value = field.value.trim();
                if (value === '') return 'Max Days / Year is required';
                if (!/^\d+$/.test(value)) return 'Max Days / Year must be a whole number';
                if (Number(value) < 0) return 'Max Days / Year cannot be negative';
                return '';
            },
            color(field) {
                const value = field.value.trim();
                if (!value) return 'Color is required';
                return /^#[0-9A-Fa-f]{6}$/.test(value) ? '' : 'Enter a valid color code, e.g. #3BB2F6';
            },
            status(field) {
                return ['Active', 'Inactive'].includes(field.value) ? '' : 'Status is required';
            }
        };

        function getErrorBox(field) {
            const container = field.name === 'color' ? field.closest('.col-6') : field.parentElement;
            let box = container.querySelector('.leave-type-error[data-error-for="' + field.name + '"]');
            if (!box) {
                box = document.createElement('span');
                box.className = 'leave-type-error';
                box.dataset.errorFor = field.name;
                if (field.name === 'color') container.appendChild(box); else field.insertAdjacentElement('afterend', box);
            }
            return box;
        }

        function validateField(field) {
            const message = rules[field.name] ? rules[field.name](field) : '';
            const box = getErrorBox(field);
            field.classList.toggle('leave-type-invalid', Boolean(message));
            field.setAttribute('aria-invalid', message ? 'true' : 'false');
            box.textContent = message;
            box.style.display = message ? 'block' : 'none';
            return !message;
        }

        Object.keys(rules).forEach(name => {
            const field = form.elements[name];
            if (!field) return;
            const eventName = field.tagName === 'SELECT' ? 'change' : 'input';
            field.addEventListener(eventName, function () {
                if (name === 'color' && /^#[0-9A-Fa-f]{6}$/.test(field.value)) {
                    document.getElementById('color_picker').value = field.value;
                }
                validateField(field);
            });
            field.addEventListener('blur', () => validateField(field));
        });

        const picker = document.getElementById('color_picker');
        picker.addEventListener('input', function () {
            form.elements.color.value = picker.value.toUpperCase();
            validateField(form.elements.color);
        });

        form.addEventListener('submit', function (event) {
            let firstInvalid = null;
            Object.keys(rules).forEach(name => {
                const field = form.elements[name];
                if (field && !validateField(field) && !firstInvalid) firstInvalid = field;
            });
            if (firstInvalid) {
                event.preventDefault();
                firstInvalid.focus();
                firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        });
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Description toggling
        const toggleButtons = document.querySelectorAll('.toggle-desc');
        toggleButtons.forEach(btn => {
            btn.addEventListener('click', function () {
                const id = this.getAttribute('data-id');
                const isShort = this.innerText === 'Show more';
                const parent = document.getElementById('desc-' + id);
                if (isShort) {
                    parent.innerText = this.getAttribute('data-full');
                    this.innerText = 'Show less';
                    // Re-append the button inside the container
                    parent.appendChild(this);
                } else {
                    parent.innerText = this.getAttribute('data-short');
                    this.innerText = 'Show more';
                    parent.appendChild(this);
                }
            });
        });
    });
</script>
@endsection
