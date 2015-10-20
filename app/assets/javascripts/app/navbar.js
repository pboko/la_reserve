$(document).ready(function() {
  // navbar transition jQuery script
  $(window).scroll(function(e){
    if ($(this).scrollTop() > 0) {
      $(".navbar").css({
        "background": "#333333"
      });
    }
    else {
      $(".navbar").css({
        "background": "transparent"
      });
    }
  });
});
