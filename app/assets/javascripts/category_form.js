$(document).ready( function(){
  $(function() {
    $(".items-contents__item-about--box--size").hide();
    $(".items-contents__item-about--box--brand").hide();
  });
})

$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='items-contents__item-about--box--category1' id= 'children_wrapper'>
                          <select class="items-contents__item-about--box--category1" id="child_category">
                            <option value="0" data-category="0">---</option>
                            ${insertHTML}
                          <select>
                          <i id='fas' class='fas fa-chevron-down'></i>
                        </div>
                      </div>`;
    $('.items-contents__item-about--box--category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='items-contents__item-about--box--category2' id= 'grandchildren_wrapper'>
                              <select class="items-contents__item-about--box--category2" id="grandchild_category" name="item[category_id]">
                                <option value="0" data-category="0">---</option>
                                ${insertHTML}
                              </select>
                              <i id='fas2' class='fas fa-chevron-down'></i>
                            </div>
                          </div>`;
    $('.items-contents__item-about--box--category1').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
        $('.items-contents__item-about--box--category1').remove();
        $('.items-contents__item-about--box--category2').remove();
        $(".items-contents__item-about--box--size").hide();
        $(".items-contents__item-about--box--brand").hide();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchildren_wrapper').remove();
      $('.items-contents__item-about--box--category1').remove();
      $('.items-contents__item-about--box--category2').remove();
      $(".items-contents__item-about--box--size").hide();
      $(".items-contents__item-about--box--brand").hide();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.items-contents__item-about--box--category1').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "0"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          $('.items-contents__item-about--box--category2').remove();  
          $(".items-contents__item-about--box--size").hide();
          $(".items-contents__item-about--box--brand").hide();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('.items-contents__item-about--box--category2').remove();
      $(".items-contents__item-about--box--size").hide();
      $(".items-contents__item-about--box--brand").hide();
    }
  });
  $('.items-contents__item-about--box--category2').on('change', '#grandchild_category', function(){
    var grandchildId = $('#grandchild_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (grandchildId != "0"){ //子カテゴリーが初期値でないことを確認
      $(".items-contents__item-about--box--size").show();
      $(".items-contents__item-about--box--brand").show();
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $(".items-contents__item-about--box--size").hide();
      $(".items-contents__item-about--box--brand").hide();
    }
  });
});
$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='items-contents__item-about--box--category__added' id= 'grandchildren_wrapper'>
                              <select class="select-default" id="grandchild_category" name="item[category_id]">
                                <option value="0" data-category="0">---</option>
                                ${insertHTML}
                              </select>
                              <i id='fas2' class='fas fa-chevron-down'></i>
                            </div>
                          </div>`;
    $('.items-contents__item-about--box--category').append(grandchildSelectHtml);
  }
  // 子カテゴリー選択後のイベント
  $('.items-contents__item-about--box--category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "0"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: '/items/get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          $(".items-contents__item-about--box--size").hide();
          $(".items-contents__item-about--box--brand").hide();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
    else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $(".items-contents__item-about--box--size").hide();
      $(".items-contents__item-about--box--brand").hide();
    }
  });
  // 孫カテゴリー選択後のイベント
  $('.items-contents__item-about--box--category').on('change', '#grandchild_category', function(){
    var grandchildId = $('#grandchild_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (grandchildId != "0"){ //子カテゴリーが初期値でないことを確認
      $(".items-contents__item-about--box--size").show();
      $(".items-contents__item-about--box--brand").show();
    }
    else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $(".items-contents__item-about--box--size").hide();
      $(".items-contents__item-about--box--brand").hide();
    }
  });
});