<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/12/2018
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Thêm sản phẩm"/>
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
                        Thêm sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-archive"></i> Sản phẩm
                        </li>
                        <li class="active">
                            <i class="fa fa-plus"></i> Thêm sản phẩm
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <!-- TODO: Please only chage the datas in this row!!! -->
            <div class="row">
                <div class="col-md-12 col-md-offset-0">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Thêm sản phẩm</h4>
                        </div>
                        <div class="panel-body">
                            <form:form id="product" action="/admin/product/create" modelAttribute="product" method="post">
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label for="productID">Mã sản phẩm</label>
                                        <form:input path="id" type="text" class="form-control" name="productID" required="required" placeholder="CS-CD-1331"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="productName">Tên sản phẩm</label>
                                        <form:input path="name" type="text" class="form-control" name="productName" required="required" placeholder="BÀN CẦU HAI KHỐI CAESAR CD-1331"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Hãng sản xuất</label>
                                        <select name="manufacturerId" required style="display:block; height: 3.5rem; width: 100%;">
                                            <option value="">Chọn nhà sản xuất</option>
                                            <c:forEach var="m" items="${manufacturers}">
                                                <option value="${m.id}">${m.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Nhóm sản phẩm</label>
                                        <select name="categoryId" required style="display:block; height: 3.5rem; width: 100%;">
                                            <option value="">Chọn nhóm</option>
                                            <c:forEach var="c" items="${categories}">
                                                <option value="${c.id}">${c.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-3">
                                        <label for="material">Chất liệu</label>
                                        <form:input path="material" type="text" class="form-control" name="material" placeholder="Gốm, sứ, inox..." required="required"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="size">Kích thước</label>
                                        <form:input path="size" type="text" class="form-control" name="size" placeholder="60 x 30 x 15 (mm)" required="required"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="weight">Khối lượng</label>
                                        <form:input path="weight" type="number" class="form-control" name="weight" placeholder="120 (grams)" min="0" required="required"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="unitInStock">Số lượng</label>
                                        <form:input path="unitInStock" type="number" class="form-control" name="unitInStocks" placeholder="1 (cái)" min="0" required="required"/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label for="costPrice">Giá gốc</label>
                                        <form:input path="costPrice" type="number" class="form-control" name="costPrice" placeholder="1000 (đồng)" min="0" required="required"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="salePrice">Giá bán</label>
                                        <form:input path="salePrice" type="number" class="form-control" name="salePrice" placeholder="1000 (đồng)" min="0" required="required"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="minRatio">Ratio</label>
                                        <form:input path="minRatio" type="number" class="form-control" name="minRatio" placeholder="Max 15 (%)" min="0" max="15" required="required"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="minRatioForContractor">Ratio Contractor</label>
                                        <form:input path="raitoForContractor" type="number" class="form-control" name="minRatioForContractor" placeholder="Max 10 (%)" min="0" max="10" required="required"/>
                                    </div>
                                    <div class="col-md-1">
                                        <label for="status">Hiển thị</label>
                                        <form:checkbox path="enabled" name="status"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label>Mô tả</label>
                                        <form:textarea path="description" class="form-control" placeholder="Mô tả ngắn gọn sản phẩm"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label>Giới thiệu sản phẩm</label>
                                        <form:textarea path="review" class="form-control" rows="5"/>
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
            <!-- END TODO -->

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

</body>

</html>