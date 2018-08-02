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
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Thương lượng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Thương lượng</a>
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
        <form:form action="/deal/create" method="post">
            <div class="row">

                <div class="col-md-12">

                    <div class="table-responsive">
                        <table class="table table-striped">
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
                                        <input name="contractorPrice" type="text"/>
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
                                    <%--todo chuyển chữ hoa về lại bình thường--%>
                                <textarea class="total__cell--heading" style="height: 8.3rem;" name="message" rows="4" cols="50"></textarea>
                            </div>
                        </div>
                    </div>
                </aside>
                <!-- Deal Buttons  -->
                <aside class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-xs-offset-0">

                    <div class="total">
                        <!-- Row -->
                        <div class="row total__row">
                            <div class="col-md-6 total__cell">
                                <p class="total__cell--heading">Tổng cộng:</p>
                                <p class="total__cell--sub">1.970.000d</p>
                            </div>
                        </div>
                        <!-- Row -->
                        <div class="row total__row">
                            <div class="col-md-6 total__cell">
                                <p class="total__cell--heading">Giá mong muốn:</p>
                                <p class="total__cell--sub">1.520.000d</p>
                            </div>
                        </div>
                        <!-- Buttons -->
                        <div class="row total__row">
                            <div class="col-lg-6 col-lg-offset-0 col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                                <button type="button" class="btn button--submit col-xs-12" style="color: black; text-transform: uppercase;">Quay lại</button>
                            </div>
                            <div class="col-lg-6 col-lg-offset-0 col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                                <button type="submit" class="btn button--black col-xs-12">Gửi yêu cầu</button>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </form:form>
    </div>
</main>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/owl.carousel.min.js"></script>
<script src="/assets/js/main.js"></script>
</body>
</html>