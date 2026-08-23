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
                <li class="breadcrumb-item text-dark">Leave Balances</li>
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

    <div class="d-flex flex-stack flex-wrap mb-6">
        <div class="me-2">
            <h1 class="text-dark fw-bold my-1 fs-3">Leave Balances</h1>
            <div class="text-muted fs-7">View and manage leave balances.</div>
        </div>
        <div class="d-flex gap-2">
            <button type="button" class="btn btn-sm btn-light-primary fw-bold">Sync History</button>
            <form action="{{ route('leave-balances-sync') }}" method="POST" class="d-inline">
                @csrf
                <input type="hidden" name="year" value="{{ $year }}">
                <button type="submit" class="btn btn-sm btn-outline btn-outline-success btn-active-light-success fw-bold d-flex align-items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-arrow-repeat" viewBox="0 0 16 16">
                        <path d="M11.534 7h3.932a.25.25 0 0 1 .192.41l-1.966 2.36a.25.25 0 0 1-.384 0l-1.966-2.36a.25.25 0 0 1 .192-.41zm-5.34 3h-3.932a.25.25 0 0 1-.192-.41l1.966-2.36a.25.25 0 0 1 .384 0l1.966 2.36a.25.25 0 0 1-.192.41z"/>
                        <path fill-rule="evenodd" d="M8 3c-1.552 0-2.94.707-3.857 1.818a.5.5 0 1 1-.771-.636A6.002 6.002 0 0 1 13.917 7H12.9A5.002 5.002 0 0 0 8 3zM3.1 9a5.002 5.002 0 0 0 8.757 2.182.5.5 0 1 1 .771.636A6.002 6.002 0 0 1 2.083 9H3.1z"/>
                    </svg>
                    Re-sync {{ $year }}
                </button>
            </form>
        </div>
    </div>

    <!-- Filter Card -->
    <div class="card card-flush mb-6">
        <div class="card-body py-4">
            <form method="GET" action="{{ route('leave-balances') }}" class="row g-3 align-items-center">
                <div class="col-md-4">
                    <div class="position-relative">
                        <span class="position-absolute top-50 translate-middle-y ms-3">
                            <i class="bi bi-search fs-4 text-muted"></i>
                        </span>
                        <input type="text" name="search" class="form-control form-control-solid ps-10 form-control-sm" placeholder="Search..." value="{{ request('search') }}">
                    </div>
                </div>
                <div class="col-md-3">
                    <select name="employee_id" class="form-select form-select-solid form-select-sm">
                        <option value="">All Employees</option>
                        @foreach($allEmployees as $emp)
                            <option value="{{ $emp->id }}" {{ request('employee_id') == $emp->id ? 'selected' : '' }}>{{ $emp->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="year" class="form-select form-select-solid form-select-sm">
                        @foreach($years as $y)
                            <option value="{{ $y }}" {{ $year == $y ? 'selected' : '' }}>{{ $y }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-secondary btn-sm fw-bold">Filters</button>
                </div>
            </form>

            <div class="mt-3 fs-8 text-muted d-flex gap-4">
                <span class="badge badge-light-secondary px-3 py-2">Year: {{ $year }}</span>
                <span class="py-1">Last synced: {{ now()->toDateString() }} 06:00</span>
            </div>
        </div>
    </div>

    <!-- Grid Layout of Employee Cards -->
    <div class="row g-6">
        @forelse($employees as $emp)
            <div class="col-md-4">
                <div class="card card-flush h-100">
                    <!-- Card Header / Employee profile -->
                    <div class="card-header pt-5">
                        <div class="d-flex align-items-center">
                            <!-- Avatar -->
                            <div class="symbol symbol-45px symbol-circle me-3">
                                @if($emp->profile_image)
                                    <img src="{{ asset('storage/' . $emp->profile_image) }}" alt="avatar" />
                                @else
                                    <div class="symbol-label fs-5 fw-semibold bg-light-success text-success">
                                        {{ strtoupper(substr($emp->name, 0, 1)) }}
                                    </div>
                                @endif
                            </div>
                            <div class="d-flex flex-column">
                                <span class="text-gray-800 fw-bold fs-6">{{ $emp->name }}</span>
                                <span class="text-muted fs-8">{{ $emp->employee_code }}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Card Body / Balances Table -->
                    <div class="card-body pt-3">
                        <div class="table-responsive">
                            <table class="table align-middle table-row-dashed fs-7 gy-3 mb-0">
                                <thead>
                                    <tr class="text-start text-gray-400 fw-bold fs-8 text-uppercase gs-0">
                                        <th>Leave Type</th>
                                        <th class="text-center">Total</th>
                                        <th class="text-center">Used</th>
                                        <th class="text-center">Available</th>
                                        <th class="w-10px"></th>
                                    </tr>
                                </thead>
                                <tbody class="fw-semibold text-gray-600">
                                    @php
                                        $empBalancesList = $formattedBalances[$emp->id] ?? [];
                                    @endphp
                                    @foreach($empBalancesList as $bal)
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <span class="w-6px h-6px rounded-circle me-2 d-inline-block" style="background-color: {{ $bal->leaveType?->color ?? '#CCCCCC' }}"></span>
                                                    <span class="text-gray-800">{{ $bal->leaveType?->name }}</span>
                                                </div>
                                            </td>
                                            <td class="text-center text-gray-800">{{ $bal->total_days }}</td>
                                            <td class="text-center text-danger">{{ $bal->used_days }}</td>
                                            <td class="text-center text-success fw-bold">{{ $bal->available_days }}</td>
                                            <td>
                                                <i class="bi bi-info-circle text-muted cursor-pointer" data-bs-toggle="tooltip" title="Leave type rules apply."></i>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        @empty
            <div class="col-12">
                <div class="card card-flush py-10 text-center text-muted">No employees found.</div>
            </div>
        @endforelse
    </div>

    @if($employees->hasPages())
        <div class="mt-5">
            {{ $employees->links() }}
        </div>
    @endif
</div>
@endsection
