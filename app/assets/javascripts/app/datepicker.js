$(document).ready(function(){
  $('.datepicker').datepicker({
    format: "yyyy-mm-dd",
    language: "fr",
    startView: new Date(),
    weekStart: 1,
    orientation: "top auto",
    autoclose: true
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

