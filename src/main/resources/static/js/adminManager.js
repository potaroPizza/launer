
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
	});

