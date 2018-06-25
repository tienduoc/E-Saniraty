<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/22/2018
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Upload Product Image</title>
</head>
<body>
<form:form action="upload?${_csrf.parameterName}=${_csrf.token}" modelAttribute="proImage" method="post" enctype="multipart/form-data">
    <input type="file" name="file" accept="image/gif, image/jpeg, image/png" required/>
    <input type="submit" value="Upload"/>
    <p>${result}</p>
</form:form>
</body>
</html>
