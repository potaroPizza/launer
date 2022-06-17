<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/06/17
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../inc/delivery-top.jsp"%>
    <div id="wrap">
        <c:forEach var="map" items="${list }">
            ${map['NO']} / ${map['GROUPNAME']}
        </c:forEach>
    </div>
</body>
</html>
