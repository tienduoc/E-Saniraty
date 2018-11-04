<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 8/6/18
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Thêm thông tin nhà sản xuất"/>
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
                        Thông tin nhà sản xuất
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-user"></i> Nhà sản xuất
                        </li>
                        <li class="active">
                            <i class="fa fa-user"></i> Thêm thông tin nhà sản xuất
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->


            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Thêm thông tin nhà sản xuất</h4>
                        </div>

                        <div class="panel-body">

                            <form:form action="/admin/manufacturer/create" modelAttribute="newManufacturer" method="post">

                                <div class="form-group">
                                    <label for="id">Mã NSX</label>
                                    <form:input path="id" type="text" name="id" class="form-control" required="required"/>
                                </div>

                                <div class="form-group">
                                    <label for="name">Nhà sản xuất</label>
                                    <form:input path="name" type="text" name="name" class="form-control" required="required"/>
                                </div>

                                <div class="form-group">
                                    <label for="url">Trang chủ</label>
                                    <form:input path="url" type="text" name="url" class="form-control" required="required"/>
                                </div>

                                <div class="form-group">
                                    <label for="desciption">Mô tả</label>
                                    <form:textarea path="desciption" name="desciption" class="form-control" required="required"/>
                                </div>

                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Lưu">
                                    <a href="${pageContext.request.contextPath}/admin/manufacturer" class="btn btn-default">Quay lại</a>
                                </div>
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->

    </div>
</body>
<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=rfoicmvrd1t2oqkkhsvwn39ekcbk2o0dt0slvklxbrdrva1j"></script>
<script>tinymce.init({ selector:'textarea' });</script>
</html>
