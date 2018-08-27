<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/13/2018
  Time: 1:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/head-admin_tag.jsp">
    <jsp:param name="title" value="Thêm danh mục sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/nav-tag__admin.jsp" />

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/breakcrumb--child__admin.jsp">
                <jsp:param name="parentURL" value="${pageContext.request.contextPath}/admin/category/"/>
                <jsp:param name="parentTitle" value="danh mục sản phẩm"/>
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/category/create"/>
                <jsp:param name="pageTitle" value="Thêm danh mục sản phẩm"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Thêm nhóm sản phẩm</h4>
                        </div>
                        <div class="panel-body">
                            <form:form action="/admin/category/create" modelAttribute="category" method="post">
                                <div class="form-group">
                                    <label>Nhóm sản phẩm cha</label>
                                    <select name="parentId" style="display:block">
                                        <c:forEach var="category" items="${allCategory}">
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Tên nhóm</label>
                                    <form:input type="text" class="form-control" path="name" placeholder="Bồn tắm" required="required" />
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
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value=""/>
</jsp:include>


</body>

</html>
