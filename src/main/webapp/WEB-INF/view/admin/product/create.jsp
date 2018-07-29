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
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Thêm sản phẩm"/>
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
                            ${imgExisted}
                            <form:form id="product" action="/admin/product/create" modelAttribute="product"
                                       method="post" enctype="multipart/form-data">
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label>Mã sản phẩm</label>
                                        <form:input path="id" type="text" class="form-control" required="required"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Tên sản phẩm</label>
                                        <form:input path="name" type="text" class="form-control" required="required"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Hãng sản xuất</label>
                                        <select name="manufacturerId" required
                                                style="display:block; height: 3.5rem; width: 100%;">
                                            <option value="">Chọn nhà sản xuất</option>
                                            <c:forEach var="m" items="${manufacturers}">
                                                <option value="${m.id}">${m.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Nhóm sản phẩm</label>
                                        <select name="categoryId" required
                                                style="display:block; height: 3.5rem; width: 100%;">
                                            <option value="">Chọn nhóm</option>
                                            <c:forEach var="c" items="${categories}">
                                                <option value="${c.id}">${c.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-3">
                                        <label>Chất liệu</label>
                                        <form:input path="material" type="text" class="form-control" required="required"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Kích thước</label>
                                        <form:input path="size" type="text" class="form-control" required="required"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Khối lượng</label>
                                        <form:input path="weight" type="number" class="form-control" min="0" />
                                    </div>
                                    <div class="col-md-3">
                                        <label>Số lượng</label>
                                        <form:input path="unitInStock" type="number" class="form-control" min="0" required="required"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label>Giá gốc</label>
                                        <form:input path="costPrice" type="number" class="form-control" min="0" required="required"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Giá bán</label>
                                        <form:input path="salePrice" type="number" class="form-control" min="0" required="required"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Ratio</label>
                                        <form:input path="minRatio" type="number" class="form-control" min="0" max="15" required="required"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label>Ratio Contractor</label>
                                        <form:input path="raitoForContractor" type="number" class="form-control" min="0" max="10" required="required"/>
                                    </div>
                                    <div class="col-md-1">
                                        <label>Hiển thị</label>
                                        <form:checkbox path="enabled"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label>Tải ảnh lên</label>
                                        <div class="input-group">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default btn-file">
                                                    Chọn ảnh...
                                                    <input id="file" type="file" name="file" multiple="multiple" accept=".jpg, .png" onchange="javascript:updateList()">
                                                </span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="col-md-10">
                                        <label>Ảnh đã chọn</label>
                                        <div id="fileList" style="margin-top: -20px !important;"></div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label>Mô tả</label>
                                        <form:textarea path="description" class="form-control" rows="10"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <label>Giới thiệu sản phẩm</label>
                                        <form:textarea path="review" class="form-control" rows="15"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <input type="submit" class="btn btn-primary" value="Lưu">
                                        <a href="${pageContext.request.contextPath}/admin/product"
                                           class="btn btn-default">Quay lại</a>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
<!-- Datatables JavaScript -->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        updateList = function() {
            var input = document.getElementById('file');
            var output = document.getElementById('fileList');
            output.innerHTML = '<ul class="list-group">';
            for (var i = 0; i < input.files.length; ++i) {
                output.innerHTML += '<li class="list-group-item">' + input.files.item(i).name + '</li>';
            }
            output.innerHTML += '</ul>';
        }
    });
</script>
</body>
</html>