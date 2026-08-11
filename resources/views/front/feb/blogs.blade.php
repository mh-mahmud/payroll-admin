@extends('front.feb.layouts.master')

@section('title', 'Blog')

@section('content')
@include('front.feb.partials.editorial-styles')
<main class="feb-editorial">
    <header class="feb-editorial__hero">
        <span class="feb-editorial__eyebrow">FebriStudio Journal</span>
        <h1>Stories &amp; Ideas</h1>
        <p>Style inspiration, apparel guides, behind-the-scenes stories and everything new at FebriStudio.</p>
    </header>
    <div class="feb-editorial__container">
        <div class="feb-editorial__breadcrumbs"><a href="{{ route('home') }}">Home</a> &nbsp;/&nbsp; Blog</div>
        <div class="feb-editorial__grid">
            @forelse($blogs as $blog)
                <article class="feb-editorial__card">
                    <a class="feb-editorial__image" href="{{ route('blog-details', $blog->id) }}">
                        <img src="{{ \App\Support\MediaStorage::url($blog->blog_image, 'blogs') }}" alt="{{ $blog->blog_name }}" loading="lazy">
                    </a>
                    <div class="feb-editorial__card-body">
                        <span class="feb-editorial__meta">{{ $blog->created_at->format('d M Y') }}</span>
                        <h2><a href="{{ route('blog-details', $blog->id) }}">{{ $blog->blog_name }}</a></h2>
                        <p class="feb-editorial__excerpt">{{ \Illuminate\Support\Str::limit(trim(strip_tags($blog->blog_description)), 145) }}</p>
                        <a class="feb-editorial__read" href="{{ route('blog-details', $blog->id) }}">Read article <span>→</span></a>
                    </div>
                </article>
            @empty
                <div class="feb-editorial__empty">No articles have been published yet.</div>
            @endforelse
        </div>
        @if($blogs->hasPages())<div class="feb-editorial__pagination">{{ $blogs->links() }}</div>@endif
    </div>
</main>
@endsection
