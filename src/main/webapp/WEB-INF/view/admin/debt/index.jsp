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
    <jsp:param name="title" value="Trang quản lý công nợ"/>
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
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/debt/"/>
                <jsp:param name="pageTitle" value="công nợ"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách khách hàng chưa thanh toán đủ</h4>
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
                                <th class="text-center">Tùy chọn</th>
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
                                                <button type="button" class="btn btn-info btn-xs" data-toggle="modal" data-target="#myModal${i}" title="Xem chi tiết"><i class="fa fa-eye"></i></button>
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


<jsp:include page="../../template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value=""/>
</jsp:include>
</body>
</html>
