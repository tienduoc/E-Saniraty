<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/12/2018
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Chi tiết tài khoản"/>
</jsp:include>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Chi tiết tài khoản
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-user"></i> Tài khoản
                        </li>
                        <li class="active">
                            <i class="fa fa-list"></i> Chi tiết tài khoản
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Thông tin chi tiết tài khoản</h4>
                        </div>
                        <div class="panel-body">
                            <form:form action="/admin/account/detail" modelAttribute="account" method="get">
                                <div class="form-group">
                                    <label>Tên đăng nhập</label>
                                    <input value="${account.username}" type="text" class="form-control" name="userName" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Họ và tên</label>
                                    <input value="${account.fullname}" type="text" class="form-control" name="fullname" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input value="${account.email}" type="email" class="form-control" name="email" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input value="${account.address}" type="text" class="form-control" name="address" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Điện thoại</label>
                                    <input value="${account.phone}" type="text" class="form-control" name="phone" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Vai trò</label>
                                    <input type="text" class="form-control" name="role" value="${account.roleByRoleId.name}" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Trạng thái</label>
                                    <c:choose>
                                        <c:when test="${account.enabled}">
                                            <input type="text" class="form-control" name="status" value="Kích hoạt" disabled>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="text" class="form-control" name="status" value="Đóng" disabled>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="form-group">
                                    <a href="${pageContext.request.contextPath}/admin/account" class="btn btn-default">Quay lại</a>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="/assets/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/assets/js/bootstrap.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="/assets/js/raphael.min.js"></script>
<script src="/assets/js/morris.min.js"></script>
<script src="/assets/js/morris-data.js"></script>

</body>

</html>