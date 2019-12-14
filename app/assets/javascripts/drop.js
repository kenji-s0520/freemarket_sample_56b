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
    $('#edit').show();
    $('#preview').show();
  });

  // ユーザエージェント
  var ua = navigator.userAgent;  
  
  $('#clear').click(function() {
    $('input[type=file]').val('');
    $(this).hide();
    previewImage.remove();
    $("#edit").hide();
  });
});