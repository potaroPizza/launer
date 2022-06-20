function scrollNone(num) {
    if(num == 1) {
        $("#wrap").on('scroll touchmove mousewheel', function(e){
            e.preventDefault();
            e.stopPropagation();
            return false;
        });
    }else {
        $("#wrap").off('scroll touchmove mousewheel');
    }
}


$(function() {
    $("#side-btn").hover(function() {
        $(this).find("div").stop().animate({
            width: "100%"
        }, 400);
        $(this).find(".fa-solid").stop().animate({
            color: "#fff"
        }, 400);
    },function(){
        $(this).find("div").stop().animate({
            width: "0"
        }, 400);
        $(this).find(".fa-solid").stop().animate({
            color: "#000"
        }, 400);
    });

    $("#side-btn").click(function(e){
        e.preventDefault();
        if($(this).hasClass("on")) {
            $(this).removeClass("on");
            $(this).find("i").removeClass("fa-caret-left");
            $(this).find("i").addClass("fa-caret-right");
            $("aside.left").stop().animate({
                left: "-300px"
            }, 500, "swing");
            $("#modal-background").fadeOut(400);
            scrollNone(0);
        }else {
            $(this).addClass("on");
            $(this).find("i").removeClass("fa-caret-right");
            $(this).find("i").addClass("fa-caret-left");
            $("aside.left").stop().animate({
                left: "0"
            }, 500, "swing");
            $("#modal-background").fadeIn(400);
            scrollNone(1);
        }
    });

    $("#modal-background").click(function(e){
        var chk = $("#side-btn");
        if(chk.hasClass("on")) {
            chk.removeClass("on");
            chk.find("i").removeClass("fa-caret-left");
            chk.find("i").addClass("fa-caret-right");
            $("aside.left").stop().animate({
                left: "-300px"
            }, 500, "swing");
            $("#modal-background").fadeOut(400);
            scrollNone(0);
        }else {
            chk.addClass("on");
            chk.find("i").removeClass("fa-caret-right");
            chk.find("i").addClass("fa-caret-left");
            $("aside.left").stop().animate({
                left: "0"
            }, 500, "swing");
            $("#modal-background").fadeIn(400);
            scrollNone(1);
        }
    });



    // aside .left hover 
    // aside .left hover 
    // aside .left hover 
    // aside .left hover
    $("#menu-part nav > ul > li").hover(function() {
        $(this).stop().animate({
            opacity: 1
        }, 200, "swing");
    },function() {
        $(this).stop().animate({
            opacity: 0.6
        }, 200, "swing");
    });
    $("#menu-part .sub-nav > li").hover(function() {
        $(this).stop().animate({
            opacity: 1
        }, 200, "swing");
    },function() {
        $(this).stop().animate({
            opacity: 0.6
        }, 200, "swing");
    });

    $(".sub-title").hover(function() {
        $(this).find(".sub-nav").stop().slideToggle();
    });
    // aside .left hover 
    // aside .left hover 
    // aside .left hover 
    // aside .left hover 










    //header 스크롤 시 배경 바뀌는
    //header 스크롤 시 배경 바뀌는
    //header 스크롤 시 배경 바뀌는
    //header 스크롤 시 배경 바뀌는
    var $header = $('#header-wrap'); 
    
    $(window).scroll(function(){  //스크롤시
        if($header.offset().top > 60){
            if(!$header.find(".header-slide-down").hasClass('down')){
                $header.find(".header-slide-down").addClass('down');
            }
        }else{
            $header.find(".header-slide-down").removeClass('down');
        }
        // $header.toggleClass('down', scrolled);
    });



    $("#header-right a").hover(function() {
        $(this).find(".line").addClass('on');
        $(this).find(".hover-text").addClass('on');
        $(this).find("span").stop().animate({opacity: 0}, 100, "swing");
    },function() {
        $(this).find(".line").removeClass('on');
        $(this).find(".hover-text").removeClass('on');
        $(this).find("span").stop().animate({opacity: 1}, 300, "swing");
    });
});