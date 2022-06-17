$(function() {
   $("#header-wrap .menu-btn").click(function(e) {
      e.preventDefault();
      $("#aside-wrap").stop().animate({
         left:0
      },400);
   });

   $("#aside-wrap .close").click(function() {
      $("#aside-wrap").stop().animate({
         left:"-100%"
      },400);
   });


   $("#aside-wrap .sub-btn").click(function() {
      if($(this).hasClass("on")) {
         $(this).removeClass("on");
      }else{
         $(this).addClass("on");
      }
      $(this).find(".sub-nav").stop().slideToggle();
   })
});