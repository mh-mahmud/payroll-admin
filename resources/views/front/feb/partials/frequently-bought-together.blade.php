@if($frequentlyBoughtProducts->isNotEmpty())
    <section class="frequently-bought-together {{ $class ?? '' }}" aria-labelledby="frequently-bought-title-{{ $instance }}">
        <h5 class="tiny-margin" id="frequently-bought-title-{{ $instance }}">Frequently Bought Together</h5>
        <hr>

        <div class="frequently-bought-list">
            @foreach($frequentlyBoughtProducts as $frequentlyBoughtProduct)
                @php
                    $frequentlyBoughtHasDiscount = $frequentlyBoughtProduct->discount_price > 0
                        && $frequentlyBoughtProduct->discount_price < $frequentlyBoughtProduct->product_value;
                    $frequentlyBoughtPrice = $frequentlyBoughtHasDiscount
                        ? $frequentlyBoughtProduct->discount_price
                        : $frequentlyBoughtProduct->product_value;
                    $frequentlyBoughtInStock = $frequentlyBoughtProduct->stock_status !== 'Out of Stock'
                        && (int) $frequentlyBoughtProduct->stock_quantity > 0;
                    $frequentlyBoughtUrl = route(
                        'single-product',
                        $frequentlyBoughtProduct->slug ?: $frequentlyBoughtProduct->id
                    );
                    $frequentlyBoughtImage = \App\Support\MediaStorage::url(
                        $frequentlyBoughtProduct->img_path,
                        'products'
                    );
                @endphp

                <article class="frequently-bought-card">
                    <a class="frequently-bought-image product-link" href="{{ $frequentlyBoughtUrl }}">
                        <img src="{{ $frequentlyBoughtImage }}" alt="{{ $frequentlyBoughtProduct->name }}" loading="lazy">
                    </a>

                    <div class="frequently-bought-content">
                        <a class="frequently-bought-name product-link" href="{{ $frequentlyBoughtUrl }}">
                            {{ $frequentlyBoughtProduct->name }}
                        </a>
                        <div class="frequently-bought-price">
                            <strong>{{ $febCurrency->format($frequentlyBoughtPrice) }}</strong>
                            @if($frequentlyBoughtHasDiscount)
                                <strike>{{ $febCurrency->format($frequentlyBoughtProduct->product_value) }}</strike>
                            @endif
                        </div>
                        <button type="button" class="related-add-cart btn btn-black btn-sm"
                            data-product-id="{{ $frequentlyBoughtProduct->id }}"
                            data-title="{{ $frequentlyBoughtProduct->name }}"
                            data-image="{{ $frequentlyBoughtImage }}"
                            data-stock="{{ max(0, (int) $frequentlyBoughtProduct->stock_quantity) }}"
                            data-colors="{{ $frequentlyBoughtProduct->productColors->map(fn ($color) => ['id' => $color->id, 'name' => $color->name, 'hex_code' => $color->hex_code])->values()->toJson() }}"
                            data-sizes="{{ $frequentlyBoughtProduct->productSizes->map(fn ($size) => ['id' => $size->id, 'name' => $size->name])->values()->toJson() }}"
                            {{ $frequentlyBoughtInStock ? '' : 'disabled' }}>
                            <i class="fa fa-plus"></i>&nbsp;
                            {{ $frequentlyBoughtInStock ? 'Add to Cart' : 'Out of Stock' }}
                        </button>
                    </div>
                </article>
            @endforeach
        </div>
    </section>
@endif
