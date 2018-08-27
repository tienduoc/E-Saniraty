<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/11/2018
  Time: 11:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý danh mục sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/nav-tag__admin.jsp" />

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/category/"/>
                <jsp:param name="pageTitle" value="danh mục sản phẩm"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách nhóm sản phẩm</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/category/create" class="btn btn-primary">Thêm</a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-left">Mã nhóm</th>
                                <th class="text-left">Tên nhóm sản phẩm</th>
                                <th class="text-left">Thuộc nhóm cấp trên</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cat" items="${categories}">

                            <tr>
                                <td>${cat.id}</td>
                                <td>${cat.name}</td>
                                <td>${cat.categoryByParentId.name}</td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/admin/category/update?id=${cat.id}" class="btn btn-warning btn-xs" data-toggle="tooltip" title="Cập nhật thông tin"><i class="fa fa-pencil"></i></a>
                                    <a href="${pageContext.request.contextPath}/admin/category/detail?id=${cat.id}" class="btn btn-success btn-xs" data-toggle="tooltip" title="Xem chi tiết"><i class="fa fa-eye"></i></a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>

    </div>

</div>
<!-- /#wrapper -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value="
            columnDefs: [
            { width: '100px', targets: 0 },
         { width: '100px', targets: 3 }
         ],
         fixedColumns: true,
"/>
</jsp:include>
</body>
</html>
