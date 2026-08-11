@extends('front.feb.layouts.master')

@section('title', $blog->blog_name)

@section('content')
@include('front.feb.partials.editorial-styles')
<main class="feb-editorial">
    <header class="feb-editorial__hero">
        <span class="feb-editorial__eyebrow">FebriStudio Journal</span>
        <h1>{{ $blog->blog_name }}</h1>
        <p>{{ $blog->created_at->format('d F Y') }}</p>
    </header>
    <div class="feb-editorial__container">
        <div class="feb-editorial__breadcrumbs"><a href="{{ route('home') }}">Home</a> &nbsp;/&nbsp; <a href="{{ route('blogs') }}">Blog</a> &nbsp;/&nbsp; Article</div>
        <article class="feb-editorial__article">
            @if($blog->blog_image)
                <img class="feb-editorial__article-cover" src="{{ \App\Support\MediaStorage::url($blog->blog_image, 'blogs') }}" alt="{{ $blog->blog_name }}">
            @endif
            <div class="feb-editorial__article-body">
                <span class="feb-editorial__meta">{{ $blog->created_at->format('d M Y') }}</span>
                <h1>{{ $blog->blog_name }}</h1>
                <div class="feb-editorial__article-content">{!! $blog->blog_description !!}</div>
                <a class="feb-editorial__back" href="{{ route('blogs') }}">← Back to all articles</a>
            </div>
        </article>
    </div>
</main>
@endsection
