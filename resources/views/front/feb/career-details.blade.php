@extends('front.feb.layouts.master')

@section('title', $career->job_title)

@section('content')
@include('front.feb.partials.editorial-styles')
<main class="feb-editorial">
    <header class="feb-editorial__hero">
        <span class="feb-editorial__eyebrow">Open Position</span>
        <h1>{{ $career->job_title }}</h1>
        <p>Join FebriStudio and help us create remarkable products and customer experiences.</p>
    </header>
    <div class="feb-editorial__container">
        <div class="feb-editorial__breadcrumbs"><a href="{{ route('home') }}">Home</a> &nbsp;/&nbsp; <a href="{{ route('careers') }}">Careers</a> &nbsp;/&nbsp; Position</div>
        <article class="feb-editorial__article">
            @if($career->job_image)
                <img class="feb-editorial__article-cover" src="{{ \App\Support\MediaStorage::url($career->job_image, 'careers') }}" alt="{{ $career->job_title }}">
            @endif
            <div class="feb-editorial__article-body">
                <span class="feb-editorial__meta">Career Opportunity</span>
                <h1>{{ $career->job_title }}</h1>
                <div class="feb-editorial__article-content">{!! $career->job_description !!}</div>
                <a class="feb-editorial__back" href="{{ route('careers') }}">← Back to all positions</a>
            </div>
        </article>
    </div>
</main>
@endsection
