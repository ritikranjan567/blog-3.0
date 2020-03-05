$(document).on("turbolinks:load", function () {
  $('.article-color').css('background-color', $('#article_bgcolor').val()).css('color', $('#article_text_color').val());
  
  $("#article_bgcolor").on('input', function(){
    console.log('change back');
    $(".article-color").css("background-color", $(this).val())
  });

  $("#article_text_color").on('change', function(){
    console.log('change text');
    
    $(".article-color").css("color", $(this).val())
  }); 
});

/* $("#article_bgcolor").on('input', function(){
    console.log('change back');
    $(".article-color").css("background-color", $(this).val())
  });

  $("#article_text_color").on('change', function(){
    console.log('change text');
    
    $(".article-color").css("color", $(this).val())
  });*/