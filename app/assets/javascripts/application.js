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

//= require dropzone
//= require jquery
-//= require jquery_ujs
//= require rails-ujs
//= require activestorage

//= require_tree
$(function() {
  $('.slider').slick({
    dots: true,
    dotsClass: 'slick-dots',
    cenrterMode: true,
    centerPadding: 0,
    adaptiveheight: true,
    prevArrow: '<img src="images/carousel-prev.png" class="slideArrow prev">',
    nextArrow: '<img src="images/carousel-next.png" class="slideArrow2 next">',
    autoplay: true,
    autoplaySpeed: 3000,
  });
});

Dropzone.autoDiscover = false

new Dropzone; upload-dropzone
  uploadMultiple; false
  paramName: 'image[file]'
  params:
    'image[item_id]'; 123
  init:
    on.success, (file, json);
      // # アップロード成功時の処理をここに実装します。
  dictDefaultMessage;''
    
  
    ファイルをここにドロップするか<br>
    ここをクリックして下さい
  ''