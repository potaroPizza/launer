$(function(){
	const contextPath = "http://localhost:9095/launer";
	//const contextPath = "http://p-mp4.iptime.org:9095/launer";
	
	$('#insertBtn').click(function(){
		//alert(contextPath);
		
		var title = $('#title').val();
		var content = $('#content').val();
		
		if(title == ""){
			alert("공지사항의 제목을 입력하세요");
			$('#title').focus;
			return false;
		}
		
		if(content == ""){
			alert("공지사항의 내용을 입력하세요");
			$('#content').focus;
			return false;
		}
		
		$.ajax({
			//url: "<c:url value='/admin/insertNotice'/>",
			url: contextPath + "/admin/insertNotice",
			type: 'GET',
			data: {
				title: title,
				content: content
			},
			dataType: 'json',
			success: function(res){
				var no = res.no;
				var title = res.title
				var content = res.content.replace(/\n/g,"<br>")
				var regdate = res.regdateStr
				var htmls = "";
				//alert(title);
				//alert(content);
			/*
				var info = "제목 : " + res.title + "<br>"
					+ "내용 : " + res.content + "<br>";
			$('#div1').html(info);
		
				var clone = $('#contentRow').clone();
				$('#div1').prepend(clone);
			*/
				htmls += '<div class="row" class="contentRow" style="padding: 10px;">';
				htmls += '	<div class="col-xl-2"></div>';
				htmls += '	<div class="col-xl-8" style="height: 200px; padding: 10px; border: 1px solid #333;">';
				htmls += '		<input type="hidden" class="noticeNo" name="noticeNo" value="' + no +'"/>';
				htmls += '		<label for="exampleFormControlTextarea1" class="form-label">';
				htmls += regdate + ' &nbsp<i class="fa-solid fa-bell"></i></label>';
				htmls += '<button type="button" class="btn-close" aria-label="Close" style="float: right"></button>';
				htmls += '<div class="card mb-4" >';
				htmls += '<div class="card-body" style="height: 130px">';
				htmls += '<span class="cont">';
				htmls += '-<span class="pt">'+ title +'</span>-<br><br>';
	            htmls += '<span class="pc">' + content + '</span>';
	            htmls += '</span>';
	            htmls += '</div>';
	            htmls += '</div>';
	            htmls += '</div>';
	            htmls += '</div>';
				$('#div1').prepend(htmls);
				
				$('#title').val("");
				$('#content').val("");
			},
			error: function(xhr, status, error){
				alert("error : " + error);
			}
		});
	});

	//for 비동기로 생성된 게시글
	$(document).on('click', '.btn-close', function(){
	//$('.btn-close').click(function(){
		
		//.siblings() : 선택한 요소의 형제(sibling) 요소 중에서 지정한 선택자에 해당하는 요소를 모두 선택한다.
		var no = $(this).siblings('.noticeNo').val();
		
		$.ajax({
			//url: "<c:url value='/admin/deleteNotice'/>",
			url: contextPath + "/admin/deleteNotice",
			type: 'GET',
			data: {
				//no: $('.noticeNo').val(),
				no: no,
			},
			dataType: 'json',
			context: this,
			success: function(res){
				var no = res.no
				//$('.btn-close:eq(0)').closest('.row').remove();
				$(this).closest('.row').remove();
			},
			error: function(xhr, status, error){
				alert("error : " + error);
			}
		});
		
	});
});
