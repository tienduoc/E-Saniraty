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
    <jsp:param name="title" value="Trang quản lý đơn đặt hàng"/>
</jsp:include>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/order/"/>
                <jsp:param name="pageTitle" value="đơn đặt hàng"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách đơn đặt hàng</h4>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center"></th>
                                <th class="text-center">Mã hoá đơn</th>
                                <th class="text-center">Ngày tạo</th>
                                <th class="text-center">Tổng tiền</th>
                                <th class="text-center">Loại khách hàng</th>
                                <th class="text-center">Tên khách hàng</th>
                                <th class="text-center">Tình trạng</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="o" items="${orders}">
                                <tr data-key-1="${o.username}" data-key-2="${o.accountByUsername.fullname}" data-key-3="${o.accountByUsername.address}" data-key-4="${o.accountByUsername.phone}" data-key-5="${o.accountByUsername.email}">
                                    <td class="details-control"></td>
                                    <td>${o.id}</td>
                                    <td><fmt:formatDate value="${o.date}" pattern="dd-MM-yyy HH:mm"/></td>
                                    <td class="text-right">
                                        <c:set var="totalPrice" value="0"/>
                                        <c:forEach var="od" items="${o.orderDetailsById}">
                                            <c:set var="totalPrice" value="${sum + od.unitPrice * od.quantity}"/>
                                        </c:forEach>
                                        <fmt:formatNumber var="tp" value="${totalPrice}" type="number" />
                                        ${tp} đ
                                    </td>
                                    <td>
                                        <c:if test="${o.accountByUsername.roleByRoleId.id.equals('CU')}">
                                            Khách lẻ
                                        </c:if>
                                        <c:if test="${o.accountByUsername.roleByRoleId.id.equals('CO')}">
                                            Nhà thầu
                                        </c:if>
                                    </td>
                                    <td>${o.accountByUsername.fullname}</td>
                                    <td class="text-center">
                                        <c:if test="${o.closed == false}">
                                            <i class="fa fa-hourglass-end" style="color: darkorange" data-toggle="tooltip" title="Đang chờ xử lý"></i>
                                        </c:if>
                                        <c:if test="${o.closed == true}">
                                            <i class="fa fa-check" style="color: green" data-toggle="tooltip" title="Đơn hàng đã đóng"></i>
                                        </c:if>
                                    </td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/admin/order/update?orderId=${o.id}" class="btn btn-warning btn-xs" data-toggle="tooltip" title="Cập nhật"><i class="fa fa-pencil"></i></a>
                                        <a href="${pageContext.request.contextPath}/admin/order/detail?orderId=${o.id}" class="btn btn-success btn-xs" data-toggle="tooltip" title="Chi tiết đơn hàng"><i class="fa fa-eye"></i></a>
                                        <a href="${pageContext.request.contextPath}/admin/debt/pay?orderId=${o.id}" class="btn btn-primary btn-xs" data-toggle="tooltip" title="Thanh toán"><i class="fa fa-money"></i></a>
                                    </td>
                                </tr>
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

<jsp:include page="../../template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value=""/>
</jsp:include>
<script>
    $(document).ready(function () {
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
        // Add event listener for opening and closing details
        $('#example').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = $('#example').DataTable().row(tr);
            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            } else {
                // Open this row
                row.child(format({
                    'Tài khoản': tr.data('key-1'),
                    'Khách hàng': tr.data('key-2'),
                    'Địa chỉ': tr.data('key-3'),
                    'Điện thoại': tr.data('key-4'),
                    'Email': tr.data('key-5')
                })).show();
                tr.addClass('shown');
            }
        });
    });
</script>
</body>
</html>
