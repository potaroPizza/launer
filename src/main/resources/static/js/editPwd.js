/**
 * editPWd.jsp 비밀번호 변경 페이지
 */

function isPassword(asValue) {
    var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

    return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
}

$(function () {
    $('form[name=editPwdfrm]').submit(function () {

        if ($('#editPwd_pwd').val().length < 1) {
            alert('비밀번호를 입력하세요.');
            $('#editPwd_pwd').focus();
            return false;
        } else if ($('#editPwd_newPwd').val().length < 1) {
            alert('새 비밀번호를 입력하세요.');
            $('#editPwd_newPwd').focus();
            return false;
        } else if ($('#editPwd_pwd').val() == $('#editPwd_newPwd').val()) {
            alert('동일한 비밀번호로 변경할 수 없습니다.');
            $('#editPwd_newPwd2').focus();
            return false;
        } else if ($('#editPwd_newPwd2').val().length < 1) {
            alert('새 비밀번호를 입력하세요.');
            $('#editPwd_newPwd2').focus();
            return false;
        } else if ($('#editPwd_newPwd').val() != $('#editPwd_newPwd2').val()) {
            alert('새 비밀번호가 일치하지 않습니다.');
            $('#editPwd_newPwd2').focus();
            return false;
        } else if (!isPassword($("#editPwd_newPwd").val())) {
            alert("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.")
            $('#editPwd_newPwd').focus();
            return false;
        }
    });
});
$(function () {
    $('form[name=editPwdfrmDelivery]').submit(function () {

        if ($('#editPwd_pwd').val().length < 1) {
            alert('비밀번호를 입력하세요.');
            $('#editPwd_pwd').focus();
            return false;
        } else if ($('#editPwd_newPwd').val().length < 1) {
            alert('새 비밀번호를 입력하세요.');
            $('#editPwd_newPwd').focus();
            return false;
        } else if ($('#editPwd_pwd').val() == $('#editPwd_newPwd').val()) {
            alert('동일한 비밀번호로 변경할 수 없습니다.');
            $('#editPwd_newPwd2').focus();
            return false;
        } else if ($('#editPwd_newPwd2').val().length < 1) {
            alert('새 비밀번호를 입력하세요.');
            $('#editPwd_newPwd2').focus();
            return false;
        } else if ($('#editPwd_newPwd').val() != $('#editPwd_newPwd2').val()) {
            alert('새 비밀번호가 일치하지 않습니다.');
            $('#editPwd_newPwd2').focus();
            return false;
        }/*else if(!isPassword($("#editPwd_newPwd").val())){
				alert("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.")
				$('#editPwd_newPwd').focus();
				return false;
			}*/
    });
});
$(function () {
    $('form[name=editPwdfrm] #editPwd_newPwd, form[name=editPwdfrm] #editPwd_newPwd2').keyup(function () {
        if ($('#editPwd_newPwd') != "" || $('#editPwd_newPwd2') != "") {
            if ($('#editPwd_newPwd').val() == $('#editPwd_newPwd2').val()) {
                $('.editPwd_box.int_pass').eq(1).css("border", "3px solid green")
                $('.editPwd_box.int_pass').eq(2).css("border", "3px solid green")
                $('#editPwd_alertTxt3').text("일치").css("color", "green");
                $('.pswdImg').eq(1).attr("src", "../images/m_icon_check_enable.png");
                $('.pswdImg').eq(2).attr("src", "../images/m_icon_check_enable.png");

            } else if ($('#editPwd_newPwd') != "" || $('#editPwd_newPwd2') != "") {
                $('.editPwd_box.int_pass').eq(1).css("border", "2px solid red")
                $('.editPwd_box.int_pass').eq(2).css("border", "2px solid red")
                $('#editPwd_alertTxt3').text("불일치").css("color", "red");
                $('.pswdImg').eq(1).attr("src", "../images/m_icon_check_disable.png");
                $('.pswdImg').eq(2).attr("src", "../images/m_icon_check_disable.png");
            }
        }
        if (!isPassword($("#editPwd_newPwd").val())) {
            $('.error_next_box').eq(1).text("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.").css("color", "red");
            $('.pswdImg').eq(1).attr("src", "../images/m_icon_not_use.png");
            $('.pswdImg').eq(2).attr("src", "../images/m_icon_not_use.png");
        } else {
            $('.error_next_box').eq(1).text("사용가능").css("color", "green");
            $('.pswdImg').eq(1).attr("src", "../images/m_icon_safe.png");
            $('.pswdImg').eq(2).attr("src", "../images/m_icon_safe.png");

        }

    })
    $('form[name=editPwdfrm] #editPwd_pwd').keyup(function () {
        if (!isPassword($("#editPwd_pwd").val())) {
            $('.error_next_box').eq(0).text("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.").css("color", "red");
        } else {
            $('.error_next_box').eq(0).text("")
        }

    })


    $('form[name=editPwdfrmDelivery] #editPwd_newPwd, form[name=editPwdfrmDelivery] #editPwd_newPwd2').keyup(function () {

        if ($('#editPwd_newPwd') != "" || $('#editPwd_newPwd2') != "") {
            if ($('#editPwd_newPwd').val() == $('#editPwd_newPwd2').val()) {
                $('.editPwd_box.int_pass').eq(1).css("border", "3px solid green")
                $('.editPwd_box.int_pass').eq(2).css("border", "3px solid green")
                $('#editPwd_alertTxt3').text("일치").css("color", "green");
                $('.pswdImg').eq(1).attr("src", "../images/m_icon_check_enable.png");
                $('.pswdImg').eq(2).attr("src", "../images/m_icon_check_enable.png");

            } else if ($('#editPwd_newPwd') != "" || $('#editPwd_newPwd2') != "") {
                $('.editPwd_box.int_pass').eq(1).css("border", "2px solid red")
                $('.editPwd_box.int_pass').eq(2).css("border", "2px solid red")
                $('#editPwd_alertTxt3').text("불일치").css("color", "red");
                $('.pswdImg').eq(1).attr("src", "../images/m_icon_check_disable.png");
                $('.pswdImg').eq(2).attr("src", "../images/m_icon_check_disable.png");
            }
        }
        if (!isPassword($("#editPwd_newPwd").val())) {
            $('.error_next_box').eq(1).text("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.").css("color", "red");
            $('.pswdImg').eq(1).attr("src", "../images/m_icon_not_use.png");
            $('.pswdImg').eq(2).attr("src", "../images/m_icon_not_use.png");
        } else {
            $('.error_next_box').eq(1).text("사용가능").css("color", "green");
            $('.pswdImg').eq(1).attr("src", "../images/m_icon_safe.png");
            $('.pswdImg').eq(2).attr("src", "../images/m_icon_safe.png");

        }

    })
    $('form[name=editPwdfrmDelivery] #editPwd_pwd').keyup(function () {
        if (!isPassword($("#editPwd_pwd").val())) {
            $('.error_next_box').eq(0).text("비밀번호는 8~16자 영문,숫자,특수문자를 최소 한가지씩 입력해주세요.").css("color", "red");
        } else {
            $('.error_next_box').eq(0).text("")
        }

    })

});