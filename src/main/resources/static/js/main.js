$(function() {
    //main 회원가입 버튼 부분 애니메이션 효과
    //main 회원가입 버튼 부분 애니메이션 효과
    //main 회원가입 버튼 부분 애니메이션 효과
    //main 회원가입 버튼 부분 애니메이션 효과
    $(".brn-box").hover(function() {
        $(this).find(".circle").stop().animate({
            bottom : "-160%"
        }, 400);
        $(this).find("a > p").stop().animate({color: "#fff"}, 400);
        $(this).stop().animate({
            top: "-10px"
        }, 100);
    }, function() {
        $(this).find(".circle").stop().animate({
            bottom : "-200%"
        }, 400);
        $(this).find("a > p").stop().animate({color: "#000"}, 400);
        $(this).stop().animate({
            top: "-0"
        }, 100);
    });
    //main 회원가입 버튼 부분 애니메이션 효과
    //main 회원가입 버튼 부분 애니메이션 효과
    //main 회원가입 버튼 부분 애니메이션 효과
    //main 회원가입 버튼 부분 애니메이션 효과


    $("section.part-four .sub-part .part .text-box a").hover(function(){
        $(this).find(".hover-btn").stop().animate({
            width: "100%"
        }, 300, "swing");
        $(this).find("p").stop().animate({color: "#fff"}, 400);
    },function() {
        $(this).find(".hover-btn").stop().animate({
            width: "0"
        }, 300, "swing");
        $(this).find("p").stop().animate({color: "#000"}, 400);
    });


    




    //슬라이더 관련
    //슬라이더 관련
    //슬라이더 관련
    //슬라이더 관련
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 2,
        centeredSlides: true,
        spaceBetween: 60,
        grabCursor: true,
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
    //슬라이더 관련
    //슬라이더 관련
    //슬라이더 관련
    //슬라이더 관련


    $(".brn-brand-exp").raindrops({
            color: "#383A4B",
            canvasWidth: 1300,
            canvasHeight: 20
    });




    //스크롤 시 오른쪽 리스트 헤더와 함께 밀리게
    var header = $('#header-wrap'); 
    $(window).scroll(function(){  //스크롤시
        if(header.offset().top > 60){
            if(!$("#main-list-bar").hasClass('down')){
                $("#main-list-bar").addClass('down');
            }
        }else{
            $("#main-list-bar").removeClass('down');
        }

        scrollList();
    });

    
    listClick();
});

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


function scrollList() {
    //리스트 변화
    var windowScrollTop = $(window).scrollTop();
    var windowHeight = $(window).height() / 4;
    var headerHeight = $("#header-wrap").height();
    var sectionPartTwo = $("section.part-two").offset().top - windowHeight;
    var sectionPartThree = $("section.part-three").offset().top - headerHeight - 2;
    var sectionPartFour = $("section.part-four").offset().top;
    console.log(sectionPartTwo);
    console.log(sectionPartThree);
    console.log("windowScrollTop : " + windowScrollTop);

    if(windowScrollTop >= sectionPartFour) {
        var fourList = $("#main-list-bar .part-four");
        if(!fourList.hasClass("on")) {
            $("#main-list-bar .part").removeClass("on");
            $("#main-list-bar .part .sub").stop().hide(500);

            fourList.addClass("on");
            $("#main-list-bar .part").stop().animate({
                color: "#000"
            }, 500);
            $("#main-list-bar .part .main-list-bar-on").stop().animate({
                top: "-100%"
            }, 500);
            fourList.stop().animate({
                color: "#fff"
            }, 500);
            fourList.find(".main-list-bar-on").stop().animate({
                top: 0
            }, 500);
            fourList.find(".sub").stop().show(500);
        }
    }else if(windowScrollTop >= sectionPartThree) {
        var threeList = $("#main-list-bar .part-three");
        if(!threeList.hasClass("on")) {
            $("#main-list-bar .part").removeClass("on");
            $("#main-list-bar .part .sub").stop().hide(500);

            threeList.addClass("on");
            $("#main-list-bar .part").stop().animate({
                color: "#000"
            }, 500);
            $("#main-list-bar .part .main-list-bar-on").stop().animate({
                top: "-100%"
            }, 500);
            threeList.stop().animate({
                color: "#fff"
            }, 500);
            threeList.find(".main-list-bar-on").stop().animate({
                top: 0
            }, 500);
            threeList.find(".sub").stop().show(500);
        }
    }else if(windowScrollTop >= sectionPartTwo) {
        var twoList = $("#main-list-bar .part-two");
        if(!twoList.hasClass("on")) {
            $("#main-list-bar .part").removeClass("on");
            $("#main-list-bar .part .sub").stop().hide(500);

            twoList.addClass("on");
            $("#main-list-bar .part").stop().animate({
                color: "#000"
            }, 500);
            $("#main-list-bar .part .main-list-bar-on").stop().animate({
                top: "-100%"
            }, 500);
            twoList.stop().animate({
                color: "#fff"
            }, 500);
            twoList.find(".main-list-bar-on").stop().animate({
                top: 0
            }, 500);
            twoList.find(".sub").stop().show(500);
        }
    }else if(windowScrollTop == 0) {
        var oneList = $("#main-list-bar .part-one");
        if(!oneList.hasClass("on")) {
            $("#main-list-bar .part").removeClass("on");
            $("#main-list-bar .part .sub").stop().hide(500);
            $("#main-list-bar .part").stop().animate({
                color: "#000"
            }, 500);
            $("#main-list-bar .part .main-list-bar-on").stop().animate({
                top: "-100%"
            }, 500);
            oneList.addClass("on");
            oneList.stop().animate({
                color: "#fff"
            }, 500);
            oneList.find(".main-list-bar-on").stop().animate({
                top: 0
            }, 500);
            oneList.find(".sub").stop().show(500);
        }
    }
}


function listClick() {
    //오른쪽 리스트 클릭시 스크롤
    $("#main-list-bar .part-one").click(function(){
        if(!$(this).hasClass("on")) {
            $("#main-list-bar .part").removeClass("on");
            $("#main-list-bar .part .sub").stop().hide(500);
            $("#main-list-bar .part").stop().animate({
                color: "#000"
            }, 500);
            $("#main-list-bar .part .main-list-bar-on").stop().animate({
                top: "-100%"
            }, 500);
            $(this).addClass("on");
            $(this).stop().animate({
                color: "#fff"
            }, 500);
            $(this).find(".main-list-bar-on").stop().animate({
                top: 0
            }, 500);
            $(this).find(".sub").stop().show(500);
        }

        

        $('html, body').stop().animate({
            scrollTop : 0
        }, 500);
    });

    ////////////////
    $("#main-list-bar .part-two").click(function(){
        if(!$(this).hasClass("on")) {
            $("#main-list-bar .part").removeClass("on");
            $("#main-list-bar .part .sub").stop().hide(500);

            $(this).addClass("on");
            $("#main-list-bar .part").stop().animate({
                color: "#000"
            }, 500);
            $("#main-list-bar .part .main-list-bar-on").stop().animate({
                top: "-100%"
            }, 500);
            $(this).stop().animate({
                color: "#fff"
            }, 500);
            $(this).find(".main-list-bar-on").stop().animate({
                top: 0
            }, 500);
            $(this).find(".sub").stop().show(500);
        }

        var windowHeight = $(window).height() / 4;
        $('html, body').animate({
            scrollTop : $("section.part-two").offset().top - windowHeight
        }, 500);
    });

    ////////////////
    $("#main-list-bar .part-three").click(function(){
        if(!$(this).hasClass("on")) {
            $("#main-list-bar .part").removeClass("on");
            $("#main-list-bar .part .sub").stop().hide(500);

            $(this).addClass("on");
            $("#main-list-bar .part").stop().animate({
                color: "#000"
            }, 500);
            $("#main-list-bar .part .main-list-bar-on").stop().animate({
                top: "-100%"
            }, 500);
            $(this).stop().animate({
                color: "#fff"
            }, 500);
            $(this).find(".main-list-bar-on").stop().animate({
                top: 0
            }, 500);
            $(this).find(".sub").stop().show(500);
        }

        var headerHeight = $("#header-wrap").height();
        $('html, body').stop().animate({
            scrollTop : $("section.part-three").offset().top - headerHeight
        }, 500);
    });

    ////////////////
    $("#main-list-bar .part-four").click(function(){
        if(!$(this).hasClass("on")) {
            $("#main-list-bar .part").removeClass("on");
            $("#main-list-bar .part .sub").stop().hide(500);

            $(this).addClass("on");
            $("#main-list-bar .part").stop().animate({
                color: "#000"
            }, 500);
            $("#main-list-bar .part .main-list-bar-on").stop().animate({
                top: "-100%"
            }, 500);
            $(this).stop().animate({
                color: "#fff"
            }, 500);
            $(this).find(".main-list-bar-on").stop().animate({
                top: 0
            }, 500);
            $(this).find(".sub").stop().show(500);
        }


        $('html, body').stop().animate({
            scrollTop : $("section.part-four").offset().top
        }, 500);
    });





    const $secPartOne = $("section.part-one");
    let $topHeaderHeight = $("#header-wrap").height();

    let $secPartOneW = $secPartOne.width();
    let $secPartOneH = $secPartOne.height();
    $secPartOne.mousemove(e => {
        let x = e.clientX - $secPartOne.offset().left;
        let y = e.clientY - $secPartOne.offset().top;

        let curX = x / 30;
        let curY = y / 10;

        $("#title .one").animate({
            left: curX,
            top: curY
        },1)

        console.log(curX, curY);
    });
}