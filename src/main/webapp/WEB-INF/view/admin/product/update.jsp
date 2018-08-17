<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/18/2018
  Time: 6:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Cập nhật sản phẩm"/>
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
                        Cập nhật sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-archive"></i> Sản phẩm
                        </li>
                        <li class="active">
                            <i class="fa fa-pencil"></i> Cập nhật sản phẩm
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Cập nhật sản phẩm</h4>
                        </div>
                        <div class="panel-body">
                                <form:form action="/admin/product/update" modelAttribute="product" method="post">
                                    <input type="hidden" name="id" value="${product.id}">
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label>Mã sản phẩm</label>
                                        <input value="${product.id}" type="text" class="form-control" name="productID" disabled="true">
                                    </div>
                                    <div class="col-md-4">
                                        <label>Tên sản phẩm</label>
                                        <form:input path="name" type="text" class="form-control" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Hãng sản xuất</label>
                                        <select name="manufacturerId" required style="display:block; height: 3.5rem; width: 100%;">
                                        <c:forEach var="m" items="${manufacturers}">
                                            <option value="${m.id}" ${m.id == product.manufacturerByManufacturerId.id ? 'selected = "selected"' : ''}>${m.name}</option>
                                        </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Danh mục</label>
                                            <select name="categoryId" required style="display:block; height: 3.5rem; width: 100%;">
                                            <c:forEach var="c" items="${categories}">
                                                <option value="${c.id}" ${c.id == product.categoryByCategoryId.id ? 'selected = "selected"' : ''}>${c.name}</option>
                                            </c:forEach>
                                            </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-3">
                                        <label>Chất liệu</label>
                                        <form:input path="material" type="text" class="form-control" name="material" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Kích thước</label>
                                        <form:input path="size" type="text" class="form-control" name="size" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Khối lượng</label>
                                        <form:input path="weight" class="form-control" name="weight" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Số lượng</label>
                                        <form:input path="unitInStock" type="number" class="form-control" name="unitInStocks" />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label>Giá gốc</label>
                                        <fmt:parseNumber type="number" value="${product.costPrice}" var="cp"/>
                                        <form:input path="costPrice" value="${cp}" class="form-control" />
                                    </div>
                                    <div class="col-md-2">
                                        <label>Giá bán</label>
                                        <fmt:formatNumber pattern="###" value="${product.salePrice}" var="sp"/>
                                        <form:input path="salePrice" value="${sp}" class="form-control"/>
                                    </div>
                                    <%--<div class="col-md-2">--%>
                                        <%--<label>Ratio</label>--%>
                                        <%--<form:input path="minRatio" class="form-control" name="minRatio" />--%>
                                    <%--</div>--%>
                                    <%--<div class="col-md-2">--%>
                                        <%--<label>Ratio Contractor</label>--%>
                                        <%--<form:input path="raitoForContractor" class="form-control" name="minRatioForContractor" />--%>
                                    <%--</div>--%>
                                    <div class="col-md-1">
                                        <label>Kích hoạt</label>
                                        <form:checkbox path="enabled" />
                                    </div>
                                    <%--<div class="col-md-1">--%>
                                        <%--<label>Outlet</label>--%>
                                        <%--<form:input path="outlet" type="number" />--%>
                                    <%--</div>--%>
                                    <%--<div class="col-md-2">--%>
                                        <%--<label>Outlet enable</label>--%>
                                        <%--<form:checkbox path="outletEnable" />--%>
                                    <%--</div>--%>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label>Mô tả</label>
                                        <form:textarea path="description" class="form-control" rows="10"></form:textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label>Giới thiệu sản phẩm</label>
                                        <form:textarea path="review" class="form-control" rows="15"></form:textarea>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <input type="submit" class="btn btn-primary" value="Lưu">
                                        <a href="${pageContext.request.contextPath}/admin/product" class="btn btn-default">Quay lại</a>
                                    </div>
                                </div>
                                </form:form>
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
