$(document).ready(function(){

  $('.flags').mouseenter(function(){
    $(this).css('opacity', 0.5);
  });
  $('.flags').mouseleave(function(){
    $(this).css('opacity', 1);
  });

  $('.flags').click(function(){
    console.log($(this).attr('id'));
  });
});




