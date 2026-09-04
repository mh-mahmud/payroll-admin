@extends('layouts.master')
@section('content')
    <div class="toolbar">
        <div class="container-fluid d-flex flex-stack">
            <h1 class="fs-3 fw-bolder">{{ $item ? 'Edit' : 'Add' }} {{ rtrim($title, 's') }}</h1><a class="btn btn-light"
                href="{{ route('organization.index', $type) }}">Back</a>
        </div>
    </div>
    <div class="container-fluid py-6">
        <form method="POST"
            action="{{ $item ? route('organization.update', [$type, $item->id]) : route('organization.store', $type) }}">@csrf
            @if ($item)
                @method('PUT')
            @endif
            <div class="card">
                <div class="card-body">
                    <div class="row g-5">
                        <div class="col-md-6"><label class="form-label required" for="organization-name">Name</label><input
                                id="organization-name" name="name" value="{{ old('name', $item->name ?? '') }}"
                                class="form-control @error('name') is-invalid @enderror" required minlength="2"
                                maxlength="100" aria-describedby="name-help name-error"
                                @if ($type === 'branches') pattern="[A-Za-z0-9 .&()'/-]+" @endif>
                            <div id="name-help" class="form-text">Maximum 100 characters.</div>
                            @error('name')
                                <div id="name-error" class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="col-md-6"><label class="form-label">Code</label><input name="code"
                                value="{{ old('code', $item->code ?? '') }}"
                                class="form-control @error('code') is-invalid @enderror" maxlength="50"
                                @if ($type === 'branches') pattern="[A-Za-z0-9_-]+" placeholder="Leave blank to auto-generate" @endif>
                            @error('code')
                                <div class="invalid-feedback d-block">{{ $message }}</div>
                            @enderror
                        </div>
                        @if ($type === 'branches')
                            <div class="col-md-6"><label class="form-label">Email</label><input type="email"
                                    name="email" value="{{ old('email', $item->email ?? '') }}" class="form-control"></div>
                            <div class="col-md-6"><label class="form-label">Contact</label><input name="contact"
                                    value="{{ old('contact', $item->contact ?? '') }}" class="form-control"></div>
                        @endif
                        @if ($type === 'departments')
                            <div class="col-md-6"><label class="form-label">Branch</label><select name="branch_id"
                                    class="form-select">
                                    <option value="">Select</option>
                                    @foreach ($branches as $v)
                                        <option value="{{ $v->id }}" @selected(($item->branch_id ?? null) == $v->id)>
                                            {{ $v->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        @endif
                        @if ($type === 'designations')
                            <div class="col-md-6"><label class="form-label">Department</label><select name="department_id"
                                    class="form-select">
                                    <option value="">Select</option>
                                    @foreach ($departments as $v)
                                        <option value="{{ $v->id }}" @selected(($item->department_id ?? null) == $v->id)>
                                            {{ $v->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        @endif
                        @if ($type === 'holidays')
                            <div class="col-md-6"><label class="form-label required">Holiday Date</label><input
                                    type="date" name="holiday_date"
                                    value="{{ old('holiday_date', $item->holiday_date ?? '') }}" class="form-control"
                                    required></div>
                            <div class="col-md-6"><label class="form-label">Category</label><select name="category"
                                    class="form-select">
                                    @foreach (['National', 'Company-specific', 'Religious', 'Regional'] as $v)
                                        <option @selected(($item->category ?? '') === $v)>{{ $v }}</option>
                                    @endforeach
                                </select></div>
                        @endif
                        @if ($type === 'announcements')
                            <div class="col-md-6"><label class="form-label">Category</label><input name="category"
                                    value="{{ old('category', $item->category ?? '') }}" class="form-control"></div>
                            <div class="col-md-6"><label class="form-label">Audience</label><input name="audience"
                                    value="{{ old('audience', $item->audience ?? 'Company-wide') }}" class="form-control">
                            </div>
                            <div class="col-md-6"><label class="form-label">Start Date</label><input type="date"
                                    name="start_date" value="{{ old('start_date', $item->start_date ?? '') }}"
                                    class="form-control"></div>
                            <div class="col-md-6"><label class="form-label">End Date</label><input type="date"
                                    name="end_date" value="{{ old('end_date', $item->end_date ?? '') }}" class="form-control">
                            </div>
                        @endif
                        @if (in_array($type, ['announcements', 'award-types', 'document-types']))
                            <div class="col-12"><label class="form-label">Description</label>
                                <textarea name="description" class="form-control" rows="4">{{ old('description', $item->description ?? '') }}</textarea>
                            </div>
                        @endif
                        @if ($type === 'document-types')
                            <div class="col-md-6"><label class="form-label">Required</label><select name="is_required"
                                    class="form-select">
                                    <option value="0">Optional</option>
                                    <option value="1" @selected($item->is_required ?? false)>Required</option>
                                </select></div>
                        @endif
                        <div class="col-md-6"><label class="form-label">Status</label><select name="status"
                                class="form-select">
                                <option value="1">Active</option>
                                <option value="0" @selected(isset($item) && !$item->status)>Inactive</option>
                            </select></div>
                    </div>
                </div>
                <div class="card-footer text-end"><button class="btn btn-success">Save</button></div>
            </div>
        </form>
    </div>
@endsection