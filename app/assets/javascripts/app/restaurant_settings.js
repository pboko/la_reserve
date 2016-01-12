$(document).ready(function() {

  $('#open_midi').click(function(){
    $('.opening-hours-midi').removeClass('visible').addClass('hidden');
    $('.opening-hours-show').show();
    // if($("#open_midi").is(':checked')
    //   $('.opening-hours-midi').removeClass('hidden').addClass('visible');
    // else
    // );
  });

  $('#open_soir').click(function(){
    $('.opening-hours-soir').removeClass('visible').addClass('hidden');
    $('.opening-hours-midi').removeClass('hidden').addClass('visible');
    $('#open_midi').attr(':checked');
  });

});


  // $('#open_soir').click(function(){
  //   $('.opening-hours-soir').removeClass('visible').addClass('hidden');
  //   if $('.opening-hours-soir').attr(checked){
  //     $('.opening-hours-soir').removeClass('hidden').addClass('visible')
  //   };
  //   else {
  //     $('.opening-hours-soir').removeClass('visible').addClass('hidden');
  //   };
  // })

