<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/12/2018
  Time: 8:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/head-admin_tag.jsp">
    <jsp:param name="title" value="Cập nhật danh mục sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/nav-tag__admin.jsp" />

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb--child__admin.jsp">
                <jsp:param name="parentURL" value="${pageContext.request.contextPath}/admin/category/"/>
                <jsp:param name="parentTitle" value="danh mục sản phẩm"/>
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/category/update"/>
                <jsp:param name="pageTitle" value="Cập nhật danh mục sản phẩm"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Cập nhật nhóm sản phẩm</h4>
                        </div>
                        <div class="panel-body">
                            <form:form action="/admin/category/update" modelAttribute="category" method="post">
                            <input type="hidden" name="id" value="${category.id}">
                                <div class="form-group">
                                    <label>Nhóm sản phẩm cha</label>
                                    <select name="parentId" style="display:block">
                                        <c:forEach var="cat" items="${allCategory}">
                                            <option value="${cat.id}" ${cat.id == category.categoryByParentId.id ? 'selected = "selected"' : ''}>${cat.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="cateName">Mã nhóm sản phẩm cha</label>
                                    <input type="text" class="form-control" name="cateName" value="${category.id}" disabled>
                                </div>
                                <div class="form-group">
                                    <label for="cateName">Tên nhóm</label>
                                    <form:input path="name" type="text" class="form-control" name="cateName" required="required"/>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Lưu">
                                    <a href="${pageContext.request.contextPath}/admin/category" class="btn btn-default">Quay lại</a>
                                </div>
                                </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value=""/>
</jsp:include>

</body>
</html>