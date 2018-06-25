<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/18/2018
  Time: 5:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
</head>
<body>
    <%--Product form--%>
    <form:form id="product" action="/product/create" modelAttribute="product" method="post">
        <%--Manùacturer--%>
        Manufacturer
        <select name="manufacturerId" required>
            <option value="">Select</option>
            <c:forEach var="m" items="${manufacturers}">
                <option value="${m.id}">${m.name}</option>
            </c:forEach>
        </select>
        <br>
        <%--Category--%>
        Category
        <select name="categoryId" required>
            <option value="">Select</option>
            <c:forEach var="c" items="${categories}">
                <option value="${c.id}">${c.name}</option>
            </c:forEach>
        </select>
        <br>
        <%--Product attributes--%>
        ID: <form:input path="id"/>
        <br>
        Name: <form:input path="name"/>
        <br>
        Cost price: <form:input path="costPrice"/>
        <br>
        Sale price: <form:input path="salePrice"/>
        <br>
        Material: <form:input path="material"/>
        <br>
        Size: <form:input path="size"/>
        <br>
        Weight: <form:input path="weight"/>
        <br>
        Description: <form:input path="description"/>
        <br>
        <form:hidden id="imageForm" path="enabled" value="true"/>
        <br>
    </form:form>

    <%--Image form--%>
    <form:form id="image" action="/product/create" modelAttribute="images" enctype="multipart/form-data" method="post">
        Hình : <input type="file" name="files" multiple="multiple" accept=".jpg,.jpeg,.png,.gif"/><br>
        <%--Hinh 2: <input type="file" name="image2" accept=".jpg,.jpeg,.png,.gif"/><br>--%>
        <%--Hinh 3: <input type="file" name="image3" accept=".jpg,.jpeg,.png,.gif"/><br>--%>
        <%--Hinh 4: <input type="file" name="image4" accept=".jpg,.jpeg,.png,.gif"/><br>--%>
    </form:form>
    <input type="submit" value="Save" />

</body>
</html>
