<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 8/6/18
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Thông tin nhà sản xuất"/>
</jsp:include>

<body>

<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />

    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/manufacture/"/>
                <jsp:param name="pageTitle" value="nhà sản xuất"/>
            </jsp:include>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách nhà sản xuất</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/manufacturer/create" class="btn btn-primary">Thêm</a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Mã</th>
                                <th class="text-center">Nhà sản xuất</th>
                                <th class="text-center">Trang chủ</th>
                                <th class="text-center">Mô tả</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="manufacturer" items="${manufacturers}">
                                    <tr>
                                        <td>${manufacturer.id}</td>
                                        <td>${manufacturer.name}</td>
                                        <td><a href="${manufacturer.url}" target="_blank">${manufacturer.url}</a></td>
                                        <td>${manufacturer.desciption}</td>
                                        <td class="text-center">
                                            <a href="${pageContext.request.contextPath}/admin/manufacturer/update?id=${manufacturer.id}"
                                               class="btn btn-warning btn-xs" data-toggle="tooltip" title="Cập nhật thông tin"><i class="fa fa-pencil"></i></a>
                                            <a href="${pageContext.request.contextPath}/admin/manufacturer/detail?id=${manufacturer.id}"
                                               class="btn btn-success btn-xs" data-toggle="tooltip" title="Xem chi tiết"><i class="fa fa-eye"></i></a>
                                        </td>
                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>


    <!-- /#wrapper -->


</div>
<jsp:include page="../../template/script-tags__admin.jsp">
<jsp:param name="columnDefs" value="
    columnDefs: [

         { width: '350px', targets: 3 }

         ],
         fixedColumns: true,

    "/>
</jsp:include>
</body>
</html>
