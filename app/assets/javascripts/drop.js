// document.addEventListener("DOMContentLoaded", function(){
// // ファイルアップロードゾーン
// const itemsContentsImageDropBox = document.querySelector('.items-contents__image--drop-box');
// console.log(document.querySelector('.items-contents__image--drop-box'));

// // ファイルアップロードゾーンに着脱するクラス
// const className = 'on';

// // ドラッグした要素が重なったときの処理
// itemsContentsImageDropBox.addEventListener('dragover', (event) => {
//   // デフォルトの挙動を停止
//   event.preventDefault();
//   itemsContentsImageDropBox.classList.add(className);
// });

// // ドラッグした要素が離れたときの処理
// itemsContentsImageDropBox.addEventListener('dragleave', () => {
//   // デフォルトの挙動を停止
//   event.preventDefault();
//   itemsContentsImageDropBox.classList.remove(className);
// });

// // ドロップした時の処理
// itemsContentsImageDropBox.addEventListener('drop', (event) => {
//   // デフォルトの挙動を停止
//   event.preventDefault();
//   itemsContentsImageDropBox.classList.remove(className);

//   // Fileオブジェクトを参照
//   const transferdFiles = event.dataTransfer.files;

//   // 画像を表示する
//   displayImages(transferdFiles);
// });

// /** 画像の表示処理 */
// function displayImages(transferdFiles) {
//   // 画像ファイルの格納配列
//   const imageFileList = [];

//   // ファイル数
//   const fileNum = transferdFiles.length;

//   // ファイルが画像のもののみを配列に格納する
//   for (let i = 0; i < fileNum; i++) {
//     if (transferdFiles[i].type.match('image.*') === false) {
//       return;
//     }
//     imageFileList.push(transferdFiles[i]);
//   }

//   // 画像表示エリアの参照
//   const imagePreviewArea = document.querySelector('.items-contents__image--drop-box');

//   // 各画像ファイルについて処理
//   for (const imageFile of imageFileList) {
//     // 画像ファイルの読み込み処理
//     const fileReader = new FileReader();
//     fileReader.readAsDataURL(imageFile);
//     fileReader.addEventListener('load', (event) => {
//       const image = new Image();
//       image.src = event.target.result;
//       // 表示エリアの先頭に画像ファイルを表示
//       itemsContentsImageDropBox.insertBefore(image, itemsContentsImageDropBox.firstChild);
//     });
//   }
// }
// })

function imgPreView(event) {
  var file = event.target.files[0];
  var reader = new FileReader();
  var preview = document.getElementById("preview");
  var previewImage = document.getElementById("previewImage");
  
  
  if(previewImage != null) {
    preview.removeChild(previewImage);
  }
  reader.onload = function(event) {
    var img = document.createElement("img");
    img.setAttribute("src", reader.result);
    img.setAttribute("id", "previewImage");
    preview.appendChild(img);
    
  };
 
  reader.readAsDataURL(file);
}

$(function() {
  // アップロードするファイルを選択
  $('input[type=file]').change(function() {
    $('#clear').show();
  });

  // ユーザエージェント
  var ua = navigator.userAgent;  
  
  // ファイル参照をクリア
  $('#clear').click(function() {
    $('input[type=file]').val('');
    // IE バージョン判定 10以下
    if (ua.match(/MSIE\s(7|8|9|10)\./i)) {
      $('#userfile_item').html('<input type="file" name="item[images_attributs][0][image]">');
    }
    $(this).hide();
  });
});

// div配下のaタグがクリックされた際に、イベントを発生させる。
$(document).on('click','.item__images__container__preview a', function(){
  // index関数を利用して、クリックされたaタグが、div内で何番目のものか特定する。
  var index = $(".item__images__container__preview a").index(this);
  // クリックされたaタグの順番から、削除すべき画像を特定し、配列から削除する。
  files_array.splice(index - 1, 1);
  // クリックされたaタグが含まれるli要素をHTMLから削除する。
  $(this).parent().parent().parent().remove();


var target_image = $(this).parent().parent();
var images = [];
  // 登録済画像データだけの配列（DB用）
  var registered_images_ids =[]
  // 新規追加画像データだけの配列（DB用）
  var new_image_files = [];

    // 削除画像のdata-image番号を取得
    var target_image_num = target_image.data('image');

    // 対象の画像をビュー上で削除
    target_image.remove();

    // 対象の画像を削除した新たな配列を生成
    images.splice(target_image_num, 1);

    // target_image_numが登録済画像の数以下の場合は登録済画像データの配列から削除、それより大きい場合は新たに追加した画像データの配列から削除
    if (target_image_num < registered_images_ids.length) {
      registered_images_ids.splice(target_image_num, 1);
    } else {
      new_image_files.splice((target_image_num - registered_images_ids.length), 1);
    }

    if(images.length == 0) {
      $('input[type= "file"].upload-image').attr({
        'data-image': 0
      })
    }
  });