@extends('front.feb.layouts.master')
@section('title', 'Size Guide')
@section('content')
@include('front.html.partials.info-page-styles')
<main class="info-page">
    <header class="info-page__hero"><div class="info-page__container">
        <nav class="info-page__crumbs"><a href="{{ route('home') }}">Home</a><span>/</span><strong>Size Guide</strong></nav>
        <h1>Size Guide</h1>
        <p>Find the right fit before placing your order.</p>
    </div></header>
    <section class="info-page__body"><div class="info-page__container"><article class="info-page__card info-page__content">
        <div class="info-page__lead">Fit &amp; measurements</div>
        @if(filled($settings?->size_guide))
            {!! $settings->size_guide !!}
        @else
            <div class="info-page__empty"><div class="info-page__empty-icon">↔</div><h2>Size guide coming soon</h2><p>Please contact our support team for product measurements and sizing assistance.</p></div>
        @endif
    </article></div></section>
</main>
@endsection
