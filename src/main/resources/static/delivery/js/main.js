$(function() {
    let listPartHeight = 0;
    $(window).mousemove(function(event){
        listPartHeight = $(window).height() - event.clientY;
    });

    const listBox = document.querySelector("#list-box");
    const listPart = document.getElementById("list-part");
    let isPressed = false;
    console.log(listPart);


    listBox.addEventListener('mouseup', function() {
        isPressed = false;
    })
    listBox.addEventListener('mousedown', function() {
        isPressed = true;
        mouseActionY();
    });

    function mouseActionY() {
        if(isPressed) listPart.style.height = listPartHeight;

        setTimeout(function() {
            mouseActionY();
        }, 5);
    }



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