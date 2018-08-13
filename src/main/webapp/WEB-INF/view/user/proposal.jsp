<%--
  Created by IntelliJ IDEA.
  User: SYSTEM
  Date: 8/11/2018
  Time: 6:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="i" value="0"/>
<c:forEach var="sol" items="${solutionList}">
    ${sol} <br>
    <%--<c:forEach var="p" items="${sol.getValues()}">--%>
        <%--${p.getValue().getId()} <br>--%>
        <%--${p.getValue().getName()}--%>
    <%--</c:forEach>--%>
</c:forEach>
${noSolution}
</body>
</html>
