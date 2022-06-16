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
   })
});