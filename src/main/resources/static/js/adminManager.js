
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
	
    //ajax 로 등록
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

