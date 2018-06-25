<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/20/2018
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form action="productImage" modelAttribute="images" method="get">
        <table border="1">
        <c:forEach var="pi" items="${images}">
            <tr>
                <td>${pi.id}</td>
                <td>${pi.productByProductId.id}</td>
                <td>${pi.url}</td>
                <td>${pi.mainPhoto}</td>
            </tr>
        </c:forEach>
        </table>
    </form:form>
</body>
</html>
