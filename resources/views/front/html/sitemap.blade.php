@extends('front.feb.layouts.master')
@section('title', 'Sitemap')
@section('content')
@include('front.html.partials.info-page-styles')
<style>
    .site-map-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:22px}.site-map-group{padding:28px;border:1px solid var(--ip-line);border-radius:14px}.site-map-group h2{margin:0 0 18px!important;font-size:21px!important}.site-map-group ul{margin:0!important;padding:0!important;list-style:none}.site-map-group li{margin:0!important;padding:10px 0!important;border-top:1px solid var(--ip-line)}.site-map-group a{text-decoration:none!important}.site-map-group a:hover{text-decoration:underline!important}@media(max-width:760px){.site-map-grid{grid-template-columns:1fr}}
</style>
<main class="info-page">
    <header class="info-page__hero"><div class="info-page__container">
        <nav class="info-page__crumbs"><a href="{{ route('home') }}">Home</a><span>/</span><strong>Sitemap</strong></nav>
        <h1>Sitemap</h1><p>Quick links to shopping, support and company information.</p>
    </div></header>
    <section class="info-page__body"><div class="info-page__container"><div class="info-page__card info-page__content site-map-grid">
        <section class="site-map-group"><h2>Shop</h2><ul>
            <li><a href="{{ route('home') }}">Home</a></li>
            <li><a href="{{ route('shop-new') }}">New Arrivals</a></li>
            <li><a href="{{ route('all-products') }}">All Products</a></li>
            <li><a href="{{ route('wishlist') }}">Wishlist</a></li>
            <li><a href="{{ route('theme-carts') }}">Cart</a></li>
        </ul></section>
        <section class="site-map-group"><h2>Customer Service</h2><ul>
            <li><a href="{{ route('order-tracking') }}">Track Order</a></li>
            <li><a href="{{ route('size-guide') }}">Size Guide</a></li>
            <li><a href="{{ route('faq') }}">FAQs</a></li>
            <li><a href="{{ route('contact-us') }}">Contact Us</a></li>
            <li><a href="{{ route('return-policy') }}">Return Policy</a></li>
        </ul></section>
        <section class="site-map-group"><h2>Company &amp; Legal</h2><ul>
            <li><a href="{{ route('about-us') }}">About Us</a></li>
            <li><a href="{{ route('blogs') }}">Blog</a></li>
            <li><a href="{{ route('careers') }}">Careers</a></li>
            <li><a href="{{ route('privacy-policy') }}">Privacy Policy</a></li>
            <li><a href="{{ route('cookie-policy') }}">Cookie Policy</a></li>
            <li><a href="{{ route('terms-and-conditions') }}">Terms &amp; Conditions</a></li>
        </ul></section>
    </div></div></section>
</main>
@endsection
