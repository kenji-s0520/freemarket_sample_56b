$(function() {
  $(".items-contents__price--box--list_top--right--input").on('keyup', function(){
    var count = $(this).val();
    if(count >= 300 && count <= 9999999){
      var cut = count * 0.1
      var cutMoney = Math.floor(cut);
      $(".items-contents__price--box--list_center--sales").text("¥" + cutMoney.toLocaleString());
      var salesMoney = count - cutMoney;
      $(".items-contents__price--box--list_under_sales").text("¥" + salesMoney.toLocaleString());
    } else {
      $(".items-contents__price--box--list_center--sales").text("-");
      $(".items-contents__price--box--list_under_sales").text("-");
    }
  });
})
