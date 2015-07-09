$(function(){
  $(document).on('change', "#booking_period", function(){
    if ($(this).val() == "Midi") {
      $('.select-soir').addClass('is-hidden');
      $('.select-midi').removeClass('is-hidden');

      var form = $(this).parents("form:first");
      var first_hour = form.find(".start-time--midi option:first").val();
      var hidden_start_time = form.find(".start-time--hidden");

      $(hidden_start_time).val(first_hour);
    } else if ($(this).val() == "Soir") {
      $('.select-soir').removeClass('is-hidden');
      $('.select-midi').addClass('is-hidden');
    }
  });

  $(document).on('change', ".start-time", function(){
    var new_time = $(this).val();
    var hidden_start_time = $(this).parents("form:first").find(".start-time--hidden");

    $(hidden_start_time).val(new_time);
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
