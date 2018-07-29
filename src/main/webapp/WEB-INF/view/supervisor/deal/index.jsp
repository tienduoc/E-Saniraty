<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang thương lượng"/>
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
                        Quản lý thương lượng
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Thương lượng
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="table1">
                        <thead>
                        <tr>
                            <th class="text-center">Mã hoá đơn</th>
                            <th class="text-center">Khách hàng yêu cầu</th>
                            <th class="text-center">Ngày yêu cầu</th>
                            <th class="text-center">Ngày phản hồi</th>
                            <th class="text-right">Giá đơn hàng</th>
                            <th class="text-right">Giá nhà thầu</th>
                            <th class="text-center">Trạng thái</th>
                            <th class="text-center">Tuỳ chọn</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="deal" items="${deals}">
                            <c:if test="${(deal.contructorApprove == true && (deal.bossApprove == false || deal.bossApprove == null)) || (deal.contructorApprove == false && deal.bossApprove == true)}">
                                <tr>
                                    <td href="${pageContext.request.contextPath}/">${deal.orderId}</td>
                                    <td class="text-left">
                                        <a href="${pageContext.request.contextPath}/admin/account/detail?username=${deal.orderByOrderId.username}">
                                                ${deal.orderByOrderId.accountByUsername.fullname}
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${deal.requestDate}" pattern="dd/MM/yyyy  HH:mm"/>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${deal.responseDate}" pattern="dd/MM/yyyy  HH:mm"/>
                                    </td>
                                    <td class="text-right">
                                        <fmt:formatNumber value="${deal.orderByOrderId.totalPrice}"/>
                                    </td>
                                    <td class="text-right">
                                        <c:set var="sum" value="0"/>
                                        <c:forEach var="cp" items="${deal.dealHistoryDetailsById}">
                                            <c:if test="${cp.dealHistoryId.equals(deal.id)}">
                                                <c:set var="sum" value="${sum + cp.contractorPrice}"/>
                                            </c:if>
                                        </c:forEach>
                                        <fmt:formatNumber value="${sum}" type="number"/>
                                    </td>
                                    <c:choose>
                                        <c:when test="${deal.contructorApprove == true && (deal.bossApprove == false || deal.bossApprove == null)}">
                                            <td class="text-center text-danger">Đang thương lượng</td>
                                        </c:when>
                                        <c:when test="${deal.contructorApprove == false && deal.bossApprove == true}">
                                            <td class="text-center text-primary">Đã trả lời</td>
                                        </c:when>
                                    </c:choose>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/supervisor/deal/update?dealHistoryId=${deal.id}" class="btn btn-warning btn-xs" data-toggle="tooltip"
                                           title="Điều chỉnh giá mới"><i class="fa fa-pencil"></i></a>
                                        <a href="" class="btn btn-success btn-xs" data-toggle="tooltip"
                                           title="Đồng ý với giá nhà thầu đưa ra"><i class="fa fa-check"></i></a>
                                        <a href="" class="btn btn-danger btn-xs" data-toggle="tooltip"
                                           title="Không thương lượng nữa"><i class="fa fa-ban"></i></a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="table2">
                        <thead>
                        <tr>
                            <th class="text-center">Mã hoá đơn</th>
                            <th class="text-center">Khách hàng yêu cầu</th>
                            <th class="text-center">Ngày yêu cầu</th>
                            <th class="text-center">Ngày phản hồi</th>
                            <th class="text-right">Giá đơn hàng</th>
                            <th class="text-right">Giá nhà thầu</th>
                            <th class="text-center">Trạng thái</th>
                            <th class="text-center">Tuỳ chọn</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="deal" items="${deals}">
                            <c:if test="${(deal.contructorApprove == true && deal.bossApprove == true) || (deal.contructorApprove == false && deal.bossApprove == false)}">
                                <tr>
                                    <td href="${pageContext.request.contextPath}/">${deal.orderId}</td>
                                    <td class="text-left">
                                        <a href="${pageContext.request.contextPath}/admin/account/detail?username=${deal.orderByOrderId.username}">
                                                ${deal.orderByOrderId.accountByUsername.fullname}
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${deal.requestDate}" pattern="dd/MM/yyyy  HH:mm"/>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${deal.responseDate}" pattern="dd/MM/yyyy  HH:mm"/>
                                    </td>
                                    <td class="text-right">
                                        <fmt:formatNumber value="${deal.orderByOrderId.totalPrice}"/>
                                    </td>
                                    <td class="text-right">
                                        <c:set var="sum" value="0"/>
                                        <c:forEach var="cp" items="${deal.dealHistoryDetailsById}">
                                            <c:if test="${cp.dealHistoryId.equals(deal.id)}">
                                                <c:set var="sum" value="${sum + cp.contractorPrice}"/>
                                            </c:if>
                                        </c:forEach>
                                        <fmt:formatNumber value="${sum}" type="number"/>
                                    </td>
                                    <c:choose>
                                        <c:when test="${deal.contructorApprove == true && deal.bossApprove == true}">
                                            <td class="text-center text-success">Thành công</td>
                                        </c:when>
                                        <c:when test="${deal.contructorApprove == false && deal.bossApprove == false}">
                                            <td class="text-center">Đã huỷ</td>
                                        </c:when>
                                    </c:choose>
                                    <td class="text-center">
                                        <a href="" class="btn btn-xs btn-info">Xem</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
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
        var table = $('#table1').DataTable({
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
    $(document).ready(function () {
        var table = $('#table2').DataTable({
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
<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip(
            {animation: false}
        );
    });
</script>
</body>
</html>