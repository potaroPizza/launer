<%--
  Created by IntelliJ IDEA.
  User: p__mp4
  Date: 2022/07/03
  Time: 14:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/delivery" %>

<t:wrapper>
    <script type="text/javascript">
        const boardClass = ${boardClass};
        const categoryNo = "${categoryNo}";
    </script>
    <div class="fixed-margin-top"></div>
    <div id="board-component"></div>
</t:wrapper>