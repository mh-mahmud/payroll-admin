 <header class="mobile-top-nav">
     <div class="top-nav-left">
         <button class="top-nav-btn menu-btn" id="openMobileMenu">
             <i class="fa fa-bars"></i>
         </button>
     </div>

     <div class="top-nav-center">
         <a href="{{ route('home') }}" class="top-nav-logo">
             <img src="{{ $febLogoUrl }}" alt="Site Logo" />
         </a>
     </div>

     <div class="top-nav-right">
         <select class="store-currency-select mobile-currency-select" aria-label="Choose currency">
             <option value="BDT" {{ $febCurrency->code() === 'BDT' ? 'selected' : '' }}>BDT</option>
             <option value="MYR" {{ $febCurrency->code() === 'MYR' ? 'selected' : '' }}>MYR</option>
         </select>
         <button class="top-nav-btn search-btn" id="openSearchModal">
             <i class="fa fa-search"></i>
         </button>
         <a href="{{ route('wishlist') }}" class="top-nav-btn wishlist-btn" id="openWishlistPage">
             <i class="fa fa-heart-o"></i>
             <span class="wishlist-badge" id="wishlistBadge" style="display: none">0</span>
         </a>
     </div>
 </header>

 <div class="mobile-search-modal" id="searchModal">
     <div class="search-modal-header">
         <button class="search-modal-back" id="closeSearchModal">
             <i class="fa fa-arrow-left"></i>
         </button>
         <div class="search-input-wrapper">
             <i class="fa fa-search search-icon"></i>
             <input type="search" id="mobileSearchInput" placeholder="Search products..." autocomplete="off"
                 autofocus />
             <button class="search-clear-btn" id="clearSearch" style="display: none">
                 <i class="fa fa-times"></i>
             </button>
         </div>
     </div>
     <div class="search-suggestions" id="searchSuggestions">
         <div class="search-section recent-searches" id="recentSearches">
             <div class="search-section-header">
                 <span>Recent Searches</span>
                 <button class="clear-recent" id="clearRecentSearches">Clear</button>
             </div>
             <div class="search-section-items" id="recentSearchItems"></div>
         </div>

         <div class="search-section popular-searches">
             <div class="search-section-header">
                 <span>Popular Searches</span>
             </div>
             <div class="search-section-items">
                 <a href="#" class="search-tag">T-Shirt</a>
                 <a href="#" class="search-tag">Polo</a>
                 <a href="#" class="search-tag">Hoodie</a>
                 <a href="#" class="search-tag">Joggers</a>
                 <a href="#" class="search-tag">Kurti</a>
                 <a href="#" class="search-tag">Kids</a>
             </div>
         </div>

         <div class="search-results" id="liveSearchResults" style="display: none"></div>
     </div>
 </div>

 <div class="mobile-side-menu" id="sideMenu">
     <div class="side-menu-header">
         <div class="guest-greeting">
             <span class="welcome-text">{{ Auth::check() ? 'Hello, ' . Auth::user()->first_name : 'Welcome to Fabrilife' }}</span>
             <div class="auth-buttons">
                 @auth
                     <a href="{{ route('wishlist') }}" class="btn-login">Wishlist</a>
                     <a href="{{ route('customer-logout') }}" class="btn-register">Logout</a>
                 @else
                     <a href="{{ route('theme-login') }}" class="btn-login">Login</a>
                     <a href="{{ route('theme-register') }}" class="btn-register">Register</a>
                 @endauth
             </div>
         </div>
         <button class="side-menu-close" id="closeSideMenu">
             <i class="fa fa-times"></i>
         </button>
     </div>

     <div class="side-menu-content">
         <div class="side-menu-section">
             <a href="{{ route('home') }}" class="side-menu-item">
                 <i class="fa fa-home"></i>
                 <span>Home</span>
             </a>
             <a href="{{ route('shop-new') }}" class="side-menu-item">
                 <i class="fa fa-th-large"></i>
                 <span>Shop All</span>
             </a>
             <a href="#" class="side-menu-item highlight">
                 <i class="fa fa-star"></i>
                 <span>New Arrivals</span>
             </a>
             <a href="#"
                 class="side-menu-item highlight free-delivery">
                 <i class="fa fa-truck"></i>
                 <span>Free Delivery</span>
             </a>
             <a href="{{ route('shop-new') }}" class="side-menu-item">
                 <i class="fa fa-fire"></i>
                 <span>Top Selling</span>
             </a>
         </div>

         <div class="side-menu-divider"></div>

         <div class="side-menu-section">
             <div class="side-menu-section-title">Categories</div>
             @foreach($febMenuCategories as $menuCategory)
                 <a href="{{ route('shop-new', ['category' => $menuCategory->category_slug ?: $menuCategory->id]) }}"
                     class="side-menu-item">
                     <i class="fa fa-tags"></i>
                     <span>{{ $menuCategory->category_name }}</span>
                     <i class="fa fa-chevron-right chevron"></i>
                 </a>
             @endforeach
         </div>

         <div class="side-menu-divider"></div>

         <div class="side-menu-section">
             <div class="side-menu-section-title">My Account</div>
             <a href="{{ route('wishlist') }}" class="side-menu-item">
                 <i class="fa fa-heart"></i>
                 <span>My Wishlist</span>
                 <span class="side-menu-badge wishlist-count">0</span>
             </a>
         </div>

         <div class="side-menu-divider"></div>

         <div class="side-menu-section">
             <a href="{{ route('order-tracking') }}" class="side-menu-item">
                 <i class="fa fa-truck"></i>
                 <span>Track Order</span>
             </a>
             <a href="#" class="side-menu-item">
                 <i class="fa fa-phone"></i>
                 <span>Contact Us</span>
             </a>
             <a href="{{ route('outlets') }}" class="side-menu-item">
                 <i class="fa fa-map-marker"></i>
                 <span>Store Locations</span>
             </a>
         </div>
     </div>
 </div>
 <div class="side-menu-overlay" id="sideMenuOverlay"></div>
 <nav class="mobile-bottom-nav" id="mobileBottomNav">
     <a href="#" class="bottom-nav-item active" data-nav="home">
         <div class="nav-icon">
             <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                 <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                 <polyline points="9 22 9 12 15 12 15 22"></polyline>
             </svg>
         </div>
         <span class="nav-label">Home</span>
     </a>

     <button class="bottom-nav-item" id="openCategoryMenu" data-nav="category">
         <div class="nav-icon">
             <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                 <rect x="3" y="3" width="7" height="7"></rect>
                 <rect x="14" y="3" width="7" height="7"></rect>
                 <rect x="14" y="14" width="7" height="7"></rect>
                 <rect x="3" y="14" width="7" height="7"></rect>
             </svg>
         </div>
         <span class="nav-label">Category</span>
     </button>

     <a href="{{ route('theme-carts') }}" class="bottom-nav-item cart-nav-item js-side-cart-open" data-nav="cart">
         <div class="nav-icon cart-icon-wrapper">
             <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                 <circle cx="9" cy="21" r="1"></circle>
                 <circle cx="20" cy="21" r="1"></circle>
                 <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
             </svg>
             <span class="cart-badge" id="cartBadge" style="display: {{ $febCartCount > 0 ? 'flex' : 'none' }}">
                 {{ $febCartCount > 99 ? '99+' : $febCartCount }}
             </span>
         </div>
         <span class="nav-label">Cart</span>
     </a>

     <a href="{{ $febSettings?->whats_app_chat_link ?: ($febSettings?->whats_app_link ?: route('contact-us')) }}" class="bottom-nav-item chat-nav-item" data-nav="whatsapp"
         @if($febSettings?->whats_app_chat_link || $febSettings?->whats_app_link) target="_blank" rel="noopener noreferrer" @endif
         aria-label="Chat on WhatsApp" style="color: #25d366 !important;">
         <div class="nav-icon">
             <svg viewBox="0 0 24 24" fill="#25d366" aria-hidden="true" style="color: #25d366 !important; fill: #25d366 !important;">
                 <path d="M12.04 2a9.84 9.84 0 0 0-8.45 14.88L2.05 22l5.25-1.5A9.95 9.95 0 1 0 12.04 2Zm0 17.98a8 8 0 0 1-4.08-1.12l-.29-.17-3.11.89.91-3.02-.19-.31a7.92 7.92 0 1 1 6.76 3.73Zm4.39-5.93c-.24-.12-1.42-.7-1.64-.78-.22-.08-.38-.12-.54.12-.16.24-.62.78-.76.94-.14.16-.28.18-.52.06-.24-.12-1.01-.37-1.93-1.19a7.27 7.27 0 0 1-1.33-1.66c-.14-.24-.01-.37.1-.49.11-.11.24-.28.36-.42.12-.14.16-.24.24-.4.08-.16.04-.3-.02-.42-.06-.12-.54-1.3-.74-1.78-.2-.47-.4-.41-.54-.42h-.46c-.16 0-.42.06-.64.3-.22.24-.84.82-.84 2s.86 2.32.98 2.48c.12.16 1.69 2.58 4.09 3.62.57.25 1.02.39 1.37.5.58.18 1.1.16 1.51.1.46-.07 1.42-.58 1.62-1.14.2-.56.2-1.04.14-1.14-.06-.1-.22-.16-.46-.28Z"/>
             </svg>
         </div>
         <span class="nav-label" style="color: #25d366 !important;">WhatsApp</span>
     </a>

     <a href="{{ Auth::check() ? (in_array(Auth::user()->user_type, ['admin', 'agent'], true) ? route('dashboard') : route('customer-dashboard')) : route('theme-login') }}"
         class="bottom-nav-item" data-nav="account" aria-label="{{ Auth::check() ? 'Open account' : 'Login' }}">
         <div class="nav-icon">
             <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                 <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                 <circle cx="12" cy="7" r="4"></circle>
             </svg>
         </div>
         <span class="nav-label">{{ Auth::check() ? 'Account' : 'Login' }}</span>
     </a>
 </nav>

 <style>
     .desktop-currency-picker {
         position: relative;
         display: inline-block;
         align-self: center;
         width: auto;
         min-width: 0;
         margin-right: 4px;
     }
     .desktop-currency-trigger {
         display: flex;
         min-width: 112px;
         height: 42px;
         align-items: center;
         justify-content: space-between;
         gap: 8px;
         border: 1px solid #e2e5e9;
         border-radius: 7px;
         background: #fff;
         padding: 5px 9px;
         color: #222f3f;
         cursor: pointer;
         transition: border-color .18s ease, box-shadow .18s ease;
     }
     .desktop-currency-trigger:hover,
     .desktop-currency-picker.is-open .desktop-currency-trigger {
         border-color: #222f3f;
         box-shadow: 0 3px 12px rgba(34, 47, 63, .10);
     }
     .desktop-currency-trigger-copy { display: flex; min-width: 0; flex-direction: column; text-align: left; line-height: 1.15; }
     .desktop-currency-country {
         color: #4b5563;
         font-size: 9px;
         font-weight: 500;
         white-space: nowrap;
     }
     .desktop-currency-current { margin-top: 2px; font-size: 11px; font-weight: 800; white-space: nowrap; }
     .desktop-currency-trigger .fa { font-size: 10px; transition: transform .18s ease; }
     .desktop-currency-picker.is-open .desktop-currency-trigger .fa { transform: rotate(180deg); }
     .desktop-currency-menu {
         position: absolute;
         top: calc(100% + 7px);
         right: 0;
         z-index: 10050;
         display: none;
         width: 178px;
         overflow: hidden;
         border: 1px solid #e5e7eb;
         border-radius: 8px;
         background: #fff;
         padding: 5px;
         box-shadow: 0 12px 30px rgba(15, 23, 42, .16);
     }
     .desktop-currency-picker.is-open .desktop-currency-menu { display: block; }
     .desktop-currency-option {
         display: flex;
         width: 100%;
         align-items: center;
         gap: 9px;
         border: 0;
         border-radius: 6px;
         background: transparent;
         padding: 8px;
         color: #222f3f;
         text-align: left;
         cursor: pointer;
     }
     .desktop-currency-option:hover { background: #f3f5f7; }
     .desktop-currency-option.is-selected { background: #edf5ff; color: #0969da; }
     .desktop-currency-flag { font-size: 17px; line-height: 1; }
     .desktop-currency-option-copy { display: flex; flex: 1; flex-direction: column; line-height: 1.2; }
     .desktop-currency-option-copy strong { font-size: 11px; }
     .desktop-currency-option-copy small { margin-top: 2px; color: #6b7280; font-size: 9px; }
     .desktop-currency-check { font-size: 10px; opacity: 0; }
     .desktop-currency-option.is-selected .desktop-currency-check { opacity: 1; }
     .mobile-currency-select {
         border: 0;
         outline: 0;
         background: transparent;
         color: inherit;
         font-size: 12px;
         font-weight: 700;
         cursor: pointer;
     }
     .mobile-currency-select {
         max-width: 58px;
         padding: 4px 1px;
         color: #222f3f;
     }
     @media (min-width: 992px) and (max-width: 1199px) {
         .desktop-header-myntra .nav-category-link { padding-inline: 9px; }
     }
 </style>

 <script>
 document.addEventListener('DOMContentLoaded', function () {
     const locationBlock = document.querySelector('[data-delivery-location]');
     if (!locationBlock || locationBlock.dataset.countryHeader === '1') return;

     let isBangladesh = false;
     try {
         const timezone = Intl.DateTimeFormat().resolvedOptions().timeZone || '';
         const languages = (navigator.languages || [navigator.language || '']).join(',').toLowerCase();
         isBangladesh = timezone === 'Asia/Dhaka' || languages.includes('bn-bd');
     } catch (error) {
         isBangladesh = false;
     }

     const country = locationBlock.querySelector('[data-delivery-country]');
     if (country) country.textContent = isBangladesh ? 'Bangladesh' : 'Malaysia';
 });
 </script>
 <div class="mobile-mega-menu" id="megaMenu">
     <div class="mega-menu-backdrop" id="megaMenuBackdrop"></div>

     <div class="mega-menu-container">
         <div class="mega-menu-handle">
             <div class="handle-bar"></div>
         </div>

         <div class="mega-menu-header">
             <h3 class="mega-menu-title" id="megaMenuTitle">Shop by Category</h3>
             <button class="mega-menu-close" id="closeMegaMenu">
                 <i class="fa fa-times"></i>
             </button>
         </div>

         <div class="mega-menu-content">
             <div class="mega-menu-view" id="mainCategoriesView">
                 <div class="mega-menu-section quick-links">
                     <a href="#"
                         class="quick-link-card new-arrival">
                         <i class="fa fa-star"></i>
                         <span>New Arrivals</span>
                     </a>
                     <a href="#"
                         class="quick-link-card top-selling">
                         <i class="fa fa-fire"></i>
                         <span>Top Selling</span>
                     </a>

                     <a href="#"
                         class="quick-link-card free-delivery">
                         <i class="fa fa-truck"></i>
                         <span>Free Delivery</span>
                     </a>
                 </div>

                 <div class="mega-menu-section category-list">
                     <div class="section-title">All Categories</div>

                     @foreach($febMenuCategories as $menuCategory)
                         <a href="{{ route('shop-new', ['category' => $menuCategory->category_slug ?: $menuCategory->id]) }}"
                             class="category-item main-category" style="text-decoration: none;">
                             <div class="category-icon all">
                                 <i class="fa fa-tags"></i>
                             </div>
                             <div class="category-info">
                                 <span class="category-name">{{ $menuCategory->category_name }}</span>
                                 <span class="category-count">
                                     {{ $menuCategory->children->isNotEmpty() ? $menuCategory->children->count() . ' subcategories' : 'View products' }}
                                 </span>
                             </div>
                             <i class="fa fa-chevron-right"></i>
                         </a>
                     @endforeach
                 </div>
             </div>
         </div>
     </div>
 </div>

 <header class="desktop-header-myntra">
     <div class="desktop-header-inner">
         <div class="header-logo">
             <a href="{{ route('home') }}">
                 <img src="{{ $febLogoUrl }}" alt="Site Logo" />
             </a>
         </div>

         <nav class="header-nav-main">
             <ul class="nav-category-list">
                 @foreach($febMenuCategories as $menuCategory)
                     @php
                         $menuCategoryValue = $menuCategory->category_slug ?: $menuCategory->id;
                     @endphp
                     <li class="nav-category-item" data-category="category-{{ $menuCategory->id }}">
                         <span class="nav-category-link"
                             data-href="{{ route('shop-new', ['category' => $menuCategoryValue]) }}">
                             {{ $menuCategory->category_name }}
                         </span>
                         @if($menuCategory->children->isNotEmpty() || $menuCategory->menuProducts->isNotEmpty())
                             <div class="mega-menu">
                                 <div class="mega-menu-inner">
                                     <div class="mega-menu-categories">
                                         <div class="mega-menu-column">
                                             <h4 class="mega-menu-heading">
                                                 <a href="{{ route('shop-new', ['category' => $menuCategoryValue]) }}">
                                                     {{ $menuCategory->category_name }}
                                                 </a>
                                             </h4>
                                             <ul class="mega-menu-links">
                                                 @foreach($menuCategory->children as $menuSubcategory)
                                                     <li>
                                                         <a href="{{ route('shop-new', ['category' => $menuSubcategory->category_slug ?: $menuSubcategory->id]) }}">
                                                             {{ $menuSubcategory->category_name }}
                                                         </a>
                                                     </li>
                                                 @endforeach
                                             </ul>
                                         </div>
                                     </div>

                                     @if($menuCategory->menuProducts->isNotEmpty())
                                         <div class="mega-menu-products">
                                             <h4 class="mega-menu-products-heading">New Arrivals</h4>
                                             <div class="mega-menu-products-grid">
                                                 @foreach($menuCategory->menuProducts as $menuProduct)
                                                     <a href="{{ route('single-product', $menuProduct->slug) }}"
                                                         class="mega-menu-product-card"
                                                         title="{{ $menuProduct->name }}">
                                                         <div class="mega-menu-product-image">
                                                             <img src="{{ \App\Support\MediaStorage::url($menuProduct->img_path, 'products') }}"
                                                                 alt="{{ $menuProduct->name }}" loading="lazy">
                                                         </div>
                                                         <div class="mega-menu-product-info">
                                                             <div class="mega-menu-product-title">{{ $menuProduct->name }}</div>
                                                         </div>
                                                     </a>
                                                 @endforeach
                                             </div>
                                         </div>
                                     @endif

                                     <div class="mega-menu-view-all">
                                         <a href="{{ route('shop-new', ['category' => $menuCategoryValue]) }}">
                                             View All {{ $menuCategory->category_name }} <span aria-hidden="true">&rarr;</span>
                                         </a>
                                     </div>
                                 </div>
                             </div>
                         @endif
                     </li>
                 @endforeach
             </ul>
         </nav>

         <div class="header-search">
             <form action="{{ route('shop-new') }}" class="header-search-form" method="GET">
                 <i class="fa fa-search header-search-icon"></i>
                 <input type="text" name="query" class="header-search-input alg-search-box"
                     placeholder="Search" autocomplete="off" />
                 <button type="submit" class="header-search-btn">
                     <i class="fa fa-search"></i>
                 </button>
             </form>
         </div>

         <div class="header-actions">
             <div class="desktop-currency-picker" data-currency-picker>
                 <button type="button" class="desktop-currency-trigger" aria-haspopup="listbox" aria-expanded="false">
                     <span class="desktop-currency-trigger-copy">
                         <span class="desktop-currency-country" data-delivery-country>{{ $febCurrency->code() === 'BDT' ? 'Bangladesh' : 'Malaysia' }}</span>
                         <span class="desktop-currency-current" data-currency-current>{{ $febCurrency->symbol() }} {{ $febCurrency->code() }}</span>
                     </span>
                     <i class="fa fa-chevron-down" aria-hidden="true"></i>
                 </button>
                 <div class="desktop-currency-menu" role="listbox">
                     <button type="button" class="desktop-currency-option" data-currency-option="BDT" role="option">
                         <span class="desktop-currency-flag">🇧🇩</span>
                         <span class="desktop-currency-option-copy"><strong>৳ BDT</strong><small>Bangladeshi Taka</small></span>
                         <i class="fa fa-check desktop-currency-check" aria-hidden="true"></i>
                     </button>
                     <button type="button" class="desktop-currency-option" data-currency-option="MYR" role="option">
                         <span class="desktop-currency-flag">🇲🇾</span>
                         <span class="desktop-currency-option-copy"><strong>RM MYR</strong><small>Malaysian Ringgit</small></span>
                         <i class="fa fa-check desktop-currency-check" aria-hidden="true"></i>
                     </button>
                 </div>
             </div>
             <a href="{{ route('outlets') }}" class="header-action-item">
                 <span class="header-action-icon">
                     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2">
                         <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                         <circle cx="12" cy="10" r="3"></circle>
                     </svg>
                 </span>
                 <span class="header-action-label">Stores</span>
             </a>

             <div class="header-action-item has-dropdown">
                 <span class="header-action-icon">
                     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2">
                         <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                         <circle cx="12" cy="7" r="4"></circle>
                     </svg>
                 </span>
                 <span class="header-action-label">Profile</span>

                 <div class="header-profile-dropdown">
                     <div class="profile-dropdown-header">
                         <div class="welcome-text">{{ Auth::check() ? 'Hello, ' . Auth::user()->first_name : 'Welcome' }}</div>
                         <div class="login-signup">
                             @auth
                                 <a href="{{ route('customer-dashboard') }}">My Account</a>
                                 <span>/</span>
                                 <a href="{{ route('customer-logout') }}">Logout</a>
                             @else
                                 <a href="{{ route('theme-login') }}">Sign in</a>
                                 <span>/</span>
                                 <a href="{{ route('theme-register') }}">Sign up</a>
                             @endauth
                         </div>
                     </div>
                     <div class="profile-dropdown-links">
                         <a href="{{ route('order-tracking') }}"><i class="fa fa-truck"></i>Track Order</a>
                         <a href="#"><i class="fa fa-building"></i>Corporate Sales</a>
                         <a href="#"><i class="fa fa-info-circle"></i>About Us</a>
                     </div>
                 </div>
             </div>

             <a href="{{ route('wishlist') }}" class="header-action-item">
                 <span class="header-action-icon">
                     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2">
                         <path
                             d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                         </path>
                     </svg>
                 </span>
                 <span class="header-action-label">Wishlist</span>
             </a>

             <a href="{{ route('theme-carts') }}" class="header-action-item js-side-cart-open">
                 <span class="header-action-icon">
                     <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2">
                         <path d="M6 6h15l-1.5 9h-12z"></path>
                         <circle cx="9" cy="20" r="1"></circle>
                         <circle cx="18" cy="20" r="1"></circle>
                         <path d="M6 6L4 2H1"></path>
                     </svg>
                     <span class="header-cart-badge shopping-cart-badge"
                         style="display: {{ $febCartCount > 0 ? 'flex' : 'none' }}">{{ $febCartCount > 99 ? '99+' : $febCartCount }}</span>
                 </span>
                 <span class="header-action-label">Bag</span>
             </a>
         </div>
     </div>
 </header>

 <script>
     document.addEventListener("DOMContentLoaded", function() {
         var activeCurrency = window.storeCurrency && window.storeCurrency.code === 'MYR' ? 'MYR' : 'BDT';

         function saveCurrency(currency) {
             document.cookie = 'store_currency=' + currency + ';path=/;max-age=31536000;SameSite=Lax';
             window.location.reload();
         }

         document.querySelectorAll('.store-currency-select').forEach(function(select) {
             select.value = activeCurrency;
             select.addEventListener('change', function() {
                 var currency = this.value === 'MYR' ? 'MYR' : 'BDT';
                 saveCurrency(currency);
             });
         });

         var currencyPicker = document.querySelector('[data-currency-picker]');
         if (currencyPicker) {
             var currencyTrigger = currencyPicker.querySelector('.desktop-currency-trigger');
             var currencyCurrent = currencyPicker.querySelector('[data-currency-current]');
             var currencyOptions = currencyPicker.querySelectorAll('[data-currency-option]');

             currencyCurrent.textContent = activeCurrency === 'BDT' ? '৳ BDT' : 'RM MYR';
             currencyOptions.forEach(function(option) {
                 var selected = option.getAttribute('data-currency-option') === activeCurrency;
                 option.classList.toggle('is-selected', selected);
                 option.setAttribute('aria-selected', selected ? 'true' : 'false');
                 option.addEventListener('click', function() {
                     var currency = option.getAttribute('data-currency-option');
                     currencyPicker.classList.remove('is-open');
                     if (currency !== activeCurrency) saveCurrency(currency);
                 });
             });

             currencyTrigger.addEventListener('click', function(event) {
                 event.stopPropagation();
                 var isOpen = currencyPicker.classList.toggle('is-open');
                 currencyTrigger.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
             });
             document.addEventListener('click', function(event) {
                 if (!currencyPicker.contains(event.target)) {
                     currencyPicker.classList.remove('is-open');
                     currencyTrigger.setAttribute('aria-expanded', 'false');
                 }
             });
         }

         var deliveryCountry = document.querySelector('[data-delivery-country]');
         if (deliveryCountry && window.storeCurrency) {
             deliveryCountry.textContent = activeCurrency === 'BDT' ? 'Bangladesh' : 'Malaysia';
         }

         // Handle click on nav category links (spans with data-href)
         document
             .querySelectorAll(".nav-category-link[data-href]")
             .forEach(function(span) {
                 span.addEventListener("click", function(e) {
                     var href = this.getAttribute("data-href");
                     if (href) {
                         window.location.href = href;
                     }
                 });
             });
     });
 </script>

 <div class="mobile-toast-container" id="toastContainer"></div>

 <nav class="navbar navbar-light nav-menu-home nav-menu-home-mobile">
     <div class="no-style-link head-nav-link pull-left"
         style="
          margin: 0px 7px 0px 7px;
          font-size: 20px;
          border-right: 1px solid #efefef;
          padding-right: 15px;
          line-height: 53px;
        "
         onclick="toggleMobileSidebar(this)" data-open="true">
         <img src="{{ asset('feb/img/menu_icon.png') }}" style="width: 20px" class="menu-img-ref" />
     </div>
     <a class="no-style-link" href="{{ route('home') }}">
         <img src="{{ $febLogoUrl }}" alt="Site Logo" class="nav-logo mobile-logo"
             style="display: inline; margin-top: -6px" />
     </a>
     <div class="head-nav-link pull-right open-mobile-link" style="margin: -3px 14px 0px 7px; font-size: 17px"
         href="#">
         <i class="fa fa-chevron-down"></i>
         <i class="fa fa-chevron-up list-hidden"></i>
     </div>
     <a class="no-style-link head-nav-link pull-right js-side-cart-open" style="margin: -3px 14px 0px 7px; font-size: 17px"
         href="{{ route('theme-carts') }}">
         <i class="fa fa-shopping-cart"></i>
         <span class="badge badge-primary shopping-cart-badge"
             style="font-size: 0.6rem; font-weight: bold; margin-left: 0; display: {{ $febCartCount > 0 ? 'inline-block' : 'none' }}">
             {{ $febCartCount > 99 ? '99+' : $febCartCount }}
         </span>
     </a>

     <a class="no-style-link head-nav-link pull-right"
         style="margin: -2px 14px 0px 7px; font-size: 16px; position: relative" href="{{ route('wishlist') }}">
         <i class="fa fa-heart-o" style="font-weight: bold"></i>
         <span class="badge badge-primary wishlist-badge-mobile" id="wishlistBadgeMobile"
             style="
            font-size: 0.5rem;
            font-weight: bold;
            position: absolute;
            top: -8px;
            right: -10px;
            display: none;
            background: #e74c3c;
          ">0</span>
     </a>
     <a class="no-style-link head-nav-link pull-right"
         style="margin: -3px 14px 0px 7px; font-size: 17px; padding-top: 0px" href="#"
         onclick="search_toggle()">
         <i class="fa fa-search"></i>
     </a>
     <div id="search-home-mobile" class="search-home-mobile">
         <form action="{{ route('shop-new') }}" class="mobile-search-bar" type="GET">
             <input class="nav-text-input alg-search-box form-control" type="text" name="query"
                 placeholder="Search Products by Titles or Tags" />
             <button style="display: none" type="submit" class="newhome-search">
                 <i class="fa fa-search"></i>
             </button>
         </form>
     </div>
 </nav>
 <aside class="mobile-nav-sidebar">
     <div class="aside-refinement refinement-area">
         <div class="aside-refinement-box">
             <div id="aside-current-refinements-layout"></div>
             <div id="aside-clear-refinements-layout"></div>
         </div>
     </div>
     <div class="cat-header">Categories</div>
     <div class="menu-cats-layout">
         @foreach($febMenuCategories as $menuCategory)
             <a class="side-menu-item"
                 href="{{ route('shop-new', ['category' => $menuCategory->category_slug ?: $menuCategory->id]) }}">
                 <i class="fa fa-tags"></i>
                 <span>{{ $menuCategory->category_name }}</span>
             </a>
         @endforeach
     </div>
 </aside>
 <div class="mobile-login-opener">
     <a class="no-style-link head-nav-link mobile-nav-link" href="{{ Auth::check() ? route('customer-dashboard') : route('theme-login') }}">
         <div class="pull-left">
             <div class="row" style="font-size: 1rem; font-weight: bold">
                 {{ Auth::check() ? Auth::user()->first_name : 'Login' }}
             </div>
             <div class="row" style="font-size: 0.9rem; color: #aaaaaa">
                 {{ Auth::check() ? 'View Your Account' : 'Enter Your Account' }}
             </div>
         </div>
     </a>
     <a class="no-style-link head-nav-link mobile-nav-link dark" href="{{ route('order-tracking') }}">
         <div class="pull-left">
             <div class="row" style="font-size: 1rem; font-weight: bold">
                 Track Order
             </div>
             <div class="row" style="font-size: 0.9rem; color: #aaaaaa">
                 Know Your Order Status
             </div>
         </div>
     </a>
 </div>
 <nav class="navbar navbar-light nav-menu-home nav-menu-desktop">
     <div
         style="
          width: calc(100% + 20px);
          height: 35px;
          background: #f3f3f3;
          line-height: 35px;
          margin-left: -10px;
        ">
         <div class="col-lg-4">
             <a style="color: white; text-decoration: none"
                 href="#">
                 <div
                     style="
                background: #000;
                color: #fff;
                text-align: left;
                font-size: 0.9rem;
                font-weight: bold;
                display: table;
                margin-left: -15px;
                padding-right: 15px;
                padding-left: 15px;
              ">
                     <img style="height: 30px" src="{{ asset('feb/img/menu_icon.png') }}" />EXCLUSIVE
                     FALL COLLECTION &nbsp;<i class="fa fa-arrow-circle-right"></i>&nbsp;
                 </div>
             </a>
         </div>
         <div class="col-lg-2 text-center">
             <a style="color: white; text-decoration: none" href="{{ route('order-tracking') }}">
                 <div
                     style="
                background: #000;
                color: #ffffff;
                width: 100%;
                font-size: 0.8rem;
              ">
                     <i class="fa fa-truck" aria-hidden="true"></i>
                     <span> Corporate Sales </span>
                 </div>
             </a>
         </div>
         <div class="col-lg-2 text-center">
             <a style="color: white; text-decoration: none" href="{{ route('outlets') }}">
                 <div style="
                background: #000;
                color: #ffffff;
                width: 100%;
                font-size: 0.8rem;
                cursor: pointer;
              "
                     class="regiontoggle">
                     <i class="fa fa-map-marker" aria-hidden="true"></i> &nbsp;
                     <span> Store Locations </span>
                 </div>
             </a>
         </div>
         <div class="col-lg-2 text-center small-text" style="padding: 0px">
             <i class="fa fa-question-circle" aria-hidden="true"></i>
             <a style="color: #000" href="#">About Us</a>
         </div>
         <div class="col-lg-2 fab-account text-center small-text" style="padding: 0px"
             onmouseover="accountHover()" onmouseout="accountHoverOut()">
             <a href="{{ Auth::check() ? route('customer-dashboard') : route('theme-login') }}"><i class="fa fa-sign-in" aria-hidden="true"></i> {{ Auth::check() ? Auth::user()->first_name : 'Login' }}</a>
             <ul id="account_ul" class="account_ul">
                 @auth
                     <li class="account_li"><a class="account-item" href="{{ route('customer-dashboard') }}">My Account</a></li>
                     <li class="account_li"><a class="account-item" href="{{ route('customer-logout') }}">Logout</a></li>
                 @else
                     <li class="account_li"><a class="account-item" href="{{ route('theme-login') }}">Login</a></li>
                     <li class="account_li"><a class="account-item" href="{{ route('theme-register') }}">Register</a></li>
                 @endauth
                 <li class="account_li">
                     <a class="account-item" href="{{ route('order-tracking') }}">Order Tracking</a>
                 </li>
             </ul>
         </div>
     </div>
     <div style="width: 100%; height: 85px; line-height: 85px">
         <div class="col-lg-2" style="padding: 0px; text-align: center">
             <a class="no-style-link" href="{{ route('home') }}">
                 <img src="{{ $febLogoUrl }}" alt="Site Logo" class="nav-logo"
                     style="
                width: 180px;
                height: auto;
                vertical-align: middle;
                max-width: 100%;
              " />
             </a>
         </div>
         <div class="col-lg-2 text-center jas-menu" style="line-height: 85px">
             <a class="no-style-link head-nav-link" href="{{ route('wishlist') }}">
                 <div class="row" style="font-size: 1.1rem; font-weight: bold">
                     Shop
                     <div style="display: inline">
                         <svg focusable="false" viewBox="0 0 16 14" width="10" height="10"
                             xmlns="http://www.w3.org/2000/svg">
                             <path fill-rule="evenodd" clip-rule="evenodd"
                                 d="M.116 4.884l1.768-1.768L8 9.232l6.116-6.116 1.768 1.768L8 12.768.116 4.884z"></path>
                         </svg>
                     </div>
                 </div>
             </a>
             <ul class="sub-menu">
                 @foreach($febMenuCategories as $menuCategory)
                     <li class="menu-item {{ $menuCategory->children->isNotEmpty() ? 'menu-item-has-children sub-column-item' : '' }}">
                         <a href="{{ route('shop-new', ['category' => $menuCategory->category_slug ?: $menuCategory->id]) }}">
                             {{ $menuCategory->category_name }}
                         </a>
                         @if($menuCategory->children->isNotEmpty())
                             <ul class="sub-column">
                                 @foreach($menuCategory->children as $menuSubcategory)
                                     <li class="menu-item">
                                         <a href="{{ route('shop-new', ['category' => $menuSubcategory->category_slug ?: $menuSubcategory->id]) }}">
                                             {{ $menuSubcategory->category_name }}
                                         </a>
                                     </li>
                                 @endforeach
                             </ul>
                         @endif
                     </li>
                 @endforeach
             </ul>
         </div>
         <div class="col-lg-6">
             <form action="{{ route('shop-new') }}" class="nav-search-bar" type="GET">
                 <input class="nav-text-input alg-search-box form-control" type="text" name="query"
                     placeholder="Search Products by Titles or Tags" />
                 <button type="submit" class="newhome-search">
                     <i class="fa fa-search"></i>
                 </button>
             </form>
         </div>
         <div class="col-lg-2 text-right" style="font-size: 1.5rem; padding: 0px">
             <div class="col-lg-6" style="position: relative">
                 <a class="no-style-link head-nav-link" style="position: absolute; top: 0; left: 0"
                     href="#">
                     <i class="fa fa-heart-o"></i>
                     <span class="badge badge-primary wishlist-badge-desktop" id="wishlistBadgeDesktop"
                         style="
                  font-size: 0.5rem;
                  font-weight: bold;
                  position: absolute;
                  top: -5px;
                  right: -8px;
                  display: none;
                  background: #e74c3c;
                ">0</span>
                 </a>
             </div>
             <div class="col-lg-6" style="position: relative">
                 <a class="no-style-link head-nav-link js-side-cart-open" style="position: absolute; top: 0; right: 0"
                     href="{{ route('theme-carts') }}">
                     <i class="fa fa-shopping-cart"></i>
                     <span class="badge badge-primary shopping-cart-badge"
                         style="font-size: 0.6rem; font-weight: bold; margin-left: 0; display: {{ $febCartCount > 0 ? 'inline-block' : 'none' }}">
                         {{ $febCartCount > 99 ? '99+' : $febCartCount }}
                     </span>
                 </a>
             </div>
         </div>
     </div>
 </nav>
