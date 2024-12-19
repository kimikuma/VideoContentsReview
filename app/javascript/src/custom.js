$(document).on('turbolinks:load', function() {
  $(function() {
    $('.tab').on('click', function(){
      $('.tab-active').removeClass('tab-active');
      $(this).addClass('tab-active');
      $('.box-show').removeClass('box-show');
      const index = $(this).index();
      $('.tabbox').eq(index).addClass('box-show');
    });
  });  
  $(function() {
    $('.search-tab').on('click', function(){
      $('.search-tab-active').removeClass('search-tab-active');
      $(this).addClass('search-tab-active');
      $('.search-box-show').removeClass('search-box-show');
      const index = $(this).index();
      $('.search-tabbox').eq(index).addClass('search-box-show');
    });
  });
});

$(document).on('turbolinks:load', function() {
  $(function(){
    $('.tag_list_link').on('mouseover',function(){
      $(this).css({
        "font-size": "1.2em",
        "color": "#000000"
      });  
    });
    $('.tag_list_link').on('mouseout',function(){
      $(this).css({
        "font-size": "",
        "color": ""
      });
    });
  });
  $(function(){
    $(".open-modal").on('click', function(){
      $(".modal").fadeIn(1500);
    });
    $(".close-modal").on('click', function(){
      $(".modal").fadeOut(1500);
    });
  });
});