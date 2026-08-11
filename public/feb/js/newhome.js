/**
 * Newhome.js - Homepage JavaScript utilities
 * Created: 2026-01-18
 *
 * Provides carousel functionality for homepage
 */

/**
 * Initialize a slick carousel with responsive settings
 * @param {string} item_name - The class name of the carousel container
 */
function carousel_sleek(item_name) {
    if (typeof $.fn.slick === 'undefined') {
        console.warn('Slick carousel not loaded');
        return;
    }

    var $carousel = $('.' + item_name);
    var isPartnerCarousel = $carousel.is('#print_type_carousel');

    $carousel.slick({
        dots: false,
        infinite: true,
        speed: 300,
        slidesToShow: isPartnerCarousel ? 8 : 4,
        slidesToScroll: 1,
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                    slidesToShow: isPartnerCarousel ? 5 : 3,
                    slidesToScroll: isPartnerCarousel ? 2 : 3,
                    infinite: true,
                    dots: !isPartnerCarousel
                }
            },
            {
                breakpoint: 600,
                settings: {
                    slidesToShow: isPartnerCarousel ? 3 : 2,
                    slidesToScroll: isPartnerCarousel ? 1 : 2
                }
            },
            {
                breakpoint: 480,
                settings: {
                    slidesToShow: isPartnerCarousel ? 3 : 1,
                    slidesToScroll: 1
                }
            }
        ]
    });
}

// Initialize on document ready
$(document).ready(function() {
    // Any homepage-specific initialization can go here
});
