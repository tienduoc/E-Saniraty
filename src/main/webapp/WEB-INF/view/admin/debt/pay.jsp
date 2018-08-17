<%--
  Created by IntelliJ IDEA.
  User: SYSTEM
  Date: 8/7/2018
  Time: 12:22 PM
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
<body>
<!-- Navigation -->
<jsp:include page="../../template/nav-tag__admin.jsp"/>
<div id="wrapper">

    <!-- Navigation -->


    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Trang thanh toán
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-archive"></i> Thanh toán
                        </li>
                        <li class="active">
                            <i class="fa fa-pencil"></i> Phiếu thanh toán
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-md-12 col-md-offset-0">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Thông tin thanh toán</h4>
                        </div>

                        <%--Changing in there--%>
                        <form:form action="/admin/debt/pay" modelAttribute="pay" method="post" id="pay">
                            <input type="hidden" name="id" value="${payId}">
                            <div class="panel-body">
                                    <%-- Contractor's info row--%>
                                <div class="row">
                                    <div class="col-md-12 col-md-offset-0">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Khách hàng</div>

                                            <div class="panel-body row">
                                                <div class="col-md-3">
                                                    <label>Họ tên</label>
                                                    <p class="form-group"> ${customer.fullname} </p>
                                                </div>
                                                <div class="col-md-4">
                                                    <label>Địa chỉ</label>
                                                    <p class="form-group" style="text-overflow: ellipsis;
                                                white-space: nowrap;
                                                overflow: hidden;"> ${customer.address}</p>
                                                </div>
                                                <div class="col-md-2">
                                                    <label>SĐT</label>
                                                    <p class="form-group">
                                                        <a href="tel:${customer.phone}">${customer.phone} </a>
                                                    </p>
                                                </div>

                                                <div class="col-md-3">
                                                    <label>Email</label>
                                                    <p class="form-group" style="text-overflow: ellipsis;
                                                white-space: nowrap;
                                                overflow: hidden;">
                                                        <a href="mailto:${customer.email}">${customer.email}</a>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                    <%--TODO: Order's info row--%>
                                <div class="row">

                                    <div class="col-md-12 col-md-offset-0">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Đơn hàng</div>
                                            <div class="panel-body">

                                                <table class="table table-striped table-responsive">
                                                    <input type="hidden" name="orderId" value="${order.id}">
                                                    <thead>
                                                    <tr>
                                                        <th>Mã sản phẩm</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th class="text-right">Số lượng</th>
                                                        <th class="text-right">Đơn giá</th>
                                                        <th class="text-right">Thành tiền</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set var="sum" value="0"/>
                                                    <c:forEach var="orderDetail" items="${orderDetails}">
                                                        <tr>
                                                            <td>${orderDetail.productId}</td>
                                                            <td>${orderDetail.productByProductId.name}</td>
                                                            <td class="text-right">${orderDetail.quantity}</td>
                                                            <td class="text-right">
                                                                <fmt:formatNumber value="${orderDetail.unitPrice}" pattern="###,###"/>
                                                            </td>
                                                            <td class="text-right">
                                                                <c:set var="total" value="${orderDetail.quantity * orderDetail.unitPrice}"/>
                                                                <fmt:formatNumber value="${total}" pattern="###,###"/>
                                                            </td>
                                                            <c:set var="sum" value="${sum + total}"/>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td colspan="5">
                                                            <div class="row">
                                                                <div class="col-md-2 col-md-offset-8 text-right">
                                                                    <strong style="font-size: 14px;">Tổng tiền: </strong>
                                                                </div>
                                                                <div class="col-md-2 text-right" style="font-size: 14px;">
                                                                    <fmt:formatNumber value="${sum}" pattern="###,###"/>
                                                                </div>
                                                            </div>

                                                        </td>
                                                    </tr>

                                                    </tfoot>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                    <%-- Payment's info row--%>
                                <div class="row">
                                    <div class="col-md-12 col-md-offset-0">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">Phiếu thanh toán</div>

                                            <div class="panel-body row">
                                                <div class="col-md-2">
                                                    <label>Số phiếu thu</label>
                                                    <p class="form-control text-right">${payId}</p>
                                                </div>
                                                <div class="col-md-2">
                                                    <label>Tổng tiền</label>
                                                    <p class="form-control text-right"><fmt:formatNumber value="${order.totalPrice}" pattern="###,###"/></p>
                                                </div>
                                                <div class="col-md-2">
                                                    <label>Đã trả</label>
                                                    <p class="form-control text-right"><fmt:formatNumber value="${order.totalPaid}" pattern="###,###"/></p>
                                                </div>

                                                <div class="col-md-2">
                                                    <label>Còn lại</label>
                                                    <p class="form-control text-right"><fmt:formatNumber value="${order.totalPrice - order.totalPaid}" pattern="###,###"/></p>
                                                </div>
                                                <div class="col-md-2">
                                                    <label>Trả thêm</label>
                                                    <form:input path="paid" id="paid" class="form-control text-right"/>
                                                </div>
                                                <div class="col-md-2">
                                                    <label>Tuỳ chọn</label>
                                                    <button type="button" class="btn btn-success btn-group-justified" id="paidAll">Trả hết</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </form:form>

                        <div class="panel-footer">
                            <c:if test="${order.totalPaid != order.totalPrice}">
                                <button type="button" class="btn btn-primary" id="save">Xác nhận</button>
                            </c:if>
                            <button  class="btn btn-default" onclick="goBack()">Quay lại</button>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-md-offset-0">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Lịch sử thanh toán</h4>
                        </div>
                        <div class="panel-body">
                            <strong>
                                <div class="row" style="padding-bottom: 10px">
                                    <div class="col-md-2">Số phiếu</div>
                                    <div class="col-md-4">Mã hóa đơn</div>
                                    <div class="col-md-3">Ngày thanh toán</div>
                                    <div class="col-md-3 text-right">Số tiền</div>
                                </div>
                            </strong>
                            <c:forEach var="payHistory" items="${payHistories}">
                                <div class="row">
                                    <div class="col-md-2">${payHistory.id}</div>
                                    <div class="col-md-4">${payHistory.orderId}</div>
                                    <div class="col-md-3"><fmt:formatDate value="${payHistory.date}" pattern="dd/MM/yyyy"/></div>
                                    <div class="col-md-3 text-right"><fmt:formatNumber value="${payHistory.paid}" pattern="###,###"/></div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>

</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $('#paidAll').on('click', function () {
        $("#paid").val(${order.totalPrice - order.totalPaid});
    });
    $('#save').on('click', function () {
        document.getElementById('pay').submit();
    });
</script>
<script>
    function goBack() {
        window.history.go(-1);
    }
</script>
</html>