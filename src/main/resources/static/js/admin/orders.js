$(function(){
	//const contextPath = "http://localhost:9095/launer";
	const contextPath = "http://p-mp4.iptime.org:9095/launer";
	
	//체크박스 관련
	var chkBox = $("tbody input[type=checkbox]");
	
	$("#chkAll").click(function() {
		chkBox.prop("checked", this.checked);	// chkAll의 checked의 값을 따라감
	})
	
	//개별 체크박스 클릭시, 모두 체크되어있지 않으면, 최상위 체크박스 해제 
	chkBox.click(function() {
		var total = chkBox.length;
		var checked = $("tbody input[type=checkbox]:checked").length;

		if(total != checked) {
			$("#chkAll").prop("checked", false);
		} else {
			$("#chkAll").prop("checked", true); 
		}
	}); 
	
	//주문 다중 처리
	$('#btMultiUpdate').click(function(){
		//alert(contextPath);
		
		if(confirm("정말로 배송대기 처리를 하시겠습니까?")){
			var count = $('tbody input[type=checkbox]:checked').length;

			if(count > 0) {
				var items = $('input[type=checkbox]:checked').parent().siblings('.tdStatus').text();
				var str = items.split(" ");
				var bool = true;
				str.forEach(function(item, index){
					if(index != $('input[type=checkbox]:checked').length){
						if(item !== "세탁중"){
							bool = false;
						}
					}
					
				});
				console.log(bool);
				if(!bool){
					alert("세탁중인 상태의 주문만 배송대기 처리할 수 있습니다.");
					return false;
				}
				
				$('form[name="frmList"]').prop('action',
						contextPath + '/admin/ordersUpdateMulti');
				$('form[name="frmList"]').submit();
			} else {
				alert('배송대기 처리할 주문을 먼저 선택해주세요.');
			}	
		} else{
			return false;
		}
		
	});
	
	//엑셀파일로 받기
	$('#btnReadExcel').click(function(){
		//alert(contextPath);
		
		if(confirm("주문들을 엑셀로 받으시겠습니까?")){
			location.href = contextPath + "/admin/excel";
		} else{
			return false;
		}
		
	});
	
	// 검색테이블의 달력 유효성 검사
	$("#od_submit").click(function(){
		if($("#startDay").val().length<1){
			alert("주문 시작일을 입력하세요");
			$("#startDay").focus();
			return false;
		}
		if($("#endDay").val().length<1){
			alert("주문 종료일을 입력하세요");
			$("#endDay").focus();
			return false;
		}
	});
	
	/*
	if($('input[name=countPerPage]').val() == ''){
		$('input[name=countPerPage]').val(countPerPage);
	}
	*/
	
	//페이지 당 레코드 수 설정
	$('#selectCountPerPage').on("change", function(){
		$('input[name=countPerPage]').val($(this).val());
		$('form[name=frmSearch]').submit();
	});
	
	// 달력관련 시작		
	$("#startDay").datepicker({
		dateFormat:'yy-mm-dd',
		changeYear:true,
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	$("#endDay").datepicker({
		dateFormat:'yy-mm-dd',
		changeYear:true,
		dayNamesMin:['일','월','화','수','목','금','토'],
		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	});
	
	$("#btnToday").click(function(){
		$.setDate();	//오늘
	});
	
	$("#btnWeek").click(function(){
		$.setDate(7, 'D');	//1주일전
	});
	
	$("#btnMonth1").click(function(){
		$.setDate(1, 'M');	//1개월전
	});
	// 달력관련 끝
	
});	//ready

// 달력관련 시작
/*
$.setToday = function(){	
	if($("#startDay").val()==null || $("#startDay").val()==""){
		var today = new Date();
		var curDate = findDate(today);
		$("#startDay").val(curDate);
		$("#endDay").val(curDate);
	}
}
*/

$.setDate= function(term, type){	// jquery함수 표현식
	//endDay 기준으로 7일을 빼거나 1개월이나 3개월을 빼서 startDay에 셋팅
	// var d = new Date(년, 월, 일);	=> 날짜 데이터 객체 생성
	var str = $("#endDay").val().split("-"); // 2022-06-30 => 2022,06,30
	var d = new Date(str[0], str[1]-1, str[2]);	// 2022,5,30
	//=> 월은 0~11이라, -1 해줘야함
	
	if(type=="D") {
		d.setDate(d.getDate()-term); //7일전
	} else if(type=="M") {
		d.setMonth(d.getMonth()-term); //1개월, 3개월전
	}
		$("#startDay").val($.findDate(d));
}

$.findDate = function(date) {	// jquery함수 표현식
	return date.getFullYear() + "-" + formatDate(date.getMonth()+1)
		+ "-" + formatDate(date.getDate());
}

function formatDate(date) {		// 순수 js함수 선언식
	var day = date;
	if(date < 10) {
		day = "0" + day;
	}
	return day;
}
// 달력관련 끝

//페이지 번호를 클릭했을때
function pageFunc(curPage){
	//페이지 번호를 클릭했을 때 처리
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}