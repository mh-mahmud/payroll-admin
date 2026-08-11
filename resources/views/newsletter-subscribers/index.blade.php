@extends('layouts.master')

@section('content')
<div class="toolbar" id="kt_toolbar">
    <div id="kt_toolbar_container" class="container-fluid d-flex flex-stack">
        <div class="page-title d-flex align-items-center flex-wrap me-3">
            <h1 class="d-flex align-items-center text-dark fw-bolder fs-3 my-1">Newsletter Subscribers
                <span class="h-20px border-gray-200 border-start ms-3 mx-2"></span>
                <small class="text-muted fs-7 fw-bold my-1 ms-1">Footer subscriptions</small>
            </h1>
        </div>
        <span class="badge badge-light-primary fs-7">{{ $subscribers->total() }} subscriber(s)</span>
    </div>
</div>

<div class="container-fluid py-6">
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="card shadow-sm">
        <div class="card-header align-items-center">
            <h3 class="card-title">Subscriber List</h3>
            <form method="GET" action="{{ route('admin-newsletter.index') }}" class="card-toolbar d-flex gap-2">
                <input type="search" name="search" value="{{ $search }}" class="form-control form-control-sm form-control-solid" placeholder="Search email..." aria-label="Search subscribers">
                <button class="btn btn-sm btn-primary" type="submit">Search</button>
                @if($search !== '')<a href="{{ route('admin-newsletter.index') }}" class="btn btn-sm btn-light">Clear</a>@endif
            </form>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table align-middle table-row-bordered mb-0">
                    <thead><tr class="text-muted fw-bold"><th class="ps-6 w-80px">#</th><th>Email</th><th>Source</th><th>Subscribed At</th><th class="text-end pe-6">Action</th></tr></thead>
                    <tbody>
                    @forelse($subscribers as $subscriber)
                        <tr>
                            <td class="ps-6">{{ $subscribers->firstItem() + $loop->index }}</td>
                            <td><a href="mailto:{{ $subscriber->email }}" class="fw-bolder text-dark">{{ $subscriber->email }}</a></td>
                            <td><span class="badge badge-light-info">{{ ucfirst($subscriber->source) }}</span></td>
                            <td>{{ $subscriber->created_at->format('d M Y, h:i A') }}</td>
                            <td class="text-end pe-6">
                                <form method="POST" action="{{ route('admin-newsletter.destroy', $subscriber) }}" onsubmit="return confirm('Remove this subscriber?')">
                                    @csrf @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-light-danger">Delete</button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr><td colspan="5" class="text-center text-muted py-15">No newsletter subscribers found.</td></tr>
                    @endforelse
                    </tbody>
                </table>
            </div>
        </div>
        @if($subscribers->hasPages())<div class="card-footer">{{ $subscribers->links() }}</div>@endif
    </div>
</div>
@endsection
