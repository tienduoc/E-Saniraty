<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/12/2018
  Time: 7:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/head-admin_tag.jsp">
    <jsp:param name="title" value="Chi tiết danh mục sản phẩm"/>
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
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/category/detail"/>
                <jsp:param name="pageTitle" value="Chi tiết danh mục sản phẩm"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Chi tiết nhóm sản phẩm</h4>
                        </div>

                        <form:form action="/admin/category/detail" modelAttribute="category" method="get">
                        <div class="panel-body">
                            <div class="form-group">
                                <label>Mã nhóm</label>
                                <input type="text" class="form-control" name="cateID" value="${category.id}" disabled>
                            </div>
                            <c:if test="${category.parentId != null}">
                                <div class="form-group">
                                    <label>Tên nhóm sản phẩm cha</label>
                                    <input type="text" class="form-control" name="cateName" value="${category.categoryByParentId.name}" disabled>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label>Tên nhóm</label>
                                <input type="text" class="form-control" name="cateParentID" value="${category.name}" disabled>
                            </div>
                        </div>
                        </form:form>
                        <div class="panel-footer">
                            <a href="${pageContext.request.contextPath}/admin/category" class="btn btn-default">Quay lại</a>
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