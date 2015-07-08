$(document).ready(function(){
  $('.datepicker').datepicker({
    format: "yyyy-mm-dd",
    defaultViewDate: new Date()
  });

  $('#btn-resa').on('click', function(){
    $('.datepicker').datepicker({
      format: "yyyy-mm-dd",
      defaultViewDate: new Date()
    });
  })
});
