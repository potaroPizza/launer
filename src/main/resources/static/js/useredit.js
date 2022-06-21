/*변수 선언*/

var pw1 = document.querySelector('#pwd1');
var pwMsg = document.querySelector('#alertTxt');
var pwImg1 = document.querySelector('#pwd1_img1');

var pw2 = document.querySelector('#pwd2');
var pwImg2 = document.querySelector('#pwd2_img1');
var pwMsgArea = document.querySelector('.int_pass');

var mobile = document.querySelector('#mobile');

var error = document.querySelectorAll('.error_next_box');


/*이벤트 핸들러 연결*/

pw1.addEventListener("focusout", checkPw);
pw2.addEventListener("focusout", comparePw);
mobile.addEventListener("focusout", checkPhoneNum);


function checkPw() {
    var pwPattern = /[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/;
    if(pw1.value === "") {
        error[1].innerHTML = "필수 정보입니다.";
        error[1].style.display = "block";
    } else if(!pwPattern.test(pw1.value)) {
        error[1].innerHTML = "8~16자 영문 대 소문자, 숫자,특수문자를 사용하세요.";
        pwMsg.innerHTML = "사용불가";
        pwMsgArea.style.paddingRight = "93px";
        error[1].style.display = "block";
        
        pwMsg.style.display = "block";
        pwImg1.src = "../images/m_icon_not_use.png";
    } else {
        error[1].style.display = "none";
        pwMsg.innerHTML = "사용가능";
        pwMsg.style.display = "block";
        pwMsg.style.color = "#03c75a";
        pwImg1.src = "../images/m_icon_safe.png";
    }
}

function comparePw() {
    if(pw2.value === pw1.value && pw2.value != "") {
        pwImg2.src = "../images/m_icon_check_enable.png";
        error[2].style.display = "none";
    } else if(pw2.value !== pw1.value) {
        pwImg2.src = "../images/m_icon_check_disable.png";
        error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
        error[2].style.display = "block";
    } 

    if(pw2.value === "") {
        error[2].innerHTML = "필수 정보입니다.";
        error[2].style.display = "block";
    }
}
function validate_pwd(pwd){
	var pattern = new RegExp(/[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}/);
	return pattern.test(pwd);
}
function validate_mobile(mobile){
	var pattern = new RegExp(/([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/);
	return pattern.test(mobile);
}

function checkPhoneNum() {
    var isPhoneNum = /([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})/;

    if(mobile.value === "") {
        error[4].innerHTML = "필수 정보입니다.";
        error[4].style.display = "block";
    } else if(!isPhoneNum.test(mobile.value)) {
        error[4].innerHTML = "형식에 맞지 않는 번호입니다.";
        error[4].style.display = "block";
    } else {
        error[4].style.display = "none";
    }
    
}

function execZipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';

                if (data.userSelectedType === 'R') { // 도로명 주소
                    addr = data.roadAddress;
                } else { // 지번주소
                    addr = data.jibunAddress;
                }

                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }


	$(function(){
		$('form[name=usereditfrm]').submit(function(){
			if($("#pwd1").val().length<1) {
				alert("비밀번호를 입력하세요");
				$("#pwd1").focus();
				return false;
			}else if($("#pwd1").val()!=$("#pwd2").val()) {
				alert("비밀번호가 일치하지 않습니다.");
				$("#pwd2").focus();
				return false;
			}else if(!validate_pwd($('#pwd1').val())){
				alert("비밀번호 형식이 맞지 않습니다.");	
				$("#pwd1").focus();
				return false;
			}else if($("#mobile").val().length<1) {
				alert("전화번호를 입력하세요");
				$("#mobile").focus();
				return false;
			}else if(!validate_mobile($('#mobile').val())){
				alert("전화번호 형식이 맞지 않습니다.");	
				$("#mobile").focus();
				return false;
			}
		});
		
		
	});
