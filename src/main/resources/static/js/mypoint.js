/**
 * mypoint.jsp 마이포인트 페이지
 */
 
 window.onload = function() {
	
	const pointRow = document.querySelectorAll(".mypoint_table-row");
	const pointColor =  document.querySelectorAll(".point_cal");
	
	pointRow.forEach((item, idx) => {
		let exp = item.childNodes[7].innerText.charAt(0);
		let exp2 = item.childNodes[7].innerText;
		
		let resText = "";
		let resText2 ="+"
		if(exp === "-") {
			resText = "포인트 사용";
			//pointRow[idx].childNodes[5].style.color="red";
			$(item).find(".mypoint_col-3").css("color", "#FF0000");
			$(item).find(".mypoint_col-4").css("color", "#FF0000");
		}else {
			resText = "포인트 적립";
			//pointRow[idx].childNodes[5].style.color="green";
			pointRow[idx].childNodes[7].innerText = resText2+item.childNodes[7].innerText;
			$(item).find(".mypoint_col-3").css("color", "#01DF3A");
			$(item).find(".mypoint_col-4").css("color", "#01DF3A");
		}
		pointRow[idx].childNodes[5].innerText = resText; 
		
	})
	
}
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}