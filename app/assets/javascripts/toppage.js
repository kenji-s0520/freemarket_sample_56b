$(function() {
  $('.slider').slick({
    dots: true,
    dotsClass: 'slick-dots',
    cenrterMode: true,
    centerPadding: 0,
    adaptiveheight: true,
    prevArrow: '<img src="/images/carousel-prev.png" class="slideArrow prev">',
    nextArrow: '<img src="/images/carousel-next.png" class="slideArrow2 next">',
    autoplay: true,
    autoplaySpeed: 3000,
  });
});
