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
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Chi tiết nhóm sản phẩm"/>
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
                        Chi tiết nhóm sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-archive"></i> Nhóm sản phẩm
                        </li>
                        <li class="active">
                            <i class="fa fa-list"></i> Chi tiết nhóm
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Chi tiết nhóm sản phẩm</h4>
                        </div>

                        <form:form action="/admin/category/detail" modelAttribute="category" method="get">
                        <div class="panel-body">
                            <div class="form-group">
                                <label for="cateID">Mã nhóm</label>
                                <input type="text" class="form-control" name="cateID" value="${category.id}" disabled>
                            </div>
                            <c:if test="${category.parentId != null}">
                                <div class="form-group">
                                    <label for="cateName">Tên nhóm sản phẩm cha</label>
                                    <input type="text" class="form-control" name="cateName" value="${category.categoryByParentId.name}" disabled>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label for="cateParentID">Tên nhóm</label>
                                <input type="text" class="form-control" name="cateParentID" value="${category.name}" disabled>
                            </div>
                        </div>
                        </form:form>
                        <div class="panel-footer">
                            <a href="${pageContext.request.contextPath}/admin/category" class="btn btn-default">Quay lại</a>
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

</body>
</html>