$(function() {
    const $listPart = $("#list-part");

    $("#list-box").click(() => {
        if($listPart.hasClass("active")) {
            $listPart.removeClass("active");
            $listPart.addClass("non-active");
        }else{
            $listPart.removeClass("non-active");
            $listPart.addClass("active");
        }
    });

    /*let vh = window.innerHeight * 0.01
    document.documentElement.style.setProperty('--vh', `${vh}px`)
    window.addEventListener('resize', () => {
        let vh = window.innerHeight * 0.01
        document.documentElement.style.setProperty('--vh', `${vh}px`)
    });


    let listPartHeight = 0;
    $(window).mousemove(function(event){
        listPartHeight = $(window).height() - event.clientY;
    });

    const listBox = document.querySelector("#list-box");
    const listPart = document.getElementById("list-part");
    let isPressed = false;
    console.log(listPart);


    var filter = "win16|win32|win64|mac|macintel";
    if ( navigator.platform ) {
        if ( filter.indexOf( navigator.platform.toLowerCase() ) < 0 ) {
            //mobile
            $("#list-part").on("touchmove", function (e) {
                isPressed = true;
                mouseActionY();
            });
            $("#list-part").on("touchend", function (e) {
                isPressed = false;
            });
        } else {
            //pc
            listBox.addEventListener('mouseup', function() {
                isPressed = false;
            })
            listBox.addEventListener('mousedown', function() {
                isPressed = true;
                mouseActionY();
            });
        }
    }

    /!*listBox.addEventListener('mouseup', function() {
        isPressed = false;
    })
    listBox.addEventListener('mousedown', function() {
        isPressed = true;
        mouseActionY();
    });*!/




    function mouseActionY() {
        if(isPressed) listPart.style.height = listPartHeight;

        setTimeout(function() {
            mouseActionY();
        }, 5);
    }*/



    // 이전 소스
    // 이전 소스
    // 이전 소스
    // 이전 소스
    // 이전 소스
    // 이전 소스
    // 이전 소스
    // 이전 소스
    // 이전 소스
    // var $list_box = $("#list-box");
    // var $winHeight = $(window).height();
    // var mouseOffset = 0;
    // $(window).mousemove(function(event){
    //     mouseOffset = $winHeight - event.clientY;
    // });
    //
    //
    // $list_box.mousedown(function() {
    //     $(window).mousemove(function(event){
    //         mouseOffset = $winHeight - event.clientY;
    //         $("#list-part").css({
    //             height: mouseOffset
    //         });
    //     });
    //     /*var mouseOffset = 0
    //     $(window).mousemove(function(event){
    //         // console.log(winHeight - event.clientY);
    //         mouseOffset = event.clientY
    //     },function() {
    //         var winHeight = $(window).height();
    //         var offsetSet = winHeight - mouseOffset;
    //         $("#list-part").css({height: offsetSet});
    //     });*/
    // });
    // /*$list_box.mouseup(function() {
    //     $(window).mousemove(function(event) {
    //         event.stopImmediatePropagation();
    //     })
    // });*/

    /*function fn_location(){
        if(isPressed) {
            x = event.pageX;
            y = event.pageY;
            console.log(x,y);
        }
        setTimeout(function() {
            fn_location();
        }, 5);
    }*/
});
