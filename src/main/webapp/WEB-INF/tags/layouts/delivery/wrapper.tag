<%@tag description="Simple Wrapper Tag" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>${empty htmlTitle?"Launer Delivery":htmlTitle}</title>
    <meta name="description" content="${empty htmlDescription?"런드리고 설명":htmlDescription}" />
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <link rel="stylesheet" href="${path}/launer/css/app.css">
    <script src="https://kit.fontawesome.com/d4af3bb512.js" crossorigin="anonymous"></script>
<%--    <jsp:include page="/WEB-INF/tags/layouts/user/head.tag" flush="true"/>--%>
    <script src="<c:url value="/js/jquery-3.6.0.min.js"/>" type="text/javascript" text="javascript"></script>
    <script src="<c:url value="/js/jquery-ui.min.js"/>" type="text/javascript" text="javascript"></script>
    <script src="<c:url value="/js/jquery.animate-shadow-min.js"/>" type="text/javascript" text="javascript"></script>
    <script src="<c:url value="/js/delivery-fixed.js"/>"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2105ed82df9c00048785f53fbd42044d"></script>
</head>
<body class="delivery-section">
<jsp:include page="/WEB-INF/tags/partials/delivery/header.jsp" flush="true"/>
<jsp:doBody/>
<%-- 개별로 필요한 js 파일은 자신의 view(jsp) 하단에 넣으세요. --%>
<jsp:include page="/WEB-INF/tags/partials/delivery/footer.jsp" flush="true"/>
<script src="${path}/launer/js/app.js"></script>
</body>
</html>