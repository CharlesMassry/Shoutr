$(function() {
  $("#new_text_shout").submit(function(){
    $.ajax("/text_shouts", {
      data : {
        text_shout: {
          content: $("#text_shout_content").val()
        }
      },
      type: "POST",
    }).done(function(response){
      $("#shoutr").prepend(response);
    });
    return false;
  });
});
