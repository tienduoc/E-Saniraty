<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/14/18
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý hình ảnh sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Trang quản lý hình ảnh
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Hình ảnh
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách ảnh sản phẩm</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/image/upload" class="btn btn-primary">Thêm ảnh</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Mã</th>
                                <th class="text-center">Hình ảnh</th>
                                <th class="text-center">Sản phẩm</th>
                                <th class="text-center">Tên tập tin</th>
                                <th class="text-center">Ảnh chính</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="img" items="${images}">
                                <tr>
                                    <td class="text-center">${img.id}</td>
                                    <td class="text-center">
                                        <img src="${pageContext.request.contextPath}/assets/img/products/${img.url}" alt="" style="width: 7rem; height:auto; align-self: auto;">
                                    </td>
                                    <td class="text-center">${img.productId}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/assets/img/products/${img.url}">${img.url}</a>
                                    </td>
                                    <td class="text-center">
                                        <c:if test="${img.mainPhoto}">
                                            Ảnh đại diện
                                        </c:if>
                                    </td>
                                    <td class="text-right">
                                        <c:if test="${!img.mainPhoto}">
                                            <a href="${pageContext.request.contextPath}/admin/image/setMainPhoto?img_url=${img.url}&product_id=${img.productId}" class="btn btn-primary btn-xs">Ảnh đại diện</a>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/admin/image/update?img_url=${img.url}" class="btn btn-warning btn-xs">Sửa</a>
                                        <a href="${pageContext.request.contextPath}/admin/image/delete?img_url${img.url}" class="btn btn-danger btn-xs">Xóa</a>
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
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- Datatables JavaScript -->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        var table = $('#example').DataTable({
            "order": [[1, "desc"]],
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_ mục",
                "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix": "",
                "sSearch": "Tìm:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sPrevious": "Trước",
                    "sNext": "Tiếp",
                    "sLast": "Cuối"
                }
            }
        });
    });
</script>
</body>
</html>
