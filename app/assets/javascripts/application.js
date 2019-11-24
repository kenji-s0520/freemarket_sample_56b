// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require_tree
//= require jquery
//= require jquery_ujs
// $(function() {
//   $('.slider').slick({
//     dots: true,
//     dotsClass: 'slick-dots',
//     cenrterMode: true,
//     centerPadding: 0,
//     adaptiveheight: true,
//     prevArrow: '<img src="images/carousel-prev.png" class="slideArrow prev">',
//     nextArrow: '<img src="images/carousel-next.png" class="slideArrow2 next">',
//     autoplay: true,
//     autoplaySpeed: 3000,
//   });
// });

// $(function() {
//   $(function(){
//     var cp_slider = "#cp_cssslider"; // スライダー
//     var imagedots = "#image-dots"; // サムネイル画像アイテム
//     $(imagedots).each(function(){
//       var index = 
//     $(imagedots).index(this);
//       $(this).attr("data-index", index);
//     });
//     $(cp_slider).on('init',function(slick){
//       var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
//       $(imagedots+'[data-index="'+index+'"]').addClass("thumbnail-current");
//     });
//     $(cp_slider).slick({
//       arrows: false,
//       infinite: false //これはつけましょう。
//     });
//     $(imagedots).on('click',function(){
//       var index = $(this).attr("data-index");
//       $(cp_slider).slick("slickGoTo",index,false);
//     });
//     $(cp_slider).on('beforeChange',function(event,slick, currentSlide,nextSlide){
//       $(imagedots).each(function(){
//         $(this).removeClass("thumbnail-current");
//       });
//       $(imagedots+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
//     });
//   });


// //     $(cp_slider).slick({
// //       cenrterMode: true,
// //       centerPadding: 0,
// //       adaptiveheight: true,
// //       arrows: false,
// //       // asNavFor: '.image-dots'
// //     });
// //     $(imagedots).slick({
// //       asNavFor: 'cp_slider',
// //       slidesToShow: 4,
// //       focusOnSelect: true,
// //       infinite: false
// //     });
// //     $(imagedots).on( 'mouseenter', function() {
// //       $( this ).click();
// //     });
// //     $(imagedots).on( 'click', 'li', function(e) {
// //       e.preventDefault();
// //     });
// //   });
// // });

$(function(){
  var slider = "#cp_cssslider"; // スライダー
  var thumbnailItem = "#image-dots"; // サムネイル画像アイテム
  
  // サムネイル画像アイテムに data-index でindex番号を付与
  $(thumbnailItem).each(function(){
   var index = $(thumbnailItem).index(this);
   $(this).attr("data-index",index);
  });
  
  // スライダー初期化後、カレントのサムネイル画像にクラス「thumbnail-current」を付ける
  // 「slickスライダー作成」の前にこの記述は書いてください。
  $(slider).on('init',function(slick){
   var index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
   $(thumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
  });

  //slickスライダー初期化  
  $(slider).slick({
    arrows: false,
    infinite: false //これはつけましょう。
  });
  //サムネイル画像アイテムをクリックしたときにスライダー切り替え
  $(thumbnailItem).on('mouseenter',function(){
    var index = $(this).attr("data-index");
    $(slider).slick("slickGoTo",index,false);
    $( this ).click();
  });
  
  $(thumbnailItem).on('click',function(e){
    e.preventDefault();
  });

  //サムネイル画像のカレントを切り替え
  $(slider).on('beforeChange',function(event, slick, currentSlide, nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });
});
