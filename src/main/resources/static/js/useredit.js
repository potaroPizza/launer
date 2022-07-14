/**useredit.jsp  회원정보 수정페이지
 *
 */
function isPassword(asValue) {
    var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

    return regExp.test(asValue);
}

function validate_hp(hp) {
    var pattern = new RegExp(/([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/);
    return pattern.test(hp);
}

function validate_accountNumber(accountNumber) {
    var pattern = new RegExp(/^[0-9]+$/);
    return pattern.test(accountNumber);
}

function execZipcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = '';

            if (data.userSelectedType === 'R') { // 도로명 주소
                addr = data.roadAddress;
            } else { // 지번주소
                addr = data.jibunAddress;
            }

            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("addressDetail").focus();

            chkAddress(addr);
            coorSet(addr);
        }

    }).open();
}

const chkAddress = (address) => {
    $.ajax({
        url: "/launer/mypage/chkAddress",
        type: "get",
        data: `address=${address}`,
        success: function (res) {
            var msg = "";
            console.log(res);
            if (res.SUCCESS) {
                msg = "서비스 지원 지역입니다.";
                $('#serviceError').html(msg).css("color", "#01DF01");
            } else {
                alert('서비스 미지원 지역입니다.');
                msg = "서비스 미지원 지역입니다.";
                $('#serviceError').html(msg).css("color", "red");
            }
        },
        error: function (xhr, status, error) {
            alert('error! : ' + error);
        }
    });
};


$(function () {
    $('form[name=usereditfrm]').submit(function () {
        if ($("#pwd").val().length < 1) {
            alert("비밀번호를 입력하세요");
            $("#pwd").focus();
            return false;
        } else if ($("#hp").val().length < 1) {
            alert("전화번호를 입력하세요");
            $("#hp").focus();
            return false;
        } else if (!validate_hp($('#hp').val())) {
            alert("전화번호 형식이 맞지 않습니다.");
            $("#hp").focus();
            return false;
        }else if(!isPassword($("#pwd").val())){
				alert("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.")
				$('#pwd').focus();
				return false;
			}
    });
    //소셜회원
    $('form[name=usereditfrmSocial]').submit(function () {

        if ($("form[name=usereditfrmSocial] #hp").val().length < 1) {
            alert("전화번호를 입력하세요");
            $("form[name=usereditfrmSocial] #hp").focus();
            return false;
        } else if (!validate_hp($('form[name=usereditfrmSocial] #hp').val())) {
            alert("전화번호 형식이 맞지 않습니다.");
            $("form[name=usereditfrmSocial] #hp").focus();
            return false;
        } else if ($("form[name=usereditfrmSocial] #address").val().length < 1) {
            alert("주소를 입력하세요");
            $("form[name=usereditfrmSocial] #zipcode").focus();
            return false;
        } else if ($("form[name=usereditfrmSocial] #addressDetail").val().length < 1) {
            alert("상세주소를 입력하세요");
            $("form[name=usereditfrmSocial] #addressDetail").focus();
            return false;
        }else if($("form[name=usereditfrmSocial] #entermethod").val().length<1) {
				alert("공동현관 출입방법을 입력하세요");
				$("form[name=usereditfrmSocial] #entermethod").focus();
				return false;
			}

    });
    //배송기사
    $('form[name=deliveryeditfrm]').submit(function () {

        if ($("form[name=deliveryeditfrm] #hp").val().length < 1) {
            alert("전화번호를 입력하세요");
            $("form[name=deliveryeditfrm] #hp").focus();
            return false;
        } else if (!validate_hp($('form[name=deliveryeditfrm] #hp').val())) {
            alert("전화번호 형식이 맞지 않습니다.");
            $("form[name=deliveryeditfrm] #hp").focus();
            return false;
        } else if ($("form[name=deliveryeditfrm] #accountHolder").val().length < 1) {
            alert("계좌주를 입력하세요");
            $("form[name=deliveryeditfrm] #accountHolder").focus();
            return false;
        } else if ($("#accountNumber").val() === "") {
            alert("계좌번호를 입력하세요");
            $("#accountNumber").focus();
            return false;
        }else if(!isPassword($("#pwd").val())){
            alert("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.")
            $('#pwd').focus();
            return false;
        }
    });


});

$(function () {
    $('form[name=usereditfrm] #hp').keyup(function () {
        if (!validate_hp($('form[name=usereditfrm] #hp').val())) {
            $('form[name=usereditfrm] .error_next_box').eq(3).text("전화번호 형식이 맞지 않습니다.").css("color", "red");
        } else {
            $('form[name=usereditfrm] .error_next_box').eq(3).text("")
        }

    })
    $('form[name=usereditfrm] #pwd').keyup(function () {
        if (!isPassword($('form[name=usereditfrm] #pwd').val())) {
            $('form[name=usereditfrm] .error_next_box').eq(1).text("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.").css("color", "red");
        	 $('.pswdImg').eq(0).attr("src", "../images/m_icon_not_use.png");
        } else {
            $('form[name=usereditfrm] .error_next_box').eq(1).text("");
            $('.pswdImg').eq(0).attr("src", "../images/m_icon_safe.png");
        }

    })
    $('form[name=usereditfrm] #addressDetail').keyup(function () {
        if ($('form[name=usereditfrm] #addressDetail').val() == "") {
            $('form[name=usereditfrm] .error_next_box').eq(6).text("상세주소를 입력해주세요.").css("color", "red");
        } else {
            $('form[name=usereditfrm] .error_next_box').eq(6).text("")
        }
    })
    $('form[name=usereditfrm] #entermethod').keyup(function () {
        if ($('form[name=usereditfrm] #entermethod').val() == "") {
            $('form[name=usereditfrm] .error_next_box').eq(7).text("공동현관 출입방법을 입력해주세요.").css("color", "red");
        } else {
            $('form[name=usereditfrm] .error_next_box').eq(7).text("")
        }
    })
    //소셜회원
    $('form[name=usereditfrmSocial] #hp').keyup(function () {
        if (!validate_hp($('form[name=usereditfrmSocial] #hp').val())) {
            $('form[name=usereditfrmSocial] .error_next_box').eq(2).text("전화번호 형식이 맞지 않습니다.").css("color", "red");
        } else {
            $('form[name=usereditfrmSocial] .error_next_box').eq(2).text("")
        }

    })

    $('form[name=usereditfrmSocial] #addressDetail').keyup(function () {
        if ($('form[name=usereditfrmSocial] #addressDetail').val() == "") {
            $('form[name=usereditfrmSocial] .error_next_box').eq(5).text("상세주소를 입력해주세요.").css("color", "red");
        } else {
            $('form[name=usereditfrmSocial] .error_next_box').eq(5).text("")
        }
    })
    $('form[name=usereditfrmSocial] #entermethod').keyup(function () {
        if ($('form[name=usereditfrmSocial] #entermethod').val() == "") {
            $('form[name=usereditfrmSocial] .error_next_box').eq(6).text("공동현관 출입방법을 입력해주세요.").css("color", "red");
        } else {
            $('form[name=usereditfrmSocial] .error_next_box').eq(6).text("")
        }
    })

    //배송기사
    $('form[name=deliveryeditfrm] #pwd').keyup(function () {
        if (!isPassword($('form[name=deliveryeditfrm] #pwd').val())) {
            $('form[name=deliveryeditfrm] .error_next_box').eq(1).text("비밀번호 형식이 맞지 않습니다.").css("color", "red");
        	$('.pswdImg').eq(0).attr("src", "../images/m_icon_not_use.png");
        } else {
            $('form[name=deliveryeditfrm] .error_next_box').eq(1).text("")
            $('.pswdImg').eq(0).attr("src", "../images/m_icon_safe.png");
        }

    })
    $('form[name=deliveryeditfrm] #hp').keyup(function () {
        if (!validate_hp($('form[name=deliveryeditfrm] #hp').val())) {
            $('form[name=deliveryeditfrm] .error_next_box').eq(3).text("전화번호 형식이 맞지 않습니다.").css("color", "red");
        } else {
            $('form[name=deliveryeditfrm] .error_next_box').eq(3).text("")
        }

    })

    $('form[name=deliveryeditfrm] #accountHolder').keyup(function () {
        if ($('form[name=deliveryeditfrm] #accountHolder').val() == "") {
            $('form[name=deliveryeditfrm] .error_next_box').eq(5).text("계좌주를 입력해주세요.").css("color", "red");
        } else {
            $('form[name=deliveryeditfrm] .error_next_box').eq(5).text("")
        }
    })
    $('form[name=deliveryeditfrm] #accountNumber').keyup(function () {

        if ($('form[name=deliveryeditfrm] #accountNumber').val() == "") {
            $('form[name=deliveryeditfrm] .error_next_box').eq(6).text("계좌번호를 입력해주세요.").css("color", "red");
        } else {
            $('form[name=deliveryeditfrm] .error_next_box').eq(6).text("")
        }

    })


});


$(function () {

    $("#officeBtn").click(function () {
        $('form[name=deliveryeditfrm] #modal-wrap').fadeIn(500);
        $('form[name=deliveryeditfrm] #modal-wrap').css("display", "flex").animate({
            opacity: 1
        }, 300);
    });

    $(document).ready(function () {
        $(".officelist li").click(function () {
            $(".officelist li").removeClass("on");
            $(this).addClass("on");


        });
    });


    $("#confirmBtn").click(function () {
        modalClose();
    });
    $("#close").click(function () {
        ``
        modalClose();
    });

    /*$(window).on('click', function() {
        modalClose();
    });*/

    $(".officelist li a").click(function (e) {
        e.preventDefault();
        document.getElementById('officeNo').value = this.dataset.value;
        document.getElementById('officeName').value=$(this).text();

        modalClose();
    })

    function modalClose() {
        $('form[name=deliveryeditfrm] #modal-wrap').fadeOut();
        $('form[name=deliveryeditfrm] #modal-wrap').animate({
            opacity: 0
        }, 300, function () {
            $('form[name=deliveryeditfrm] #modal-wrap').css("display", "none");
        });
    };

});


function coorSet(addr) {
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(addr, function (result, status) {
        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {
            document.querySelector("input[name=lonX]").value = result[0].y;
            document.querySelector("input[name=latY]").value = result[0].x;
        }
    });
}

