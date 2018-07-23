<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/11/2018
  Time: 11:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Đăng ký" />
</jsp:include>

<body>
<main>

    <section class="section-register">
        <div class="container">
            <div class="row">

                <div class="row">
                    <div class="col-md-12">
                        <div class="heading-primary">
                            <h2 class="heading-primary--title">Đăng ký
                                <span class="heading-primary--line"></span>
                            </h2>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>

                <div class="clear"></div>

                <div class="col-md-6 col-sm-8 col-xs-12 col-md-offset-3 col-sm-offset-2 col-xs-offset-0">

                    <form:form action="${pageContext.request.contextPath}/register" modelAttribute="account" method="post" class="form">
                        <p>
                            <label for="fullname">Họ tên<span class="required">*</span></label>
                            <input type="text"name="fullname" id="fullname" class="form__input" minlength="4" maxlength="100" required>
                        </p>
                        <p>
                            <label for="username">Tên đăng nhập<span class="required">*</span></label>
                            <input type="text" name="username" id="username" class="form__input" minlength="5" maxlength="50" required>
                        </p>
                        <p>
                            <label for="password">Mật khẩu<span class="required">*</span></label>
                            <input type="password" name="password" id="password" class="form__input" minlength="8" required>
                        </p>
                        <p>
                            <label id="message" class="form__message"></label>
                        </p>
                        <p>
                            <label for="passwordConfirm">Nhập lại mật khẩu<span class="required">*</span></label>
                            <input type="password" name="passwordConfirm" id="passwordConfirm" class="form__input" required>
                        </p>
                        <p>
                            <label id="messageConfirm" class="form__message"></label>
                        </p>
                        <p>
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" class="form__input">
                        </p>
                        <p>
                            <label for="phone">Điện thoại</label>
                            <input type="text" name="phone" id="phone" class="form__input" minlength="10">
                        </p>
                        <p><label id="messagePhone" class="form__message"></label></p>
                        <p style="padding-top: 1rem;">
                            <input type="submit" value="Đăng ký" name="register" class="btn button--black col-md-12">
                        </p>
                        <p class="pull-right" style="padding-top: 20px;">
                            <a href="${pageContext.request.contextPath}/login">Đăng nhập</a> |
                            <a href="${pageContext.request.contextPath}/">Trở về trang chủ</a>
                        </p>
                    </form:form>
                </div>

            </div>
        </div>
    </section>

</main>

<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/main.js"></script>
</body>

</html>
