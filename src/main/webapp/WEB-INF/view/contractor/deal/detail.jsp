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
                    <div class="panel panel-primary">
                        <form:form action="/deal/update" modelAttribute="deal" method="post" id="frmDeal">
                            <div class="panel-heading">
                                <h4 class="panel-title">Điều chỉnh giá bán</h4>
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
                                                    <th>Số lượng</th>
                                                    <th>Giá ban đầu</th>
                                                    <th>Giá công ty đưa ra</th>
                                                    <c:if test="${!(deal.bossApprove == false && deal.contructorApprove == false) && !(deal.bossApprove == true && deal.contructorApprove == true)}">
                                                        <th>Giá mong muốn</th>
                                                    </c:if>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <%--<form:form action="/deal/update" modelAttribute="deal" method="post" id="frmDeal">--%>
                                                <input type="hidden" name="dealHistoryId" value="${deal.id}">
                                                <form:hidden path="responseDate"/>
                                                <form:hidden path="orderId"/>
                                                <c:forEach var="p" items="${dealDetails}">
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
                                                        <c:if test="${!(deal.bossApprove == false && deal.contructorApprove == false) && !(deal.bossApprove == true && deal.contructorApprove == true)}">
                                                            <td class="text-right">
                                                                <input type="text" name="contractorPrice"
                                                                       class="text-right">
                                                            </td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                                    <%--<input type="submit" value="len">--%>
                                                    <%--</form:form>--%>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                                    <%-- Message--%>
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="chatbox">
                                            <div class="chatlogs">
                                                <c:forEach var="m" items="${messages}">
                                                    <c:if test="${!m.sender.equals(deal.orderByOrderId.username)}">
                                                        <div class="chat friend">
                                                            <p class="chat-message">${m.message}</p>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${m.sender.equals(deal.orderByOrderId.username)}">
                                                    <div class="chat self">
                                                        <p class="chat-message">${m.message}</p>
                                                    </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                            <div class="chat-form">
                                                <textarea placeholder="Nhắn tin cho người bán"></textarea>
                                                <button>Gửi</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <%-- Message này cũ nè bỏ đi--%>
                                <div class="form-group row">


                                    <c:if test="${!(deal.bossApprove == false && deal.contructorApprove == false) && !(deal.bossApprove == true && deal.contructorApprove == true)}">
                                        <div class="col-md-6">
                                            <label>Nhắn tin cho người bán</label>
                                            <textarea class="form-control"
                                                      placeholder="Nhắn tin cho người bán"></textarea>
                                        </div>
                                    </c:if>
                                    <div class="col-md-6">
                                        <label>Tin nhắn từ người bán</label><br>
                                        <c:forEach var="m" items="${messages}">
                                            ${m.sender} : ${m.message}<br>
                                            <a style="font-size: small; color: darkgray"><fmt:formatDate
                                                    value="${m.time}" pattern="HH:mm dd/MM/yyyy"/></a><br>
                                            <hr>
                                        </c:forEach>
                                    </div>
                                </div>

                            </div>

                            <%-- Buttons--%>
                            <div class="panel-footer">
                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <c:if test="${!(deal.bossApprove == false && deal.contructorApprove == false) && !(deal.bossApprove == true && deal.contructorApprove == true)}">
                                            <input type="submit" class="btn btn-primary" value="Xác nhận">
                                            <input type="submit" class="btn btn-danger" value="Huỷ">
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/deal" class="btn btn-default">Quay
                                            lại</a>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <!-- END TODO -->
        </div>
    </section>
</main>
</body>
</html>
