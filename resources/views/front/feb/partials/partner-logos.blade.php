@php
    $partnerLogos = collect($setting->partner_logos ?? []);

    if ($setting->featured_partner_logo) {
        $partnerLogos->prepend($setting->featured_partner_logo);
    }

    $partnerLogos = $partnerLogos
        ->filter(fn ($logo) => filled($logo))
        ->unique()
        ->values();
@endphp

@if($partnerLogos->isNotEmpty())
    <div class="container-fluid text-center partner-logo-section">
        <div id="print_type_carousel" class="carousel-items partner-logo-carousel">
            @foreach($partnerLogos as $logo)
                <div class="carousel-col slick-slide-client">
                    <img src="{{ $setting->assetUrl($logo) }}" alt="Partner logo" loading="lazy" />
                </div>
            @endforeach
        </div>
    </div>
@endif
