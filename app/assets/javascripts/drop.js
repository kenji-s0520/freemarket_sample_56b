function imgPreView(event) {
  var file = event.target.files[0];
  var reader = new FileReader();
  var preview = document.getElementById("preview");
  var previewImage = document.getElementById("previewImage");
  if(previewImage != null) {
    preview.removeChild(previewImage);
  }
  reader.onload = function() {
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
    $('#clear,#edit,#preview').show();
    $('#editdefault,#cleardefault,#previewdefault').remove();
  });
  
  $('#clear').click(function() {
    $('input[type=file]').val('');
    $(this).hide();
    previewImage.remove();
    $("#edit").hide();
  });
  $('#cleardefault').click(function() {
  $('#editdefault,#cleardefault,.fagggg').remove();
  })
});