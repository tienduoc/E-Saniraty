<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 8/13/18
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý danh mục sản phẩm"/>
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
                        Trang quản lý bình luận
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> bình luận
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="col-md-1 text-center">Trạng thái</th>
                                <th class="col-md-2 text-center">Tên</th>
                                <th class="col-md-5 text-center">Nội dung</th>
                                <th class="col-md-2 text-center">Mã sản phẩm <br> Ngày đăng</th>
                                <th class="col-md-2 text-center">Tùy chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="feedback" items="${feedbacks}">
                            <tr>
                                <c:if test="${feedback.approve}">
                                    <td>Đã duyệt</td>
                                </c:if>
                                <c:if test="${!feedback.approve}">
                                    <td>Đã hủy</td>
                                </c:if>
                                <c:if test="${feedback.approve == null}">
                                    <td>Mới</td>
                                </c:if>
                                <td>${feedback.accountByUsername.fullname}</td>
                                <td>
                                    ${feedback.feedbackContent}
                                </td>
                                <td>
                                    ${feedback.productId} | <fmt:formatDate value="${feedback.date}" pattern="dd/MM/yyyy HH:mm"/>
                                </td>
                                <td class="text-right">
                                    <a href="${pageContext.request.contextPath}/admin/feedback/approve?id=${feedback.feedbackId}" class="badge bg-success">Chấp nhận</a>
                                    <a href="${pageContext.request.contextPath}/admin/feedback/unapprove?id=${feedback.feedbackId}" class="badge bg-danger">Hủy</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>

    <!-- Datatables JavaScript -->
    <script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>
    <script>

        $(document).ready(function () {
            var table = $('#example').DataTable({
                'language': {
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
                },
                'columnDefs': [
                    {
                        "targets": 2,
                        render: $.fn.dataTable.render.number(',', '.')
                    }]
            });
        });


    </script>
</body>
</html>
