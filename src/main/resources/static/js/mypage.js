/**mypage.jsp 마이페이지 메인페이지
 *
 */

$(function () {
    /* $("#mypage-main-wrap .part a").mouseover(function(e) {
        const $secPartOne = $(this);
        e.stopPropagation();
        let x = e.clientX - $secPartOne.offset().left;
        let y = e.clientY - $secPartOne.offset().top;

        console.log(x, y);
    }); */

    $("#mypage-main-wrap .part").hover(function () {
        $(this).stop().animate({
            top: "-3%"
        }, 400);
        $(this).find(".hover-wrap").stop().animate({
            width: "400%",
            height: "400%"
        }, 600);

        $(this).find("a").stop().animate({color: "#fff"}, 600);
    }, function () {
        $(this).stop().animate({
            top: "0"
        }, 400);
        $(this).find(".hover-wrap").stop().animate({
            width: 0,
            height: 0
        }, 600);
        $(this).find("a").stop().animate({color: "#000"}, 600);
    });
})