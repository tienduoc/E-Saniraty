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
                        Trang thương lượng
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-archive"></i> Thương lượng
                        </li>
                        <li class="active">
                            <i class="fa fa-pencil"></i> Điều chỉnh giá bán
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <c:set var="request" value="${deal.contructorApprove == true && (deal.bossApprove == false || deal.bossApprove == null)}"/>
            <c:set var="response" value="${deal.contructorApprove == false && deal.bossApprove == true}"/>

            <form:form action="/supervisor/deal/update" method="post">
                <input type="hidden" name="id" value="${deal.id}">
                <input type="hidden" name="orderId" value="${deal.orderId}">
                <input type="hidden" name="requestDate" value="${deal.requestDate}">
                <div class="row">
                    <div class="col-md-12 col-md-offset-0">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Điều chỉnh giá bán</h4>
                            </div>
                            <div class="panel-body">
                                <form method="post">
                                    <div class="form-group row">
                                        <div class="col-md-3">
                                            <label>Mã hoá đơn</label>
                                            <p class="form-group">${deal.orderByOrderId.id}</p>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Ngày yêu cầu</label>
                                            <p class="form-group">
                                                <fmt:formatDate value="${deal.requestDate}" pattern="HH:mm dd-MM-yyyy"/>
                                            </p>
                                        </div>
                                        <div class="col-md-2">
                                            <label>Khách hàng</label>
                                            <p class="form-group">${deal.orderByOrderId.accountByUsername.fullname}</p>
                                        </div>
                                        <div class="col-md-2">
                                            <label>SĐT</label>
                                            <p class="form-group">
                                                <a href="tel:${deal.orderByOrderId.accountByUsername.phone}">
                                                        ${deal.orderByOrderId.accountByUsername.phone}
                                                </a>
                                            </p>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Email</label>
                                            <p class="form-group" style="text-overflow: ellipsis;
                                            white-space: nowrap;
                                            overflow: hidden;">
                                                <a href="mailto:${deal.orderByOrderId.accountByUsername.email}">
                                                        ${deal.orderByOrderId.accountByUsername.email}
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover table-striped">
                                                    <thead>
                                                    <tr>
                                                        <th>Mã SP</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th class="text-right">SL</th>
                                                        <th class="text-right">Giá gốc</th>
                                                        <th class="text-right">Giá bán</th>
                                                        <th class="text-right">Giá nhà thầu</th>
                                                        <th class="text-center">Giá chấp nhận</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="dealDetail" items="${deal.dealHistoryDetailsById}">
                                                        <tr>
                                                            <td>${dealDetail.productByProductId.id}</td>
                                                            <td>${dealDetail.productByProductId.name}</td>
                                                            <td class="text-right">
                                                                <c:forEach var="od" items="${dealDetail.dealHistoryByDealHistoryId.orderByOrderId.orderDetailsById}">
                                                                    <c:if test="${dealDetail.productId.equals(od.productId)}">
                                                                        ${od.quantity}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="text-right">
                                                                <fmt:formatNumber value="${dealDetail.originalPrice}" pattern="###,###"/>
                                                            </td>
                                                            <td class="text-right">
                                                                <c:forEach var="od" items="${dealDetail.dealHistoryByDealHistoryId.orderByOrderId.orderDetailsById}">
                                                                    <c:if test="${dealDetail.productId.equals(od.productId)}">
                                                                        <fmt:formatNumber value="${od.unitPrice}" pattern="###,###"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td class="text-right">
                                                                <fmt:formatNumber var="cp" value="${dealDetail.contractorPrice}" pattern="###,###"/>
                                                                <c:choose>
                                                                    <c:when test="${dealDetail.contractorPrice != dealDetail.originalPrice}">
                                                                        <b>${cp}</b><br>
                                                                        <fmt:formatNumber value="${dealDetail.contractorPrice - dealDetail.originalPrice}" pattern="###,###"/>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        ${cp}
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <%--<c:if test="${response}">--%>
                                                                <%--<td class="text-right">--%>
                                                                    <%--<c:choose>--%>
                                                                        <%--<c:when test="${dealDetail.contractorPrice == dealDetail.newPrice}">--%>
                                                                            <%--Đã chấp nhận--%>
                                                                        <%--</c:when>--%>
                                                                        <%--<c:otherwise>--%>
                                                                            <%--<fmt:formatNumber value="${dealDetail.newPrice}" pattern="###,###"/>--%>
                                                                        <%--</c:otherwise>--%>
                                                                    <%--</c:choose>--%>
                                                                <%--</td>--%>
                                                            <%--</c:if>--%>
                                                            <c:if test="${request}">
                                                                <td class="text-right">
                                                                    <c:if test="${dealDetail.contractorPrice == dealDetail.newPrice}">
                                                                        Đã chấp nhận
                                                                        <input type="hidden" name="newPrice">
                                                                    </c:if>
                                                                    <c:if test="${dealDetail.contractorPrice != dealDetail.newPrice}">
                                                                        <input type="text" name="newPrice" class="text-right" onkeypress="return isNumberKey(event)"/>
                                                                    </c:if>
                                                                </td>
                                                            </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td colspan="7">
                                                            <div class="row">
                                                                <div class="col-md-3 col-md-offset-7 text-left">
                                                                    <strong style="font-size: 14px;">Tổng giá ban đầu</strong>
                                                                </div>
                                                                <div class="col-md-2 text-right" style="padding-right: 3rem; font-size: 14px;">
                                                                    <fmt:formatNumber value="${deal.orderByOrderId.totalPrice}"/>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-3 col-md-offset-7 text-left">
                                                                    <strong style="font-size: 14px;">Tổng giá thương lượng</strong>
                                                                </div>
                                                                <div class="col-md-2 text-right" style="padding-right: 3rem; font-size: 14px;">
                                                                    <c:set var="sum" value="0"/>
                                                                    <c:forEach var="cp" items="${deal.dealHistoryDetailsById}">
                                                                        <c:set var="sum" value="${sum + cp.contractorPrice}"/>
                                                                    </c:forEach>
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
                                    <div class="form-group row">
                                        <div class="col-md-6">
                                            <c:forEach var="m" items="${messages}">
                                                <fmt:formatDate value="${m.time}" var="time" pattern="HH:mm dd/MM/yyyy"/>
                                                <i style="color: #008CBA">${m.sender}</i> (${time}): ${m.message}<br>
                                            </c:forEach>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Nhắn tin cho nhà thầu</label>
                                            <textarea class="form-control" name="message" placeholder="Nhắn tin cho nhà thầu"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-4">
                                            <c:if test="${request}">
                                                <input type="submit" class="btn btn-primary" value="Gửi">
                                            </c:if>
                                            <a href="${pageContext.request.contextPath}/supervisor/deal/acceptDeal?orderId=${deal.orderId}&dealHistoryId=${deal.id}" class="btn btn-success">Đồng ý</a>
                                            <a href="${pageContext.request.contextPath}/supervisor/deal" class="btn btn-danger">Huỷ</a>
                                            <a href="${pageContext.request.contextPath}/supervisor/deal" class="btn btn-default">Quay lại</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
        <!-- /.container-fluid -->
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
<script>
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
</script>

</body>
</html>
