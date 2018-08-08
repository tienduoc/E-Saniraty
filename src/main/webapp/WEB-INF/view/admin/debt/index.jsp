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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý đơn hàng"/>
</jsp:include>
<style>
    .modal-dialog{
        position: relative;
        display: table; /* This is important */
        overflow-y: auto;
        overflow-x: auto;
        width: auto;
        min-width: 880px;
    }
</style>
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
                        Quản lý công nợ
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Công nợ
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách đơn đặt hàng</h4>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Tên khách hàng</th>
                                <th class="text-center">Tổng tiền hóa đơn</th>
                                <th class="text-center">Đã trả</th>
                                <th class="text-center">Còn nợ</th>
                                <th class="text-center">SĐT</th>
                                <th class="text-center">Email</th>
                                <th class="text-center">Chi tiết</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="i" value="1"/>
                            <c:forEach var="acc" items="${accounts}">
                                <c:forEach var="debt" items="${debts}">
                                    <c:if test="${(debt.username == acc.username) && (debt.totalPrice != debt.totalPaid)}">
                                        <tr data-toggle="modal" data-id="2" data-target="#orderModal">
                                            <td>
                                                    ${acc.fullname}
                                            </td>
                                            <td class="text-right">
                                                    <fmt:formatNumber value="${debt.totalPrice}" pattern="###,###"/>
                                            </td>
                                            <td class="text-right text-primary">
                                                    <fmt:formatNumber value="${debt.totalPaid}" pattern="###,###"/>
                                            </td>
                                            <td class="text-right text-danger">
                                                    <fmt:formatNumber value="${debt.totalPrice - debt.totalPaid}" pattern="###,###"/>
                                            </td>
                                            <td class="text-right">${acc.phone}</td>
                                            <td class="text-left">${acc.email}</td>
                                            <td class="text-center">
                                                <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#myModal${i}">Chi tiết</button>
                                            </td>

                                            <!-- Modal -->
                                            <div class="modal fade" id="myModal${i}" role="dialog">
                                                <div class="modal-dialog">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Khách hàng: ${acc.fullname} - ${acc.phone}</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row" style="padding-bottom: 10px">
                                                                <strong>
                                                                <div class="col-md-3 text-center">Mã hóa đơn</div>
                                                                <div class="col-md-3 text-right">Tổng tiền</div>
                                                                <div class="col-md-2 text-right">Đã trả</div>
                                                                <div class="col-md-2 text-right">Còn nợ</div>
                                                                <div class="col-md-2 text-center">Thanh toán</div>
                                                                </strong>
                                                            </div>
                                                            <c:forEach var="order" items="${ordersOpen}">
                                                                <c:if test="${order.username == debt.username}">
                                                                    <div class="row" style="border-bottom: #e5e5e5 solid 0.01em; padding: 5px 0">
                                                                        <div class="col-md-3 text-left">${order.id}</div>
                                                                        <div class="col-md-3 text-right"><fmt:formatNumber value="${order.totalPrice}" pattern="###,###"/></div>
                                                                        <div class="col-md-2 text-right"><fmt:formatNumber value="${order.totalPaid}" pattern="###,###"/></div>
                                                                        <div class="col-md-2 text-right"><fmt:formatNumber value="${order.totalPrice - order.totalPaid}" pattern="###,###"/></div>
                                                                        <div class="col-md-2 text-right"><a href="${pageContext.request.contextPath}/admin/debt/pay?orderId=${order.id}" class="btn btn-primary btn-xs">Thanh toán</a></div>
                                                                    </div>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <c:set var="i" value="${i+1}"/>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            </tbody>
                        </table>
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
<!-- Datatables JavaScript -->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>
<script>
    function format(dataSource) {
        var html = '<table class="table table-hover" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" id="childRowTable"><tbody>';
        for (var key in dataSource) {
            html += '<tr>' +
                '<td>' + key + '</td>' +
                '<td>' + dataSource[key] + '</td>' +
                '</tr>';
        }
        return html += '</tbody></table>';
    }

    $(document).ready(function () {
        var table = $('#example').DataTable({
            columnDefs: [{
                targets: 1, // the target for this configuration, 0 it's the first column
                render: function (data, type, row) {
                    return data.length > 100 ?
                        data.substr(0, 100) + '…' :
                        data;
                }
            }],
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
