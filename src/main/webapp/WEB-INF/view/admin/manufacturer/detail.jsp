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
    <jsp:param name="title" value="Chi tiết nhà sản xuất"/>
</jsp:include>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Thông tin nhà sản xuất
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-user"></i> Nhà sản xuất
                        </li>
                        <li>
                            <i class="fa fa-user"></i> Xem chi tiết
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Thông tin về nhà sản xuất</h4>
                        </div>
                        <div class="panel-body">
                            <form:form action="/admin/manufacturer/detail" modelAttribute="manufacturer" method="get">
                                <div class="form-group">
                                    <label>Mã</label>
                                    <input value="${manufacturer.id}" type="text" class="form-control" name="id" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Nhà sản xuất</label>
                                    <input value="${manufacturer.name}" type="text" class="form-control" name="name" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Trang chủ</label>
                                    <input value="${manufacturer.url}" type="email" class="form-control" name="url" disabled="true">
                                </div>
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <textarea class="form-control" name="desciption" rows="15" readonly>${manufacturer.desciption}</textarea>
                                </div>

                                <div class="form-group">
                                    <a href="${pageContext.request.contextPath}/admin/manufacturer" class="btn btn-default">Quay lại</a>
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
<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=rfoicmvrd1t2oqkkhsvwn39ekcbk2o0dt0slvklxbrdrva1j"></script>
<script>tinymce.init({ selector:'textarea' });</script>
</html>