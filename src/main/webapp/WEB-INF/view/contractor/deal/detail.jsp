<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/26/18
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-tag__user.jsp">
    <jsp:param name="title" value="Danh mục sản phẩm"/>
</jsp:include>
<body>
<%@ include file="../../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Xem lại giỏ hàng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Xem lại giỏ hàng</a>
                </li>
            </ol>
        </div>
    </section>
    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">Đơn đặt hàng của bạn
                            <span class="heading-secondary--line"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-cart">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-md-offset-0">
                    <form:form action="/deal/update" modelAttribute="deal" method="post" id="frmDeal">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Điều chỉnh giá bán</h3>
                            </div>

                            <div class="panel-body">
                                    <%-- Heading--%>
                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label>Mã hoá đơn</label>
                                        <p class="form-group">
                                            <a href="${pageContext.request.contextPath}/order/view?orderId=${deal.orderId}">
                                                    ${deal.orderId}
                                            </a>
                                        </p>
                                    </div>
                                    <div class="col-md-2 text-center">
                                        <label>Ngày yêu cầu</label>
                                        <p class="form-group text-center">
                                            <fmt:formatDate value="${deal.requestDate}" pattern="dd/MM/yyyy"/>
                                        </p>
                                    </div>
                                    <div class="col-md-3 text-center">
                                        <label>Khách hàng</label>
                                        <p class="form-group text-center">${deal.orderByOrderId.accountByUsername.fullname}</p>
                                    </div>
                                    <div class="col-md-2 text-center">
                                        <label>SĐT</label>
                                        <p class="form-group text-center">
                                            <a href="tel:${deal.orderByOrderId.accountByUsername.phone}">${deal.orderByOrderId.accountByUsername.phone}</a>
                                        </p>
                                    </div>
                                    <div class="col-md-3 text-center">
                                        <label>Email</label>
                                        <p class="form-group text-center" style="text-overflow: ellipsis;
                                                white-space: nowrap;
                                                overflow: hidden;">
                                            <a href="mailto:example@email.com">${deal.orderByOrderId.accountByUsername.email}</a>
                                        </p>
                                    </div>
                                </div>
                                <hr>
                                    <%-- Table--%>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">

                                            <table class="table table-hover table-striped">
                                                <thead>
                                                <tr>
                                                    <th>Mã SP</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th class="text-right">Số lượng</th>
                                                    <th class="text-right">Giá ban đầu</th>
                                                    <th class="text-right">Giá công ty đưa ra</th>
                                                    <th class="text-center">
                                                        <c:choose>
                                                            <c:when test="${(deal.contructorApprove == false && deal.bossApprove == true)}">
                                                                Giá mong muốn
                                                            </c:when>
                                                            <c:otherwise>
                                                                Trạng thái
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <%--<form:form action="/deal/update" modelAttribute="deal" method="post" id="frmDeal">--%>
                                                <input type="hidden" name="dealHistoryId" value="${deal.id}">
                                                <form:hidden path="responseDate"/>
                                                <form:hidden path="orderId"/>
                                                <c:forEach var="p" items="${dealDetails}">
                                                    <c:set var="waitResponse" value="${(p.dealHistoryByDealHistoryId.requestDate > p.dealHistoryByDealHistoryId.responseDate || p.dealHistoryByDealHistoryId.responseDate == null) && p.contractorPrice != p.newPrice}"/>
                                                    <c:set var="approved" value="${p.contractorPrice == p.newPrice}"/>
                                                    <c:set var="canceled" value="${deal.bossApprove == false && deal.contructorApprove == false}"/>
                                                    <tr>
                                                        <td>${p.productId}</td>
                                                        <td>${p.productByProductId.name}
                                                        </td>
                                                        <c:forEach var="od"
                                                                   items="${deal.orderByOrderId.orderDetailsById}">
                                                            <c:if test="${p.productId == od.productId}">
                                                                <td class="text-right">${od.quantity}</td>
                                                            </c:if>
                                                        </c:forEach>
                                                        <td class="text-right">
                                                            <fmt:formatNumber pattern="###,###"
                                                                              value="${p.originalPrice}"/>
                                                        </td>
                                                        <td class="text-right">
                                                            <fmt:formatNumber pattern="###,###" value="${p.newPrice}"/>
                                                        </td>
                                                        <td class="text-right">
                                                            <c:choose>
                                                                <c:when test="${approved}">
                                                                    Đã chấp nhận
                                                                    <input type="hidden" name="contractorPrice">
                                                                </c:when>
                                                                <c:when test="${canceled}">
                                                                    Đã hủy
                                                                    <input type="hidden" name="contractorPrice">
                                                                </c:when>
                                                                <c:when test="${waitResponse}">
                                                                    Chờ phản hồi
                                                                    <input type="hidden" name="contractorPrice">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input type="number" name="contractorPrice" class="text-right">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${!waitResponse}">
                                    <div class="form-group row">
                                        <c:if test="${!(deal.bossApprove == false && deal.contructorApprove == false) && !(deal.bossApprove == true && deal.contructorApprove == true)}">
                                            <div class="col-md-6">
                                                <label>Nhắn tin cho người bán</label>
                                                <textarea class="form-control"
                                                          placeholder="Nhắn tin cho người bán"></textarea>
                                            </div>
                                        </c:if>
                                        <div class="col-md-6">
                                            <c:forEach var="m" items="${messages}">
                                                <fmt:formatDate value="${m.time}" var="time" pattern="dd/MM/yyyy HH:mm"/>
                                                <i style="color: #008CBA">${m.sender}</i> (${time}): ${m.message}<br>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                                <%-- Buttons--%>
                            <div class="panel-footer">
                                <div class="form-group row">
                                    <div class="col-md-2 col-md-offset-6">
                                        <c:if test="${deal.bossApprove == true && deal.contructorApprove == false}">
                                            <input type="submit" class="btn btn-primary btn-group-justified" value="Gửi">
                                        </c:if>
                                    </div>
                                    <c:if test="${deal.bossApprove == true}">
                                        <c:if test="${!(deal.bossApprove == true && deal.contructorApprove == true)}">
                                            <div class="col-md-2">
                                                <a href="${pageContext.request.contextPath}/deal/confirm?orderId=${deal.orderId}&dealHistoryId=${deal.id}" class="btn btn-success">Đồng ý</a>
                                            </div>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${!waitResponse && !approved && !canceled  && (!deal.bossApprove && !deal.contructorApprove)}">
                                        <div class="col-md-2">
                                            <a href="${pageContext.request.contextPath}/deal/cancelDeal?orderId=${deal.orderId}&dealHistoryId=${deal.id}" class="btn btn--dark btn-group-justified">Huỷ</a>
                                        </div>
                                    </c:if>

                                        <%--<div class="col-md-2">--%>
                                        <%--<a href="${pageContext.request.contextPath}/deal" class="btn btn--light btn-group-justified">Quay lại</a>--%>
                                        <%--</div>--%>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </section>
</main>
<%@ include file="../../template/footer-tag__user.jsp" %>

<script type="text/javascript">

    function valid(element, pattern, message) {
        var obj = document.querySelector(element);
        var result = obj.value.match(pattern) != null;
        if (!result) {
            window.alert(message);
            obj.focus();
        }
        return result;
    }

    function checkBlank() {
        return valid("input[type=number]", "^\\w+$", "Chỉ nhập từ 1 - 999");
    }

    function checkRange() {
        return valid("input[type=number]", "^\\d{1,3}$", "Chỉ nhập từ 1 - 999");
    }

    function isPositive(element, message) {
        var obj = document.querySelector(element);
        var result = obj.value;
        if (result < 1) {
            window.alert(message);
            obj.focus();
        }
        return result;
    }

    function checkPositive() {
        return isPositive('input[type=number]', 'Chỉ nhập từ 1 - 999');
    }

    function checkAll() {
        return checkBlank() && checkRange() && checkPositive();

    }
</script>
</body>
</html>
