
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

	 var formData = $("#adminAdd").serialize();
	 var officeNo = $("#office").val();
	alert(officeNo);
	
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
			alert("체크됨");
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
			alert("체크해제됨");
			$('#commonTotal').show();	
			location.href ="/launer/admin/users";
		}
	});
	
});
	
function appenToTable(managerMap){

    let $cellsOfRow = $(
    	"<tr>"+		
        "<td>" + managerMap.NO + "</td>" +
        "<td>" + managerMap.NAME + "</td>" +
        "<td>" + managerMap.EMAIL + "</td>" +
        "<td>" + managerMap.HP + "</td>"+
        "<td>" + managerMap.OFFICE_NAME + "</td>"+
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
	       "<td>" + userVo.outDate + "</td>"+
	       "<td>   </td>"+"<tr>"
	   );
	     $("#usersTbody").append($cellsOfRow);
	}
}

