$(function() {
  $('#dialog').dialog({
    autoOpen: false,
    modal: false,
    position: {
      of : window,
      at: 'center',
      my: 'bottom'

    }
  });
  
    $("#opener").click(function() {
      var target = document.getElementById("fadeLayer");
      target.style.visibility = "visible";
      $("#dialog").dialog("open");
  });
})


 