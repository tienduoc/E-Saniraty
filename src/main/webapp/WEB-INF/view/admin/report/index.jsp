<%--
  Created by IntelliJ IDEA.
  User: SYSTEM
  Date: 8/8/2018
  Time: 9:25 PM
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
    <jsp:param name="title" value="Báo cáo"/>
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
                        Trang thống kê
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Thống kê
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
                            <h4 class="panel-title">Thông tin doanh thu</h4>
                        </div>
                        <div class="panel-body">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body row">
                                            <form action="/admin/report" method="post">
                                            <div class="col-md-4">
                                                <label>Chọn ngày</label>
                                                <input type="date" name="fromDate" class="form-control" value="08/03/2018" required>
                                            </div>
                                            <div class="col-md-4">
                                                <label>Đến ngày</label>
                                                <input type="date" name="untilDate" class="form-control" value="08/07/2018" required>
                                            </div>
                                            <div class="col-md-4">
                                                <label>&ThinSpace;</label>
                                                <input type="submit" class="btn btn-success btn-group-justified" value="Xem báo cáo">
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">

                                <div class="col-md-12 col-md-offset-0">
                                    <div class="panel panel-default">
                                        <div class="panel-body">

                                            <c:set var="saleTotal" value="0"/>
                                            <c:set var="paidTotal" value="0"/>

                                            <table class="table table-striped table-responsive" id="example">
                                                <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Khách hàng</th>
                                                    <th>Ngày mua</th>
                                                    <th class="text-right">Tổng tiền</th>
                                                    <th class="text-right">Đã thanh toán</th>
                                                </tr>
                                                </thead>

                                                <tbody>

                                                <c:forEach items="${orderBetweendate}" var="order">
                                                    <c:set var="saleTotal" value="${saleTotal + order.totalPrice}"/>
                                                    <c:set var="paidTotal" value="${paidTotal + order.totalPaid}"/>

                                                    <tr>
                                                        <td>${order.id}</td>
                                                        <td></td>
                                                        <td>${order.date}</td>
                                                        <td class="text-right"><fmt:formatNumber value="${order.totalPrice}" pattern="###,###"/></td>
                                                        <td class="text-right"><fmt:formatNumber value="${order.totalPaid}" pattern="###,###"/></td>

                                                    </tr>
                                                </c:forEach>

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 col-md-offset-0">
                                    <div class="panel panel-default">

                                        <div class="panel-body row">

                                            <div class="col-md-2 col-md-offset-1">
                                                <label>Tổng số đơn hàng</label>
                                                <p class="form-control text-right">${numTotalOrder}</p>
                                            </div>
                                            <div class="col-md-2">
                                                <label>Trị giá</label>
                                                <p class="form-control text-right"><fmt:formatNumber value="${saleTotal}" pattern="###,###"/></p>
                                            </div>
                                            <div class="col-md-2">
                                                <label>Số đơn hàng đã huỷ</label>
                                                <p class="form-control text-right">${numTotalOrder - numOrderSuccess}</p>
                                            </div>

                                            <div class="col-md-2">
                                                <label>Tổng tiền đã thu</label>
                                                <p class="form-control text-right"><fmt:formatNumber value="${paidTotal}" pattern="###,###"/></p>
                                            </div>
                                            <div class="col-md-2">
                                                <label>Tổng tiền chưa thu</label>
                                                <p class="form-control text-right"><fmt:formatNumber value="${saleTotal - paidTotal}" pattern="###,###"/></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- Datatables JavaScript -->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        var table = $('#example').DataTable({
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
