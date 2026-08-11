@php
    $footerSettings = $febSettings ?? \App\Models\Settings::first();
    $footerPhones = collect([
        $footerSettings?->office_phone_number,
        $footerSettings?->phone_number_2,
        $footerSettings?->phone_number_3,
    ])->filter()->unique()->values();
    $footerSocialLinks = collect([
        ['label' => 'Facebook', 'icon' => 'fa-facebook', 'url' => $footerSettings?->facebook_link],
        ['label' => 'Instagram', 'icon' => 'fa-instagram', 'url' => $footerSettings?->instagram_link],
        ['label' => 'TikTok', 'icon' => 'fa-music', 'url' => $footerSettings?->tiktok_link],
        ['label' => 'Pinterest', 'icon' => 'fa-pinterest-p', 'url' => $footerSettings?->pinterest_link],
        ['label' => 'YouTube', 'icon' => 'fa-youtube-play', 'url' => $footerSettings?->youtube_link],
        ['label' => 'LinkedIn', 'icon' => 'fa-linkedin', 'url' => $footerSettings?->linkedin_link],
    ])->filter(fn ($social) => filled($social['url']));
    $phoneHref = fn ($phone) => preg_replace('/[^0-9+]/', '', (string) $phone);
    $address = trim(strip_tags((string) $footerSettings?->contact_address)) ?: 'Dhaka, Bangladesh';
    $footerCopy = trim(strip_tags(html_entity_decode(
        $footerSettings?->footer_message ?: 'FebriStudio is a leading print-on-demand and custom apparel brand in Bangladesh, offering premium-quality t-shirts, oversized t-shirts, polo shirts, hoodies, sweatshirts, and personalized merchandise. We focus on premium fabrics, unique designs, secure online shopping, and fast nationwide delivery.',
        ENT_QUOTES | ENT_HTML5,
        'UTF-8'
    )));
@endphp

<div class="footer-container">
    <footer id="footer" class="feb-footer">
        <style>
            #footer.feb-footer {
                --footer-gold: #bca273;
                --footer-text: #aaa9a7;
                --footer-border: rgba(255, 255, 255, .12);
                background:
                    radial-gradient(circle at 53% 22%, rgba(35, 38, 40, .2), transparent 42%),
                    linear-gradient(115deg, #0b0e10, #090c0e 52%, #0b0e10) !important;
                color: var(--footer-text);
                font-family: inherit;
                font-size: 16px;
                line-height: 1.65;
                letter-spacing: .01em;
            }

            .feb-footer, .feb-footer * { box-sizing: border-box; }
            .feb-footer a { color: inherit; text-decoration: none; transition: color .2s ease; }
            .feb-footer a:hover { color: #fff; text-decoration: none; }
            .feb-footer__inner { width: min(1380px, calc(100% - 80px)); margin: 0 auto; }
            .feb-footer__main {
                display: grid;
                grid-template-columns: 1.18fr 1.06fr 1.1fr 1.2fr;
                gap: clamp(42px, 6vw, 105px);
                padding: 62px 0 48px;
            }
            .feb-footer__brand { padding-top: 22px; }
            .feb-footer__logo {
                display: inline-flex;
                align-items: flex-start;
                color: #f2f2f2 !important;
                font-size: 29px;
                font-weight: 300;
                letter-spacing: -.045em;
                line-height: 1;
                margin-bottom: 25px;
            }
            .feb-footer__logo strong { font-weight: 800; }
            .feb-footer__logo sup { font-size: 9px; margin: -4px 0 0 5px; letter-spacing: 0; }
            .feb-footer__description { max-width: 315px; margin: 0; line-height: 1.85; }
            .feb-footer__socials { display: flex; gap: 15px; flex-wrap: wrap; margin-top: 48px; }
            .feb-footer__social {
                width: 40px;
                height: 40px;
                display: grid;
                place-items: center;
                border: 1px solid rgba(255,255,255,.16);
                border-radius: 4px;
                color: #f3f3f3 !important;
                font-size: 23px;
            }
            .feb-footer__social:hover { border-color: var(--footer-gold); background: rgba(188,162,115,.08); }
            .feb-footer__title {
                display: table;
                width: fit-content;
                color: #f1f1f1;
                font-size: 16px;
                font-weight: 700;
                letter-spacing: .13em;
                margin: 0 auto 42px;
                text-transform: uppercase;
                position: relative;
            }
            .feb-footer__title::after {
                content: "";
                position: absolute;
                left: 0;
                bottom: -21px;
                width: 31px;
                height: 2px;
                background: var(--footer-gold);
            }
            .feb-footer__links { list-style: none; padding: 0; margin: 0; }
            .feb-footer__links li { margin: 0 0 9px; }
            .feb-footer__contact-list { display: grid; gap: 17px; margin-bottom: 36px; }
            .feb-footer__contact {
                display: grid;
                grid-template-columns: 22px 1fr;
                gap: 11px;
                align-items: start;
            }
            .feb-footer__contact i { color: #ddd; font-size: 18px; margin-top: 4px; text-align: center; }
            .feb-footer__newsletter-copy { font-size: 14px; line-height: 1.6; margin: 0 0 18px; max-width: 310px; }
            .feb-footer__newsletter { display: flex; height: 52px; max-width: 325px; }
            .feb-footer__newsletter .mail-subscribe {
                min-width: 0;
                width: 100%;
                height: 52px;
                padding: 0 16px;
                color: #eee;
                background: transparent;
                border: 1px solid rgba(255,255,255,.16);
                border-right: 0;
                border-radius: 0;
                box-shadow: none;
                font-size: 14px;
            }
            .feb-footer__newsletter .mail-subscribe::placeholder { color: #777; }
            .feb-footer__newsletter .mail-subscribe-btn {
                flex: 0 0 74px;
                border: 0;
                border-radius: 0;
                background: linear-gradient(135deg, #c6ae7f, #aa8e5f);
                color: #151515;
                font-size: 29px;
                line-height: 1;
                padding: 0;
            }
            .feb-footer__newsletter-status {
                display: none;
                max-width: 325px;
                margin-top: 9px;
                font-size: 13px;
                line-height: 1.4;
            }
            .feb-footer__newsletter-status.is-visible { display: block; }
            .feb-footer__newsletter-status.is-success { color: #79d89a; }
            .feb-footer__newsletter-status.is-error { color: #ff8c8c; }
            .feb-footer__floating-actions {
                position: fixed;
                left: 22px;
                bottom: 24px;
                z-index: 9998;
                display: flex;
                flex-direction: column;
                gap: 12px;
            }
            .feb-footer__floating-action {
                width: 52px;
                height: 52px;
                display: grid;
                place-items: center;
                border-radius: 50%;
                color: #fff !important;
                font-size: 25px;
                box-shadow: 0 5px 18px rgba(0, 0, 0, .28);
                transition: transform .2s ease, box-shadow .2s ease;
            }
            .feb-footer__floating-action:hover { transform: translateY(-2px); box-shadow: 0 8px 24px rgba(0, 0, 0, .34); }
            .feb-footer__floating-action--whatsapp { background: #25d366; }
            .feb-footer__floating-action--messenger { background: linear-gradient(135deg, #00b2ff, #7b2cff); }
            .feb-footer__payments { border-top: 1px solid var(--footer-border); border-bottom: 1px solid var(--footer-border); }
            .feb-footer__payments-row {
                min-height: 118px;
                display: grid;
                grid-template-columns: minmax(300px, 1fr) 2fr;
                align-items: center;
                gap: 55px;
            }
            .feb-footer__secure { display: flex; align-items: center; gap: 20px; }
            .feb-footer__shield {
                position: relative;
                flex: 0 0 64px;
                width: 64px;
                height: 70px;
            }
            .feb-footer__secure-icon {
                position: absolute;
                top: 3px;
                left: 50%;
                width: 54px;
                height: 61px;
                transform: translateX(-50%);
            }
            .feb-footer__secure strong { display: block; color: #e5e5e5; font-size: 14px; letter-spacing: .08em; }
            .feb-footer__secure span { display: block; max-width: 245px; font-size: 14px; line-height: 1.4; }
            .feb-footer__payment-list { display: flex; justify-content: flex-end; align-items: center; min-width: 0; }
            .feb-footer__pay {
                height: 48px;
                min-width: 104px;
                padding: 0 22px;
                display: grid;
                place-items: center;
                border-left: 1px solid var(--footer-border);
            }
            .feb-footer__pay:first-child { border-left: 0; }
            .feb-footer__pay img { max-width: 78px; max-height: 38px; object-fit: contain; }
            .feb-footer__pay--amex { color: #d9f2ff; font-weight: 800; font-size: 10px; line-height: 1.05; text-align: center; background: #2278a2; height: 30px; min-width: 62px; padding: 4px; margin: 0 21px; }
            .feb-footer__pay--nagad { color: #e6e2d8; font-size: 24px; font-weight: 700; }
            .feb-footer__pay--rocket { color: #a72196; font-size: 19px; font-weight: 800; font-style: italic; }
            .feb-footer__summary {
                min-height: 186px;
                display: grid;
                grid-template-columns: 1.15fr 1fr;
                gap: 90px;
                align-items: center;
            }
            .feb-footer__summary p { margin: 0; max-width: 640px; font-size: 14px; line-height: 1.75; }
            .feb-footer__utility { display: flex; justify-content: flex-end; align-items: center; }
            .feb-footer__utility a { padding: 0 40px; border-left: 1px solid rgba(255,255,255,.22); }
            .feb-footer__utility a:first-child { border-left: 0; }
            .feb-footer__bottom { border-top: 1px solid var(--footer-border); }
            .feb-footer__bottom-row {
                min-height: 91px;
                display: grid;
                grid-template-columns: 1fr auto auto;
                align-items: center;
                gap: 40px;
                font-size: 14px;
            }
            .feb-footer__credit strong { color: var(--footer-gold); font-weight: 400; }
            .feb-footer__top { border-left: 1px solid rgba(255,255,255,.22); padding-left: 40px; }
            .feb-footer__top i { margin-left: 20px; }

            @media (max-width: 1100px) {
                .feb-footer__main { grid-template-columns: repeat(2, 1fr); }
                .feb-footer__payment-list { flex-wrap: wrap; justify-content: flex-start; }
                .feb-footer__pay { border-left: 0; }
                .feb-footer__summary { gap: 30px; }
                .feb-footer__utility a { padding: 0 20px; }
            }
            @media (max-width: 767px) {
                .feb-footer__inner { width: min(100% - 36px, 620px); }
                .feb-footer__main { grid-template-columns: 1fr; gap: 38px; padding: 42px 0; }
                .feb-footer__brand { padding-top: 0; }
                .feb-footer__socials { margin-top: 28px; }
                .feb-footer__payments-row, .feb-footer__summary, .feb-footer__bottom-row { grid-template-columns: 1fr; }
                .feb-footer__payments-row { padding: 30px 0; gap: 28px; }
                .feb-footer__payment-list { justify-content: center; gap: 8px; }
                .feb-footer__pay { min-width: 78px; padding: 0 10px; }
                .feb-footer__summary { padding: 35px 0; gap: 30px; }
                .feb-footer__utility { justify-content: flex-start; flex-wrap: wrap; gap: 14px 0; }
                .feb-footer__utility a { padding: 0 18px; }
                .feb-footer__utility a:first-child { padding-left: 0; }
                .feb-footer__bottom-row { padding: 27px 0; gap: 14px; }
                .feb-footer__top { border-left: 0; padding-left: 0; }
                .feb-footer__floating-actions { left: 14px; bottom: calc(var(--mobile-bottom-nav-height, 60px) + 20px); }
                .feb-footer__floating-action { width: 46px; height: 46px; font-size: 22px; }
                .feb-footer__floating-actions { display: none; }
            }
        </style>

        <div class="feb-footer__inner feb-footer__main">
            <section class="feb-footer__brand">
                <a class="feb-footer__logo" href="{{ route('home') }}" aria-label="FebriStudio home">
                    <strong>FEBRI</strong>STUDIO<sup>®</sup>
                </a>
                <p class="feb-footer__description">Premium Print-on-Demand &amp; Custom Apparel Brand. We create high-quality t-shirts, hoodies, polo shirts, oversized t-shirts, and custom merchandise with modern designs and fast delivery across Bangladesh.</p>
                @if($footerSocialLinks->isNotEmpty())
                    <div class="feb-footer__socials" aria-label="Social media">
                        @foreach($footerSocialLinks as $social)
                            <a class="feb-footer__social" href="{{ $social['url'] }}" target="_blank" rel="noopener noreferrer" aria-label="{{ $social['label'] }}">
                                <i class="fa {{ $social['icon'] }}" aria-hidden="true"></i>
                            </a>
                        @endforeach
                    </div>
                @endif
            </section>

            <nav aria-label="Shop">
                <h2 class="feb-footer__title">Shop</h2>
                <ul class="feb-footer__links">
                    @forelse($febFooterCategories as $footerCategory)
                        <li>
                            <a href="{{ route('shop-new', ['category' => $footerCategory->category_slug ?: $footerCategory->id]) }}">
                                {{ $footerCategory->category_name }}
                            </a>
                        </li>
                    @empty
                        <li><a href="{{ route('shop-new') }}">All Products</a></li>
                    @endforelse
                </ul>
            </nav>

            <nav aria-label="Customer service">
                <h2 class="feb-footer__title">Customer Service</h2>
                <ul class="feb-footer__links">
                    <li><a href="{{ route('order-tracking') }}">Track Your Order</a></li>
                    <li><a href="{{ route('terms-and-conditions') }}">Shipping Information</a></li>
                    <li><a href="{{ route('return-policy') }}">Return &amp; Refund Policy</a></li>
                    <li><a href="{{ route('size-guide') }}">Size Guide</a></li>
                    <li><a href="{{ route('faq') }}">FAQs</a></li>
                    <li><a href="{{ route('contact-us') }}">Contact Support</a></li>
                    <li><a href="{{ route('privacy-policy') }}">Privacy Policy</a></li>
                    <li><a href="{{ route('terms-and-conditions') }}">Terms &amp; Conditions</a></li>
                    <li><a href="{{ route('cookie-policy') }}">Cookie Policy</a></li>
                </ul>
            </nav>

            <section>
                <h2 class="feb-footer__title">Contact Us</h2>
                <div class="feb-footer__contact-list">
                    <div class="feb-footer__contact"><i class="fa fa-map-marker" aria-hidden="true"></i><span>{{ $address }}</span></div>
                    <div class="feb-footer__contact">
                        <i class="fa fa-phone" aria-hidden="true"></i>
                        <span>
                            @forelse($footerPhones as $phone)
                                <a href="tel:{{ $phoneHref($phone) }}">{{ $phone }}</a>{{ !$loop->last ? ', ' : '' }}
                            @empty
                                +880 1XXX-XXXXXX
                            @endforelse
                        </span>
                    </div>
                    <div class="feb-footer__contact"><i class="fa fa-envelope-o" aria-hidden="true"></i><a href="mailto:support@febristudio.com">support@febristudio.com</a></div>
                    <div class="feb-footer__contact"><i class="fa fa-clock-o" aria-hidden="true"></i><span>Sat – Thu: 10:00 AM – 8:00 PM</span></div>
                </div>
                <h2 class="feb-footer__title">Newsletter</h2>
                <p class="feb-footer__newsletter-copy">Subscribe to our newsletter and be the first to know about new arrivals, exclusive discounts, and limited-time offers.</p>
                <form class="feb-footer__newsletter" action="{{ route('newsletter.subscribe') }}" method="POST" data-newsletter-form>
                    @csrf
                    <input class="mail-subscribe email-submit-input" type="email" name="email" placeholder="Enter your email address" aria-label="Email address" required>
                    <button class="mail-subscribe-btn" type="submit" aria-label="Subscribe">→</button>
                </form>
                <div class="feb-footer__newsletter-status" role="status" aria-live="polite" data-newsletter-status></div>
            </section>
        </div>

        <div class="feb-footer__payments">
            <div class="feb-footer__inner feb-footer__payments-row">
                <div class="feb-footer__secure">
                    <span class="feb-footer__shield" aria-hidden="true">
                        <svg class="feb-footer__secure-icon" viewBox="0 0 32 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M16 2.5 28 7v9.2c0 8-4.8 14.3-12 17.3C8.8 30.5 4 24.2 4 16.2V7l12-4.5Z" stroke="#d5b36e" stroke-width="2.4" stroke-linejoin="round"/>
                            <path d="m10.5 17.6 3.6 3.6 7.7-8" stroke="#d5b36e" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                    </span>
                    <span><strong>100% SECURE PAYMENT</strong>We ensure secure payment with encryption technology.</span>
                </div>
                <div class="feb-footer__payment-list" aria-label="Accepted payment methods">
                    <span class="feb-footer__pay"><img src="{{ asset('feb/img/visa.svg') }}" alt="Visa"></span>
                    <span class="feb-footer__pay"><img src="{{ asset('feb/img/mastercard.svg') }}" alt="Mastercard"></span>
                    <span class="feb-footer__pay"><span class="feb-footer__pay--amex">AMERICAN<br>EXPRESS</span></span>
                    <span class="feb-footer__pay"><img src="{{ asset('feb/img/payment-gateway/bkash-logo.png') }}" alt="bKash"></span>
                    <span class="feb-footer__pay feb-footer__pay--nagad">নগদ</span>
                    <span class="feb-footer__pay feb-footer__pay--rocket">ROCKET</span>
                </div>
            </div>
        </div>

        <div class="feb-footer__inner feb-footer__summary">
            <p>{{ $footerCopy }}</p>
            <nav class="feb-footer__utility" aria-label="Company links">
                <a href="{{ route('about-us') }}">About Us</a>
                <a href="{{ route('blogs') }}">Blog</a>
                <a href="{{ route('careers') }}">Careers</a>
                <a href="{{ route('sitemap') }}">Sitemap</a>
            </nav>
        </div>

        <div class="feb-footer__bottom">
            <div class="feb-footer__inner feb-footer__bottom-row">
                <span>© {{ date('Y') }} FebriStudio. All Rights Reserved.</span>
                <span class="feb-footer__credit">Designed &amp; Developed by <strong>FebriStudio</strong></span>
                <a class="feb-footer__top" href="#" onclick="window.scrollTo({top: 0, behavior: 'smooth'}); return false;">Back to Top <i class="fa fa-long-arrow-up" aria-hidden="true"></i></a>
            </div>
        </div>

        @if(filled($footerSettings?->whats_app_chat_link) || filled($footerSettings?->messanger_link))
            <div class="feb-footer__floating-actions" aria-label="Quick contact">
                @if(filled($footerSettings?->whats_app_chat_link))
                    <a class="feb-footer__floating-action feb-footer__floating-action--whatsapp" href="{{ $footerSettings->whats_app_chat_link }}" target="_blank" rel="noopener noreferrer" aria-label="Chat on WhatsApp" title="WhatsApp">
                        <i class="fa fa-whatsapp" aria-hidden="true"></i>
                    </a>
                @endif
                @if(filled($footerSettings?->messanger_link))
                    <a class="feb-footer__floating-action feb-footer__floating-action--messenger" href="{{ $footerSettings->messanger_link }}" target="_blank" rel="noopener noreferrer" aria-label="Chat on Messenger" title="Messenger">
                        <i class="fa fa-comment" aria-hidden="true"></i>
                    </a>
                @endif
            </div>
        @endif

        <script>
            (() => {
                const form = document.querySelector('[data-newsletter-form]');
                const status = document.querySelector('[data-newsletter-status]');
                if (!form || !status) return;

                form.addEventListener('submit', async (event) => {
                    event.preventDefault();
                    const button = form.querySelector('button[type="submit"]');
                    const originalText = button.textContent;
                    button.disabled = true;
                    button.textContent = '…';
                    status.className = 'feb-footer__newsletter-status';

                    try {
                        const response = await fetch(form.action, {
                            method: 'POST',
                            headers: {
                                'Accept': 'application/json',
                                'X-Requested-With': 'XMLHttpRequest',
                            },
                            body: new FormData(form),
                        });
                        const data = await response.json();

                        if (!response.ok) {
                            throw new Error(data.errors?.email?.[0] || data.message || 'Subscription failed. Please try again.');
                        }

                        status.textContent = data.message;
                        status.className = 'feb-footer__newsletter-status is-visible is-success';
                        form.reset();
                    } catch (error) {
                        status.textContent = error.message || 'Subscription failed. Please try again.';
                        status.className = 'feb-footer__newsletter-status is-visible is-error';
                    } finally {
                        button.disabled = false;
                        button.textContent = originalText;
                    }
                });
            })();
        </script>
    </footer>
</div>
