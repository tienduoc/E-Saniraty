<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/11/2018
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Giỏ hàng"/>
</jsp:include>
<body>
<%@ include file="../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Giỏ hàng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Giỏ hàng</a>
                </li>
            </ol>
        </div>
    </section>
    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">Thông tin giỏ hàng
                            <span class="heading-secondary--line"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    ${msg}
    <section class="section-cart">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped" id="tblCart">
                            <thead class="u-bg-color-primary-light">
                            <tr class="text-uppercase">
                                <th class="text-center">Sản phẩm</th>
                                <th class="text-center">Hãng sản xuất</th>
                                <th class="text-center">Đơn giá</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-center">Thành tiền</th>
                                <th class="text-center"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <form:form action="/cart/update" method="post" name="update" id="update">
                                <c:set var="sum" value="0"></c:set>
                                <c:forEach var="item" items="${sessionScope.cart}">
                                    <c:set var="sum" value="${sum + item.product.salePrice * item.quantity }"></c:set>
                                    <tr>
                                        <input type="hidden" name="id" value="${item.product.id}">
                                        <td>
                                            <a href="${rootUrl}/product/detail?id=${item.product.id}">${item.product.name}</a>
                                        </td>
                                        <td class="text-left">
                                                ${item.product.manufacturerByManufacturerId.name}
                                        </td>
                                        <td class="text-right">
                                            <fmt:formatNumber type="number" pattern="###,###" value="${item.product.salePrice}"/>
                                        </td>
                                        <td class="text-right">
                                            <input type="text" id="quantity" name="quantity"
                                                   onblur="checkNumber()"
                                                   class="form-control input-number"
                                                   value="${item.quantity}"
                                                   style="width: 100px; text-align: right;">
                                            <br/>
                                        </td>
                                        <td class="text-right">
                                            <fmt:formatNumber type="number" pattern="###,###"
                                                              value="${item.product.salePrice * item.quantity}"/>
                                        </td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/cart/remove?id=${item.product.id}">
                                                <span style="font-size: 10px;">Xoá</span>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </form:form>
                            </tbody>
                            <tfoot class="u-bg-color-primary-light">
                            <tr>
                                <td colspan="4" class="text-right"><strong>Tổng cộng</strong></td>
                                <td class="text-right">
                                    <strong>
                                        <fmt:formatNumber type="number" pattern="###,###" value="${sum}"/>
                                        <input type="hidden" name="totalPrice" value="${sum}">
                                    </strong>
                                </td>
                                <td></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <form:form action="/cart/buy" method="post" id="buy">
                    <input type="hidden" name="totalPrice" value="${sum}">
                    <div class="col-md-2  col-md-offset-8">
                        <a href="${pageContext.request.contextPath}/" class="button button--light">Quay lại</a>
                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn button--black col-xs-12" id="buy">Đặt hàng</button>
                    </div>
                </form:form>
            </div>
        </div>
    </section>
</main>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/main.js"></script>
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

    function checkNumber() {
        var nodes = document.querySelectorAll("#tblCart input[type=text]");
        for (var i = 0; i < nodes.length; i++) {
            if (nodes[i].value > 999 || nodes[i].value < 1 || nodes[i].value == "" || !/[0-9.]/.test(nodes[i].value)) {
                alert("Vui lòng nhập giá trị từ 1 - 999");
                return false;
                break;
            } else if (i == nodes.length -1) {
                document.getElementById('update').submit();
            }
        }
    };

    $('#buy').on('click',function () {
        if(checkNumber() != false) {
            document.getElementById('buy').submit();
        }
    });

</script>
</body>
</html>