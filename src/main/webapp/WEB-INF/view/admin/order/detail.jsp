<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/17/18
  Time: 00:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Chi tiết đơn đặt hàng"/>
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
                        Trang quản lý đơn đặt hàng
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-archive"></i> Đơn đặt hàng
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Chi tiết đơn đặt hàng
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12 col-md-offset-0">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Chi tiết đơn đặt hàng</h4>
                        </div>
                        <div class="panel-body">
                            <form method="post">
                                <input type="hidden" name="id" value="ID">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Mã đơn hàng</label>
                                            <input type="text" class="form-control" name="productID" value="HD1234" disabled>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Ngày tạo</label>
                                            <input type="text" class="form-control" name="productName" value="21/07/2018" disabled>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Loại khách hàng</label>
                                            <input type="text" class="form-control" name="productName" value="Nhà thầu" disabled>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Tình trạng</label>
                                            <input type="text" class="form-control" name="productName" value="Đang xử lý" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">

                                </div>
                                <div class="form-group">
                                    <label>Khách hàng</label>
                                    <input type="text" class="form-control" name="manufacturer" value="Thân Văn Sử" disabled>
                                </div>

                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input type="text" class="form-control" name="manufacturer" value="CVPM Quang Trung, Quận 12, TP.Hồ Chí Minh" disabled>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Điện thoại</label>
                                            <input type="text" class="form-control" name="manufacturer" value="0942745670" disabled>
                                        </div>
                                        <div class="col-md-9">
                                            <label>Email</label>
                                            <input type="text" class="form-control" name="manufacturer" value="sutv@fpt.edu.vn" disabled>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label>Chi tiết sản phẩm</label>
                                    <div class="table-responsive">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <tr>
                                                <th class="text-center">STT</th>
                                                <th class="text-center">Tên sản phẩm</th>
                                                <th class="text-center">Số lượng</th>
                                                <th class="text-center">Giá bán</th>
                                                <th class="text-center">Thành tiền</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="text-right">1</td>
                                                <td>Vòi Lạnh Lavabo American Standard Sandra W126</td>
                                                <td class="text-right">100</td>
                                                <td class="text-right">700.000 đ</td>
                                                <td class="text-right">700.0000 đ</td>
                                            </tr>
                                            <tr>
                                                <td class="text-right">2</td>
                                                <td>Bồn cầu Caesar</td>
                                                <td class="text-right">15</td>
                                                <td class="text-right">2.000.000 đ</td>
                                                <td class="text-right">14.000.0000 đ</td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="panel-footer">
                            <a href="${pageContext.request.contextPath}/admin/order" class="btn btn-default">Quay lại</a>
                        </div>
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

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</body>
</html>
