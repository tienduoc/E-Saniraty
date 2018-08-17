<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 8/15/2018
  Time: 2:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=rfoicmvrd1t2oqkkhsvwn39ekcbk2o0dt0slvklxbrdrva1j"></script>
    <script>tinymce.init({ selector:'textarea' });</script>
</head>
<body>
    <form:form action="/admin/article/create" method="post" modelAttribute="article">
        <form:textarea path="aricleUrl"/>
        <input type="submit" value="Gui">
    </form:form>
</body>
</html>
