<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/9/2018
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-tag__user.jsp">
    <jsp:param name="title" value="Thương lượng"/>
</jsp:include>
<body>
<%@ include file="../../template/header-tag__user.jsp" %>
<main>
    <
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Thương lượng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Chi tiết đơn hàng</a>
                </li>
            </ol>
        </div>
    </section>
    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">
                            đơn hàng: ${order.id}
                            <span class="heading-secondary--line"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <form:form action="/deal/create" method="post" id="formDeal">
            <div class="row">

                <div class="col-md-12">

                    <div class="table-responsive">
                        <table class="table table-striped" id="tblDeal">
                            <thead class="u-bg-color-primary-light">
                            <tr class="text-uppercase">
                                <th class="text-center">Sản phẩm</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-center">Giá bán</th>
                                <th class="text-center">Giá mong muốn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <input type="hidden" name="orderId" value="${order.id}">
                            <c:forEach var="od" items="${order.orderDetailsById}">
                                <tr>
                                    <td>
                                            ${od.productByProductId.name}
                                    </td>
                                    <td class="text-right">
                                            ${od.quantity}
                                    </td>
                                    <td class="text-right">
                                        <fmt:formatNumber type="number" pattern="###,###" value="${od.unitPrice}"/>
                                    </td>
                                    <td class="text-right">
                                        <input name="contractorPrice" type="text" class="js-input text-right"/>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Deal Message  -->
                <aside class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-xs-offset-0">
                    <!-- Checkout wrapper -->
                    <div class="total">
                        <!-- Row -->
                        <div class="row total__row">
                            <div class="col-md-6 total__cell">
                                <p class="total__cell--heading"> Nội dung thương lượng</p>
                            </div>
                        </div>
                        <div class="row total__row">
                            <div class="col-xs-12 total__cell">
                                <textarea style="height: 8.3rem;" name="message" rows="4" cols="50"></textarea>
                            </div>
                        </div>
                    </div>
                </aside>
                <!-- Deal Buttons  -->
                <aside class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-xs-offset-0" style="margin-bottom: 8rem;">

                    <div class="total">
                        <!-- Row -->
                        <div class="row total__row">
                            <div class="col-md-6 total__cell">
                                <p class="total__cell--heading">Tổng cộng:</p>
                                <p class="total__cell--sub">
                                    <fmt:formatNumber value="${order.totalPrice}" pattern="###,###"/>
                                </p>
                            </div>
                        </div>
                        <!-- Buttons -->
                        <div class="row total__row">
                            <div class="col-lg-6 col-lg-offset-0 col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                                <a href="${pageContext.request.contextPath}/order" class="btn btn--light btn-group-justified">Quay lại</a>
                            </div>
                            <div class="col-lg-6 col-lg-offset-0 col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                                <button type="submit" class="btn btn--dark btn-group-justified" id="sendDeal">Gửi yêu cầu</button>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </form:form>
    </div>
</main>
<%@ include file="../../template/footer-tag__user.jsp" %>
<script>
    <%-- Keep vertical scrollbar position --%>
    $(window).scroll(function () {
        sessionStorage.scrollTop = $(this).scrollTop();
    });
    $(document).ready(function () {
        if (sessionStorage.scrollTop != "undefined") {
            $(window).scrollTop(sessionStorage.scrollTop);
        }
    });
    $('.js-input').on('input', () => {
        if ($(this).value > 999 || $(this).value < 1 || $(this).value == "" || !/[0-9.]/.test($(this)[i].value)) {
            alert("Vui lòng nhập giá trị từ 1 - 999");
            return false;
        }
    });
    // function isValidNumber() {
    //
    //     return true;
    // };


    $('#sendDeal').on('click', function () {
        if (isValidNumber()) {
            document.getElementById('formDeal').submit();
        }
    });

</script>
</body>
</html>