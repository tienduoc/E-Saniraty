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
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/report/"/>
                <jsp:param name="pageTitle" value="báo cáo"/>
            </jsp:include>
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
                                                <div class="col-md-3">
                                                    <label>Chọn ngày</label>
                                                    <fmt:formatDate value="${fromDate}" pattern="MM/dd/yyyy" var="strFromdate"/>
                                                    <input type="date" name="fromDate" class="form-control" value="${strFromdate}" required>
                                                </div>
                                                <div class="col-md-3">
                                                    <label>Đến ngày</label>
                                                    <input type="date" id="untilDate" name="untilDate" class="form-control" value="${fromDate}" required>
                                                </div>
                                                <div class="col-md-3">
                                                    <label>Loại kháchh hàng</label>
                                                    <select name="role" style="display:block; height: 3.5rem; width: 100%;">
                                                        <option value="">Tất cả</option>
                                                        <option value="CU">Khách lẻ</option>
                                                        <option value="CO">Nhà thầu</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-3">
                                                    <label></label>
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
                                                    <c:if test="${role != 'CU'}">
                                                        <th class="text-right">Còn nợ</th>
                                                    </c:if>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${sessionScope.reportResult}" var="order">
                                                    <c:set var="saleTotal" value="${saleTotal + order.totalPrice}"/>
                                                    <c:set var="paidTotal" value="${paidTotal + order.totalPaid}"/>
                                                    <tr>
                                                        <td>${order.id}</td>
                                                        <td>${order.accountByUsername.fullname}</td>
                                                        <td>
                                                            <fmt:formatDate value="${order.date}" pattern="dd/MM/yyyy HH:mm"/>
                                                        </td>
                                                        <td class="text-right"><fmt:formatNumber value="${order.totalPrice}" pattern="###,###"/></td>
                                                        <td class="text-right"><fmt:formatNumber value="${order.totalPaid}" pattern="###,###"/></td>
                                                        <c:if test="${role != 'CU'}">
                                                            <td class="text-right">
                                                                <c:choose>
                                                                    <c:when test="${(order.totalPrice - order.totalPaid) == 0}">
                                                                        <a style="color: green">Đã thanh toán đủ</a>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <a style="color: red">
                                                                            <fmt:formatNumber value="${order.totalPrice - order.totalPaid}" pattern="###,###"/>
                                                                        </a>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                        </c:if>
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
                                                <p class="form-control text-right">${sessionScope.numTotalOrder}</p>
                                            </div>
                                            <div class="col-md-2">
                                                <label>Số đơn còn nợ</label>
                                                <p class="form-control text-right">${sessionScope.numTotalOrder - numOrderSuccess}</p>
                                            </div>
                                            <div class="col-md-2">
                                                <label>Tổng tiền</label>
                                                <p class="form-control text-right"><fmt:formatNumber value="${saleTotal}" pattern="###,###"/></p>
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
                            <div class="row">
                                <div class="col-md-12 col-md-offset-0">
                                    <div class="panel panel-default">
                                        <div class="panel-body row" style="margin: 30px">
                                            <c:forEach var="noc" items="${numOfCats}">
                                                ${noc.key}: ${noc.value}
                                                <br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p>
                                <a href="${pageContext.request.contextPath}/admin/report/print" class="btn btn-success pull-right">
                                    <span class="glyphicon glyphicon-print"></span> In báo cáo
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->
</div>
<%@ include file="../../template/script-tags__admin.jsp" %>
</body>
</html>