$(document).ready( function(){
  $(function() {
    $(".items-contents__shipping--box--method").hide();
  });
})

$(function() {
  $(".items-shipping_charge").on("change", function(){
    var select = $(".items-shipping_charge").val();
    if(select == "1" || select == "2"){
      $(".items-contents__shipping--box--method").show()
    }else{
      $(".items-contents__shipping--box--method").hide();
    }
  });
})
