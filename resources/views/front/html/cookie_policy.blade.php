@extends('front.feb.layouts.master')
@section('title', 'Cookie Policy')
@section('content')
@include('front.html.partials.info-page-styles')
<main class="info-page">
    <header class="info-page__hero"><div class="info-page__container">
        <nav class="info-page__crumbs"><a href="{{ route('home') }}">Home</a><span>/</span><strong>Cookie Policy</strong></nav>
        <h1>Cookie Policy</h1>
        <p>Learn how FebriStudio uses cookies to provide and improve your shopping experience.</p>
    </div></header>
    <section class="info-page__body"><div class="info-page__container"><article class="info-page__card info-page__content">
        <div class="info-page__lead">Website cookies</div>
        @if(filled($settings?->cookie_policy))
            {!! $settings->cookie_policy !!}
        @else
            <h2>How we use cookies</h2>
            <p>We use essential cookies to keep your cart, account session and currency preferences working correctly. We may also use analytics cookies to understand and improve website performance.</p>
            <h3>Your choices</h3>
            <p>You can control or remove cookies through your browser settings. Disabling essential cookies may affect parts of the shopping experience.</p>
        @endif
    </article></div></section>
</main>
@endsection
