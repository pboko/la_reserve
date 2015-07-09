$(function(){
  $(document).on('change', "#booking_period", function(){
    if ($(this).val() == "Midi") {
      $('.select-soir').addClass('is-hidden');
      $('.select-midi').removeClass('is-hidden');
    } else if ($(this).val() == "Soir") {
      $('.select-soir').removeClass('is-hidden');
      $('.select-midi').addClass('is-hidden');
    }
  });

  $(document).on('change', ".start-time", function(){
    var new_time = $(this).val();
    var field = $(this).parents("form:first").find(".start-time--hidden");

    $(field).val(new_time);
  });
});

$(function () {
  $('[data-toggle="popover"]').popover({html: true})
})

function toggleTab() {
  $(window).on('hashchange', function(e){
    var url = document.location.toString();
    if (url.match('#')) {
        $('.nav-pills a[href=#'+url.split('#')[1]+']').tab('show') ;
    }
    // Change hash for page-reload
    $('.nav-pills a').on('shown.bs.tab', function (e) {
        window.location.hash = e.target.hash;
    })
  });
}
