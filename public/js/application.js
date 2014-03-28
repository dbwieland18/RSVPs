$(document).ready(function() {
	$("#names").on("submit", function(event) {
		event.preventDefault();
    var loadGif = "<img style='height: 100px;' src='http://glenmartinmusic.com/mustache/wp-content/themes/glenmartin/images/loader.gif'></img>"
    $("#rsvp-form").html(loadGif)
    var name = $(this).serialize();
    $.ajax({
      url: "/rsvp",
      type: "post",
      data: name,
      success: function() {
        $("#rsvp-form").html("<h2>thanks!</h2><br><br><a style='padding-right: 20px;' href='/rsvp'>See who else is coming.</a>   <a href='/bringSomething!'>bring something!</a>")
      }
    });
	});
  $("#food").on("submit", function(event) {
    event.preventDefault();
    var loadGif = "<img style='height: 100px;' src='http://glenmartinmusic.com/mustache/wp-content/themes/glenmartin/images/loader.gif'></img>"
    $("#food-item-form").html(loadGif);
    var item = $(this).serialize();
    $.ajax({
      url: "/bringSomething!",
      type: "post",
      data: item,
      success: function(response) {
        $("#food-item-form").html("<h1>Perfect!</h1>")
        $("#food-item-list").prepend("<p>" + response.guest_name + " ...bringing " + response.description + "</p>")
      }
    })
  });
});
