<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/29/18
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Đơn hàng của tôi"/>
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
    <section class="section-cart">
        <div class="container">
            <div class="row order">
                <aside class="col-sm-6 col-sm-offset-3" style="border: 1px solid #EEEEEE;
                        padding: 25px 30px;
                        background-color: rgba(238, 238, 238, 0.64);">
                    <br>
                    <br>
                    <div class="heading-primary">
                        <h2 class="heading-primary--title">Giỏ hàng trống
                            <span class="heading-primary--line"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                    <p class="text-center" style="font-size:20px;color:#5C5C5C;">Không có sản phẩm nào trong giỏ hàng của bạn.</p>
                    <br><br>
                    <a href="${pageContext.request.contextPath}/" class="button button--black">Tiếp tục mua hàng</a>
                    <br><br>
                </aside>
            </div>
        </div>
        </div>
    </section>
</main>
<%@ include file="../template/footer-tag__user.jsp" %>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
