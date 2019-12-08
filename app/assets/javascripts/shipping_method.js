$(document).ready( function(){
  $(function() {
    $(".items-contents__shipping--box--method").hide();
  });
})

$(function() {
  $(".items-shipping_charge").on("change", function(){
    var select = $(".items-shipping_charge").val();
        select_html_A = ` <option value="未定">未定
                          <option value="らくらくメルカリ便">らくらくメルカリ便
                          <option value="ゆうメール">ゆうメール
                          <option value="レターパック">レターパック
                          <option value="普通郵便(定型、定形外)">普通郵便(定型、定形外)
                          <option value="クロネコヤマト">クロネコヤマト
                          <option value="ゆうパック">ゆうパック
                          <option value="クリックポスト">クリックポスト
                          <option value="ゆうパケット">ゆうパケット`; 
        
        select_html_B = ` <option value="未定">未定
                          <option value="クロネコヤマト">クロネコヤマト
                          <option value="ゆうパック">ゆうパック
                          <option value="ゆうメール">ゆうメール`;
                      
        select_html_C = ` <option value="---">---`;
                          
      $(".items-contents__shipping--box--method").show()
      $('select.add-items-shipping_method option').remove();
      $('.add-items-shipping_method').append(select_html_C); 
 
    if(select == '送料込み(出品者負担)'){
      $('.add-items-shipping_method').append(select_html_A);
      
    }else if(select == '着払い(購入者負担)'){ 
      $('.add-items-shipping_method').append(select_html_B);

    }else{
      $(".items-contents__shipping--box--method").hide();
    }
  });
})
