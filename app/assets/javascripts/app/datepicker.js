$(document).ready(function(){
  $('.datepicker').datepicker({
    format: "yyyy-mm-dd",
    defaultViewDate: new Date()
  });


  // $('body').on('click', '.datepicker td', function(){
  //   $('.datepicker').remove()
  // })

  // $('#btn-resa').on('click', function(){
  //   $('.datepicker').datepicker({
  //     format: "yyyy-mm-dd",
  //     defaultViewDate: new Date()
  //   });
  // })
});
