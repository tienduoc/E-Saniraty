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

            <div class="row">

                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="u-bg-color-primary-light">
                        <tr class="text-uppercase">
                            <th class="text-center">Mã đơn hàng</th>
                            <th class="text-center">Ngày yêu cầu</th>
                            <th class="text-center">Ngày phản hồi</th>
                            <th class="text-left">Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="deal" items="${deals}">
                                <tr>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/deal/view?dealHistoryId=${deal.id}"><strong>${deal.orderId}</strong></a>
                                    </td>
                                    <td class="text-center"><fmt:formatDate value="${deal.requestDate}" pattern="dd/MM/yyyy" /></td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${deal.responseDate == null || (deal.requestDate > deal.responseDate)}">
                                                Chờ phản hồi
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:formatDate value="${deal.responseDate}" pattern="dd/MM/yyyy" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-left">
                                        <c:choose>
                                            <c:when test="${deal.contructorApprove == true && (deal.bossApprove == false || deal.bossApprove == null)}">
                                                Đang thương lượng
                                            </c:when>
                                            <c:when test="${deal.contructorApprove == false && deal.bossApprove == true}">
                                                Đã trả lời
                                            </c:when>
                                            <c:when test="${deal.contructorApprove == true && deal.bossApprove == true}">
                                                Đã duyệt
                                            </c:when>
                                            <c:when test="${deal.contructorApprove == false && deal.bossApprove == false}">
                                                Đã hủy
                                            </c:when>
                                        </c:choose>

                                    </td>
                                </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

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
