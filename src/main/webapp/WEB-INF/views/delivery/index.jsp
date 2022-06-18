<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/13
  Time: 10:01 PMs| Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/delivery" %>

<t:head>
    <meta name="apple-mobile-web-app-title" content="TEST-TEST-TEst">
    <%-- 부트스트랩 --%>
</t:head>
<t:wrapper>
    <%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script src="<c:url value="/delivery/js/main.js"/>"></script>
    <div id="wrap" class="main-width">
        <div id="delivery-delivery"></div>
    </div>
</t:wrapper>