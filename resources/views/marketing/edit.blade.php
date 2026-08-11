@extends('layouts.master')

@section('content')
<div class="container-fluid py-6">
    <div class="d-flex flex-wrap align-items-center justify-content-between mb-6 gap-3">
        <div>
            <h1 class="fw-bolder text-dark mb-2">Marketing</h1>
            <div class="text-muted">Manage storefront analytics and advertising tracking snippets.</div>
        </div>
        <a href="{{ route('dashboard') }}" class="btn btn-light">Back to Dashboard</a>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if($errors->any())
        <div class="alert alert-danger">
            <strong>Please correct the following:</strong>
            <ul class="mb-0 mt-2">@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
        </div>
    @endif

    <div class="alert alert-warning">
        These snippets execute as code on every storefront page. Only paste code copied directly from Meta or Google.
    </div>

    <form action="{{ route('marketing-settings.update') }}" method="POST">
        @csrf
        @method('PUT')

        <div class="row g-5">
            @foreach([
                ['meta_pixel_code', 'Meta Pixel Code', 'Paste the complete Meta Pixel script, including any noscript fallback.'],
                ['gtm_head_code', 'Google Tag Manager — Header', 'Paste the GTM code intended for the <head> section.'],
                ['gtm_footer_code', 'Google Tag Manager — Footer / Body', 'Paste the GTM body or footer snippet. It is inserted before </body>.'],
                ['google_analytics_code', 'Google Analytics Code', 'Paste the complete Google Analytics or Google tag script.'],
                ['custom_header_code', 'Custom Header Code', 'Custom HTML, CSS or JavaScript inserted before the closing </head> tag.'],
                ['custom_footer_code', 'Custom Footer Code', 'Custom HTML or JavaScript inserted before the closing </body> tag.'],
            ] as [$field, $label, $help])
                <div class="col-12 col-xl-6">
                    <div class="card h-100 shadow-sm border-0">
                        <div class="card-header border-0">
                            <div class="card-title flex-column align-items-start">
                                <h3 class="fw-bolder mb-1">{{ $label }}</h3>
                                <span class="text-muted fs-7">{{ $help }}</span>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <textarea name="{{ $field }}" class="form-control font-monospace" rows="12"
                                spellcheck="false" placeholder="<!-- Paste code here -->">{{ old($field, $settings->{$field}) }}</textarea>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <div class="d-flex justify-content-end mt-6">
            <button type="submit" class="btn btn-primary px-8">Save Marketing Codes</button>
        </div>
    </form>
</div>
@endsection
