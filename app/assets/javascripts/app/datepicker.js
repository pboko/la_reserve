$(document).ready(function(){
  $('.datepicker').datepicker({
    format: "yyyy-mm-dd",
    startView: new Date(),
    orientation: "top left"
  });

  $('#btn-resa').on('click', function(){
    $('.datepicker').datepicker({
      format: "yyyy-mm-dd",
      defaultViewDate: new Date()
    });
  })
});

