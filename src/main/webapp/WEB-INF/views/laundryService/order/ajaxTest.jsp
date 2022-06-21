<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajaxTest.jsp</title>
</head>
<body>

<div id="div1"></div>

	<c:forEach var="map" items="${list }">
	<c:set var="sum" value="${map['no']}"/>
	
	
	</c:forEach>

</body>
</html>