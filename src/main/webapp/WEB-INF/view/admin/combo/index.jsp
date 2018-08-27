<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/28/18
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý combo"/>
</jsp:include>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/combo/"/>
                <jsp:param name="pageTitle" value="combo"/>
            </jsp:include>

            <div class="row">
                <div class="col-lg-12 col-md-12">

                    <h4>Danh sách combo</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/combo/create" class="btn btn-primary">Thêm</a>
                    </div>

                    <div class="table-responsive">

                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Mã combo</th>
                                <th class="text-center">Combo</th>
                                <th class="text-center">Đơn giá</th>
                                <th class="text-center">Trạng thái</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>

                            <tbody>

                            <tr>
                                <td>CB1</td>
                                <td>Bồn rửa mặt siêu khủng</td>
                                <td class="text-right">2000000</td>
                                <td class="text-center">Còn hàng</td>

                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/admin/combo/update"
                                       class="btn btn-warning btn-xs">Sửa</a>
                                    <a href="${pageContext.request.contextPath}/admin/combo/detail"
                                       class="btn btn-success btn-xs">Chi tiết</a>
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->


<%@ include file="../../template/script-tags__admin.jsp" %>
</body>
</html>
