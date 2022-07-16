
 $(function() {
		 var tabNo = $('#tabNo').val();
		 if(tabNo==1){	 
			 $('#consumer').click();
		 }else if (tabNo==2){
			 $('#delivery').click(); 
		 }else{
			 $('#branch-manager').click();
		 }
		 
		 $("#tabNo").change(function(){
			 $('.paramInput').val(''); 
		 }); 
		 	 
	$('#wr_submit').click(function() {
		if($.trim($('#name').val()) == ""){
			alert("이름을 입력해 주세요.");
			$('#name').focus();
			event.preventDefault();
			return false;
		}else if(!validate_email($("#email").val())) {
			alert("이메일 형식에 맞게 입력해 주세요");
			$("#email").focus();
			event.preventDefault();
			return false;
		}else if($("#pwd").val().length<1) {
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			event.preventDefault();
			return false;
		}else if(!validate_pwd($("#pwd").val())) {
			alert("8자 이상의 문자와 특수문자를 포함한 비밀번호가 필요합니다");
			$("#pwd").focus();
			event.preventDefault();
			return false;
		}else if($("#pwd").val()!=$("#pwd2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pwd2").focus();
			event.preventDefault();
			return false;
		}else if(!validate_hp($('#hp').val())){
			alert("전화번호는 숫자만 가능합니다");
			$("#hp").focus();
			event.preventDefault();
			return false;
		}
		
		
	 var formData = $("#adminAdd").serialize();
	 var officeNo = $("#office").val();
	
    //ajax 관리자추가
    $.ajax({
    	cache : false,
        url: '/launer/admin/insertManager',
        type: 'POST',
        data: formData,officeNo,
        success: function (managerMap) {
			appenToTable(managerMap);
        },
        error: function() {
            alert("관리자 등록실패");
        }
    });
});


    //탈퇴회원만 보기
	 $('#getWithdraw').change(function() {
		 checkIsTrue= $("input:checkbox[id='getWithdraw']").is(":checked");

		if(checkIsTrue){	
			$('#commonTotal').hide();	
			$.ajax({
				   cache : false,
				   url: '/launer/admin/getWithdrawUser',
				   type: 'get', 
				   data: {},
		
				   success: function (withdrawList) {
				       appenToWithdraw(withdrawList);
				   },
				   error: function() {
				       alert("탈퇴회원 조회 실패");
				   }
				});
		}else{
			$('#commonTotal').show();	
			location.href ="/launer/admin/users";
		}
	});
	
	//이메일중복확인
		$('#btnChkEmail').click(function(){
		var ctxPath="/launer";
		var email=$('#email').val();

		window.open(ctxPath+"/user/checkEmail?email="+email,"emailcheck",
			"width=400,height=350,location=yes,resizable=yes,top=100,left=50");
	});
	
});
	
function appenToTable(managerMap){

    let $cellsOfRow = $(
    	"<tr>"+		
        "<td>" + managerMap.NO + "</td>" +
        "<td>" + managerMap.NAME + "</td>" +
        "<td>" + managerMap.EMAIL + "</td>" +
        "<td>" + managerMap.HP + "</td>"+
        //여기
        "<td><span>" + managerMap.OFFICE_NAME + "</span></td>"+
        "<td><input type='button' value='삭제' onclick=''></td>"+"<tr>"
    );
	  $("#managerTbody").append($cellsOfRow);
	  $('#addAdmin').modal("hide");
  
}

function appenToWithdraw(withdrawList){
	   $("#usersTbody").empty();
	   
	   for(let userVo of withdrawList){
	   let $cellsOfRow = $(
	       "<tr>"+		
	       "<td>" + userVo.no + "</td>" +
	       "<td>" + userVo.name + "</td>" +
	       "<td>" + userVo.email + "</td>" +
	       "<td>" + userVo.hp + "</td>"+ 
	       "<td>" + "<fmt:formatDate value='${"+userVo.lastAccessDate+"}' pattern ='yyyy-MM-dd'/>" + "</td>"+
	       "<td>   </td>"+"<tr>"
	   );
	     $("#usersTbody").append($cellsOfRow);
	}
}

function validate_email(email){
	var pattern = new RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	return pattern.test(email);
}
function validate_pwd(pwd){
	var pattern = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!%*#?&])[A-Za-z\d@!%*#?&]{8,}$/);
	return pattern.test(pwd);
}
function validate_hp(hp){
	var pattern = new RegExp(/^([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})$/);
	return pattern.test(hp); //정규식과 일치하면 true
	/* 정규식 /^[0-9]*$/g
    0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
    닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복
    */
}
