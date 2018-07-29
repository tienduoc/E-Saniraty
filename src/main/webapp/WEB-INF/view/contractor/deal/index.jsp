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
<html>
<jsp:include page="../../template/head-tag__user.jsp">
    <jsp:param name="title" value="Danh mục sản phẩm" />
</jsp:include>
<body>
<%@ include file="../../template/header-tag__user.jsp"%>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Thương lượng của tôi</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Xem lại đơn hàng</a>
                </li>
            </ol>
        </div>
    </section>

    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">Thương lượng của tôi
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

            <div class="row order">

                <!-- Cart lists -->
                <aside class="col-md-12">
                    <!-- Row heading -->

                    <div class="row u-bg-color-primary-light u-padTB-small u-margin-LR-none hidden-sm hidden-xs">
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small">
                                <strong class="text-uppercase">Mã đơn hàng</strong>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="u-bg-color-primary-light u-padTB-small">
                                <strong class="text-uppercase">Sản phẩm</strong>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small">
                                <strong class="text-uppercase">Ngày yêu cầu</strong>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small">
                                <strong class="text-uppercase">Ngày phản hồi</strong>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small">
                                <strong class="text-uppercase">Trạng thái</strong>
                            </div>
                        </div>
                    </div>

                    <!-- Item row -->
                    <c:forEach var="deal" items="${deals}">
                    <div class="row order__row u-margin-LR-none">
                        <!-- ID -->
                        <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                            <div class="order__cell">
                                <div class="order__cell">
                                    <p class="order__cell--box-info text-left">
                                        <a href="${pageContext.request.contextPath}/deal/view?dealHistoryId=${deal.dealHistoryId}"><strong>${deal.dealHistoryByDealHistoryId.orderId}</strong></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!-- Date -->
                        <div class="col-lg-4 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                            <div class="order__cell">
                                <div class="order__cell">
                                    <p class="order__cell--box-info text-left">
                                        ${deal.productByProductId.name}
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!-- Product name -->
                        <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                            <div class="order__cell">
                                <p class="order__cell--box-info text-left">
                                    <fmt:formatDate value="${deal.dealHistoryByDealHistoryId.requestDate}" pattern="dd/MM/yyyy" />
                                </p>
                            </div>
                        </div>

                        <!-- Price -->
                        <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                            <div class="order__cell">
                                <p class="order__cell--box-info text-left">
                                    <c:choose>
                                        <c:when test="${deal.dealHistoryByDealHistoryId.responseDate == null || (deal.dealHistoryByDealHistoryId.requestDate < deal.dealHistoryByDealHistoryId.responseDate)}">
                                            Chờ phản hồi
                                        </c:when>
                                        <c:when test="${deal.dealHistoryByDealHistoryId.responseDate != null}">
                                            <fmt:formatDate value="${deal.dealHistoryByDealHistoryId.responseDate}" pattern="dd/MM/yyyy" />
                                        </c:when>
                                    </c:choose>
                                </p>
                            </div>
                        </div>

                        <!-- Price -->
                        <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                            <div class="order__cell">
                                <p class="order__cell--box-info text-left">
                                    <c:choose>
                                        <c:when test="${deal.dealHistoryByDealHistoryId.contructorApprove == true && (deal.dealHistoryByDealHistoryId.bossApprove == false || deal.dealHistoryByDealHistoryId.bossApprove == null)}">
                                            Đang thương lượng
                                        </c:when>
                                        <c:when test="${deal.dealHistoryByDealHistoryId.contructorApprove == false && deal.dealHistoryByDealHistoryId.bossApprove == true}">
                                            Đã trả lời
                                        </c:when>
                                        <c:when test="${deal.dealHistoryByDealHistoryId.contructorApprove == true && deal.dealHistoryByDealHistoryId.bossApprove == true}">
                                            Đã duyệt
                                        </c:when>
                                        <c:when test="${deal.dealHistoryByDealHistoryId.contructorApprove == false && deal.dealHistoryByDealHistoryId.bossApprove == false}">
                                            Đã hủy
                                        </c:when>
                                    </c:choose>
                                </p>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </aside>
            </div>
        </div>
    </section>
</main>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
    $(window).scroll(function() {
        sessionStorage.scrollTop = $(this).scrollTop();
    });

    $(document).ready(function() {
        if (sessionStorage.scrollTop != "undefined") {
            $(window).scrollTop(sessionStorage.scrollTop);
        }
    });
</script>
</body>
</html>
