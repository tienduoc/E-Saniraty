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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Chi tiết sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb--child__admin.jsp">
                <jsp:param name="parentURL" value="${pageContext.request.contextPath}/admin/product/"/>
                <jsp:param name="parentTitle" value="sản phẩm"/>
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/product/detail"/>
                <jsp:param name="pageTitle" value="Chi tiết sản phẩm"/>
            </jsp:include>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Chi tiết sản phẩm</h4>
                        </div>
                        <div class="panel-body">
                            <form:form action="/admin/product/detail" modelAttribute="product" method="get">
                                <div class="form-group">
                                    <label>Mã sản phẩm</label>
                                    <input type="text" class="form-control" name="productID" value="${product.id}" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <form:input path="name" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Hãng sản xuất</label>
                                    <form:input path="manufacturerByManufacturerId.name" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Nhóm sản phẩm</label>
                                    <form:input path="categoryByCategoryId.name" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Chất liệu</label>
                                    <form:input path="material" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Kích thước</label>
                                    <form:input path="size" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Khối lượng</label>
                                    <form:input path="weight" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng</label>
                                    <form:input path="unitInStock" class="form-control" disabled="true"/>
                                </div>

                                <div class="form-group">
                                    <label>Giá gốc</label>
                                    <fmt:formatNumber type="number" pattern="###,###" value="${product.costPrice}" var="cp"/>
                                    <form:input class="form-control" value="${cp}" path="costPrice" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Giá bán</label>
                                    <fmt:formatNumber type="number" pattern="###,###" value="${product.salePrice}" var="sp"/>
                                    <form:input class="form-control" value="${sp}" path="salePrice" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Tình trạng</label>
                                    <form:input path="enabled" class="form-control" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <form:textarea path="description" class="form-control" rows="6" disabled="true"/>
                                </div>
                                <div class="form-group">
                                    <label>Giới thiệu sản phẩm</label>
                                    <form:textarea path="review" class="form-control" rows="6" disabled="true"/>
                                </div>
                            </form:form>
                        </div>
                        <div class="panel-footer">
                            <a href="${pageContext.request.contextPath}/admin/product" class="btn btn-default">Quay lại</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
            columnDefs: [ {
                targets: 1, // the target for this configuration, 0 it's the first column
                render: function ( data, type, row ) {
                    return data.length > 30 ?
                        data.substr( 0, 30 ) +'…' :
                        data;
                }
            } ],
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
<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=rfoicmvrd1t2oqkkhsvwn39ekcbk2o0dt0slvklxbrdrva1j"></script>
<script>tinymce.init({ selector:'textarea' });</script>
</body>
</html>