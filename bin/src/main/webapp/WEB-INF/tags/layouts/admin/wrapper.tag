<%@tag description="Simple Wrapper Tag" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>${empty htmlTitle?"런드리고 관리자 페이지":htemlTitle}</title>
    <meta name="description" content="${empty htmlDescription?"런드리고 관리자 페이지 설명":htmlDescription}" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/d4af3bb512.js" crossorigin="anonymous"></script>
    <%--
    .tag 부분에 들어가는 내용은 공통되는 부분은 include, 내용만 바뀌는 부분은 doBody안에 넣는다
    doBody의 내용은 Controller에 의해서 리턴되는 Jsp문서 taglib의 의해 해당 .tag 파일이 호출된다
    jsp 문서가 가지는 reque
    --%>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="${path}/launer/css/app.css">
	<script src="<c:url value="/js/jquery-3.6.0.min.js"/>" type="text/javascript" text="javascript"></script>
    <jsp:include page="/WEB-INF/tags/layouts/admin/head.tag" flush="true"/>
</head>
<body class="admin-page">
    <jsp:include page="/WEB-INF/tags/partials/admin/header.jsp" flush="true"/>
    <div class="main-section">
        <jsp:include page="/WEB-INF/tags/partials/admin/side-bar.jsp" flush="true"/>
        <jsp:doBody/>
        <jsp:include page="/WEB-INF/tags/partials/admin/footer.jsp" flush="true"/>
    </div>
    <script src="${path}/launer/js/app.js"></script>
</body>
</html>