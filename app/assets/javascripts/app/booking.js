$(function(){
  $(document).on('change', "#booking_period", function(){
    console.log("test");
    if ($(this).val() == "Midi") {
      $('.select-soir').addClass('is-hidden');
      $('.select-midi').removeClass('is-hidden');
    } else if ($(this).val() == "Soir") {
      $('.select-soir').removeClass('is-hidden');
      $('.select-midi').addClass('is-hidden');
    }
  });
});

$(function () {
  $('[data-toggle="popover"]').popover({html: true})
})

