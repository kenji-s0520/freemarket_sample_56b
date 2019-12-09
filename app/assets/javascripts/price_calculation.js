var keisan = function(){
  var count = $(".items-contents__price--box--list_top--right--input").val();
  var center = $(".items-contents__price--box--list_center--sales");
  var sales = $(".items-contents__price--box--list_under_sales");
  if(count >= 300 && count <= 9999999){
    var cut = count * 0.1
    var cutMoney = Math.floor(cut);
    center.text("¥" + cutMoney.toLocaleString());
    var salesMoney = count - cutMoney;
    sales.text("¥" + salesMoney.toLocaleString());
  } else {
    center.text("-");
    selles.text("-");
  }
};

$(function() {
  keisan();
  $(".items-contents__price--box--list_top--right--input").on('keyup', keisan);
});

