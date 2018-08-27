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
    <jsp:param name="title" value="Chi tiết đơn đặt hàng"/>
</jsp:include>
<body>

<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb--child__admin.jsp">
                <jsp:param name="parentURL" value="${pageContext.request.contextPath}/admin/order/"/>
                <jsp:param name="parentTitle" value="đơn đặt hàng"/>
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/oder/detail"/>
                <jsp:param name="pageTitle" value="Chi tiết đơn đặt hàng"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12 col-md-offset-0">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Chi tiết đơn đặt hàng</h4>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>Mã đơn hàng</label>
                                        <input type="text" class="form-control" value="${order.id}" disabled>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Ngày tạo</label>
                                        <fmt:formatDate value="${order.date}" var="date" pattern="dd/MM/yyyy"/>
                                        <input type="text" class="form-control" value="${date}" disabled>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Loại khách hàng</label>
                                        <c:choose>
                                            <c:when test="${order.accountByUsername.roleId.equalsIgnoreCase(co)}">
                                                <input type="text" class="form-control" value="Nhà thầu" disabled>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" value="Khách lẻ" disabled>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Tình trạng</label>
                                        <c:choose>
                                            <c:when test="${order.closed == false}">
                                                <input type="text" class="form-control" value="Đang xử lý" disabled>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" class="form-control" value="Đã đóng" disabled>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                            </div>
                            <div class="form-group">
                                <label>Khách hàng</label>
                                <input type="text" class="form-control" value="${order.accountByUsername.fullname}" disabled>
                            </div>

                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input type="text" class="form-control" value="${order.accountByUsername.address}" disabled>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>Điện thoại</label>
                                        <input type="text" class="form-control" value="${order.accountByUsername.phone}" disabled>
                                    </div>
                                    <div class="col-md-9">
                                        <label>Email</label>
                                        <input type="text" class="form-control" value="${order.accountByUsername.email}" disabled>
                                    </div>
                                </div>

                            </div>

                            <div class="form-group">
                                <label>Chi tiết sản phẩm</label>
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th class="text-center">Tên sản phẩm</th>
                                            <th class="text-right">Số lượng</th>
                                            <th class="text-right">Giá bán</th>
                                            <th class="text-right">Thành tiền</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="od" items="${orderDetails}">
                                            <tr>
                                                <td>${od.productByProductId.name}</td>
                                                <td class="text-right">
                                                    <fmt:formatNumber value="${od.quantity}" pattern="###,###"/>
                                                </td>
                                                <td class="text-right">
                                                    <fmt:formatNumber value="${od.unitPrice}" pattern="###,###"/>
                                                </td>
                                                <td class="text-right">
                                                        <fmt:formatNumber value="${od.unitPrice * od.quantity}" pattern="###,###"/>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <a href="${pageContext.request.contextPath}/admin/order" class="btn btn-default">Quay lại</a>
                        </div>
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


</body>
</html>
