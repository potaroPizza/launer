
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
        success: function (userVo) {
			appenToTable(userVo);
        },
        error: function() {
            alert("관리자 등록실패");
        }
    });
    
    
    
    
    //탈퇴회원만 보기
     var checkIsTrue =true;
	 $('#getWithdraw').change(function() {
		 checkIsTrue= $("input:checkbox[id='getWithdraw']").is(":checked");
	});
	
	if(checkIsTrue){
		
	alert("체크됨");	
	var withdrawParam ="탈퇴회원 불러오기";
	$.ajax({
		   cache : false,
		   url: '/launer/admin/getWithdrawUser',
		   type: 'get', 
		   data: withdrawParam,

		   success: function (withdrawList) {
		       appenToWithdraw(withdrawList);
		   },
		   error: function() {
		       alert("탈퇴회원 조회 실패");
		   }
		});
	}

});
	});
	
	function appenToTable(userVo){

	    let $cellsOfRow = $(
	    	"<tr>"+		
	        "<td>" + userVo.no + "</td>" +
	        "<td>" + userVo.name + "</td>" +
	        "<td>" + userVo.email + "</td>" +
	        "<td>" + userVo.hp + "</td>"+
	        "<td>" + userVo.office + "</td>"+
	        "<td><a href="+ +">삭제</a></td>"+"<tr>"
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
