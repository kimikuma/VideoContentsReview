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
  $(function() {
    $('.new-tab').on('click', function(){
      $('.new-tab-active').removeClass('new-tab-active');
      $(this).addClass('new-tab-active');
      $('.new-box-show').removeClass('new-box-show');
      const index = $(this).index();
      $('.new-tabbox').eq(index).addClass('new-box-show');
    });  
    $('.new-post-button').on('click',function(){
      if($('.new-post-button').hasClass('new-post-button-active')){
        $(this).removeClass('new-post-button-active');
        $('.new-form').removeClass('new-form-active');
      }else {
        $(this).addClass('new-post-button-active');
        $('.new-form').addClass('new-form-active');
      } 
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
      $(".modal").fadeIn(900);
      $(".logo-img").fadeIn(1300);
    });
    $(".close-modal").on('click', function(){
      $(".modal").fadeOut(900);
      $(".logo-img").fadeOut(600);
    });
  });
});

document.addEventListener('DOMContentLoaded', function() {
  const slides= document.querySelctorAll('.slide');
  let currentSlideIndex= 0;
  slides[currentSlideIndex].addClass('active');

  function showNextSlide(){
    slides[currentSlideIndex].removeClass("active");
    currentSlideIndex=(currentSlideIndex + 1) % slides.length;
    slides[currentSlideIndex].addClass('active');
  }

  setInterval(showNextSlide,3000);
});