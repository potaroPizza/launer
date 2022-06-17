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
      let $subBtn = $(this).parent();
      if($subBtn.hasClass("on")) {
         $subBtn.removeClass("on");
      }else{
         $subBtn.addClass("on");
      }
      $subBtn.find(".sub-nav").stop().slideToggle();
   })
});