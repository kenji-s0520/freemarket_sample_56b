$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('.items-contents__image--drop-box').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".items-contents__image--preview");
        t = this;
   // 画像ファイル以外の場合は何もしない
   if(file.type.indexOf("image") < 0){
    return false;
  }
  // ファイル読み込みが完了した際のイベント登録
  reader.onload = (function(file) {
    return function(e) {
      //既存のプレビューを削除
      // $preview.empty();
      
  // フォームの大きさを変更
    $(".items-contents__image--drop-box").removeClass().addClass("form1");

      // .prevewの領域の中にロードした画像を表示するimageタグを追加
      $preview.append($('<img>').attr({
        src: e.target.result,
        width: "114px",
        height: "114px",
        class: "preview",
        title: file.name
      }));
    };
  })(file);

  reader.readAsDataURL(file);
});
});