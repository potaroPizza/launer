$(function(){
	//유효성
	$('form[name=joinfrm]').submit(function(){
		if($.trim($('#name').val()) == ""){
			alert("이름을 입력해 주세요.");
			$('#name').focus();
			event.preventDefault();
		}else if(!validate_email($("#email").val())) {
			alert("이메일 형식에 맞게 입력해 주세요.");
			$("#email").focus();
			event.preventDefault();
		}else if(classNo === 1) {
			if($('#chkEmail').val()!='Y'){
				alert("이메일 중복확인해야 합니다.");
				$("#btnChkEmail").focus();
				event.preventDefault();
			}
		}else if(classNo === 2) {
			if($('#chkDmail').val()!='Y'){
				alert("이메일 중복확인해야 합니다.");
				$("#btnChkDmail").focus();
				event.preventDefault();
			}
		}else if($("#pwd").val().length<1) {
			alert("비밀번호를 입력하세요.");
			$("#pwd").focus();
			event.preventDefault();
		}else if(!validate_pwd($("#pwd").val())) {
			alert("8~16자의 숫자와 문자, 특수문자를 포함한 비밀번호가 필요합니다.");
			$("#pwd").focus();
			event.preventDefault();
		}else if($("#pwd").val()!=$("#pwd2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwd2").focus();
			event.preventDefault();
		}else if(classNo === 1) {
			if($("#addressDetail").val().length<1) {
				alert("상세주소를 입력하세요.");
				$("#addressDetail").focus();
				event.preventDefault();
			}
		}else if(!validate_hp($('#hp').val())){
			alert("전화번호양식에 맞게 입력하세요.");
			$("#hp").focus();
			event.preventDefault();
		}else if(classNo === 2) {
			if($("#accHolder").val().length<1) {
				alert("계좌주 성명을 입력하세요.");
				$("#accHolder").focus();
				event.preventDefault();
			}else if($("#accNum").val().length<1) {
				alert("계좌번호를 입력하세요.");
				$("#accNum").focus();
				event.preventDefault();
			}else if(!validate_accNum($("#accNum").val())) {
				alert("계좌번호는 숫자만 입력 가능합니다.");
				$("#accNum").focus();
				event.preventDefault();
			}
		}else if(!$('#agreechk').is(':checked')){
			alert('약관에 동의해야 회원가입을 진행할 수 있습니다.');
			$('#agreechk').focus();
			event.preventDefault();
		}else if(!$('#privacychk').is(':checked')){
			alert('개인정보 수집에 동의해야 회원가입을 진행할 수 있습니다.');
			$('#privacychk').focus();
			event.preventDefault();
		}else if(!$('#privacychk2').is(':checked')){
			alert('개인정보 제공에 동의해야 회원가입을 진행할 수 있습니다.');
			$('#privacychk2').focus();
			event.preventDefault();
		}
	});
	//에러메시지
	$('form[name=joinfrm] #email').keyup(function(){
		if(!validate_email($('#email').val())){
			$('.error_message_box').eq(0).text("이메일 형식에 맞게 입력해 주세요").css("color","red");
		}else{
			$('.error_message_box').eq(0).text("")
		}
	})
	$('form[name=joinfrm] #pwd').keyup(function(){
		if(!validate_pwd($('#pwd').val())){
			$('.error_message_box').eq(1).text("8~16자의 숫자와 문자, 특수문자를 포함한 비밀번호가 필요합니다").css("color","red");
		}else{
			$('.error_message_box').eq(1).text("")
		}
	})
	$('form[name=joinfrm] #pwd2').keyup(function(){
		if($("#pwd").val()!=$("#pwd2").val()){
			$('.error_message_box').eq(2).text("비밀번호가 일치하지 않습니다").css("color","red");
		}else{
			$('.error_message_box').eq(2).text("")
		}
	})
	$('form[name=joinfrm] #addressDetail').keyup(function(){
		if(classNo === 1) {
			if($('#addressDetail').val()==""){
				$('.error_message_box').eq(4).text("상세주소는 수거/배송시 필수 정보입니다").css("color","red");
			}else{
				$('.error_message_box').eq(4).text("")
			}
		}
	})
	$('form[name=joinfrm] #accNum').keyup(function(){
		if(classNo === 2) {
			if(!validate_accNum($("#accNum").val())){
				$('.error_message_box').eq(3).text("계좌번호는 숫자만 입력 가능합니다").css("color","red");
			}else{
				$('.error_message_box').eq(3).text("")
			}
		}
	})
	$('form[name=joinfrm] #hp').keyup(function(){
		if(classNo === 1) {
			if(!validate_hp($("#hp").val())){
				$('.error_message_box').eq(5).text("전화번호양식에 맞게 입력하세요").css("color","red");
			}else{
				$('.error_message_box').eq(5).text("")
			}
		}else if(classNo === 2) {
			if(!validate_hp($("#hp").val())){
				$('.error_message_box').eq(4).text("전화번호양식에 맞게 입력하세요").css("color","red");
			}else{
				$('.error_message_box').eq(4).text("")
			}
		}
	})
	
	//중복버튼 클릭시
	$('#btnChkEmail').click(function(){
		var ctxPath="/launer";
		var email=$('#email').val();

		window.open(ctxPath+"/user/checkEmail?email="+email,"emailcheck",
			"width=400,height=350,location=yes,resizable=yes,top=100,left=50");
	});
	$('#btnChkDmail').click(function(){
		var ctxPath="/launer";
		var email=$('#email').val();

		window.open(ctxPath+"/delivery/checkDmail?email="+email,"Dmailcheck",
			"width=400,height=350,location=yes,resizable=yes,top=100,left=50");
	});

	$('#btnChkHp').click(function(){
		var ctxPath="/launer";
		var hp=$('#hp').val();

		window.open(ctxPath+"/user/checkHp?hp="+hp,"Hpcheck",
			"width=500,height=350,location=yes,resizable=yes,top=100,left=50");
	});
	$('#btnChkDhp').click(function(){
		var ctxPath="/launer";
		var hp=$('#hp').val();

		window.open(ctxPath+"/delivery/checkDhp?hp="+hp,"Dhpcheck",
			"width=400,height=350,location=yes,resizable=yes,top=100,left=50");
	});
	//약관
	$('input[name="agreeAllchk"]').click(function() {
		$("input[type=checkbox]").prop("checked", this.checked);
	});

});

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
			document.getElementById("addressDetail").focus();
			
			chkAddress(addr);
			coorSet(addr);
		}
	}).open();
}
const chkAddress = (address) => {
	$.ajax({
		url:"/launer/user/chkAddress",
		type:"get",
		data:`address=${address}`,
		success:function(res){
			var msg="";
			console.log(res);
			if(res.SUCCESS){  
				msg="서비스 지원 지역입니다.";
				$('#serviceError').html(msg).css("color","#01DF01");
			}else{ 						
				msg="서비스 미지원 지역입니다.";
				$('#serviceError').html(msg).css("color","red");
			}
		},
		error:function(xhr, status, error){
			alert('error! : '  +error);
		}
	});
};

function validate_email(email){
	var pattern = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	return pattern.test(email);
}
function validate_pwd(pwd){
	var pattern = new RegExp(/^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/);
	return pattern.test(pwd);
}
function validate_accNum(accNum){
	var pattern = new RegExp(/^[0-9]*$/g);
	return pattern.test(accNum);
}
function validate_hp(hp){
	var pattern = new RegExp(/^([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})$/);
	return pattern.test(hp); //정규식과 일치하면 true
	/* 정규식 /^[0-9]*$/g
    0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
    닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
    */
}

function coorSet(addr) {
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(addr, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
	    document.querySelector("input[name=lonX]").value = result[0].y;
	    document.querySelector("input[name=latY]").value = result[0].x;
	 }
    });
};
	