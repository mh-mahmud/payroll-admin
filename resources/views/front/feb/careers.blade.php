@extends('front.feb.layouts.master')

@section('title', 'Careers')

@section('content')
@include('front.feb.partials.editorial-styles')
<main class="feb-editorial">
    <header class="feb-editorial__hero">
        <span class="feb-editorial__eyebrow">Join Our Team</span>
        <h1>Build With FebriStudio</h1>
        <p>Do meaningful work with a team shaping modern apparel and e-commerce experiences.</p>
    </header>
    <div class="feb-editorial__container">
        <div class="feb-editorial__breadcrumbs"><a href="{{ route('home') }}">Home</a> &nbsp;/&nbsp; Careers</div>
        <div class="feb-career-list">
            @forelse($careers as $career)
                <article class="feb-career-card">
                    <a class="feb-career-card__image" href="{{ route('career-details', $career->id) }}">
                        @if($career->job_image)
                            <img src="{{ \App\Support\MediaStorage::url($career->job_image, 'careers') }}" alt="{{ $career->job_title }}" loading="lazy">
                        @endif
                    </a>
                    <div class="feb-career-card__body">
                        <span class="feb-editorial__meta">Open Position</span>
                        <h2>{{ $career->job_title }}</h2>
                        <p class="feb-editorial__excerpt">{{ \Illuminate\Support\Str::limit(trim(strip_tags($career->job_description)), 115) }}</p>
                        <a class="feb-editorial__read" href="{{ route('career-details', $career->id) }}">View position <span>→</span></a>
                    </div>
                </article>
            @empty
                <div class="feb-editorial__empty">There are no open positions right now. Please check back soon.</div>
            @endforelse
        </div>
        @if($careers->hasPages())<div class="feb-editorial__pagination">{{ $careers->links() }}</div>@endif
    </div>
</main>
@endsection
