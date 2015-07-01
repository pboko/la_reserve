$(document).ready(function() {
 $('#calendar').fullCalendar({
   lang: "fr",
   events: $('#calendar').data('feed-url')
 });
});

