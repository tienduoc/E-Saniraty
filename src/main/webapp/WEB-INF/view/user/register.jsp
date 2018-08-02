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

                    <form:form action="${pageContext.request.contextPath}/register" modelAttribute="account" method="post" class="form" id="register-form">
                        <p>
                            <input type="text" name="fullname" class="form__input" placeholder="Họ tên">
                        </p>
                        <p>
                            <input type="text" name="username" class="form__input" placeholder="Tên đăng nhập">
                        </p>
                        <p>
                            <input type="password" id="password" name="password" class="form__input" placeholder="Mật khẩu">
                        </p>
                        <p>
                            <input type="password" name="passwordConfirm"  class="form__input" placeholder="Nhập lại mật khẩu">
                        </p>
                        <p>
                            <input type="text" name="email" class="form__input" placeholder="Email">
                        </p>
                        <p>
                            <input type="text" name="phone" class="form__input" placeholder="Điện thoại">
                        </p>
                        <p style="padding-top: 1rem;">
                            <input type="submit" value="Đăng ký" name="register" class="btn button--black col-md-12" onsubmit="return valid.Apply()">
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

<script type="text/javascript" src="/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/assets/js/jquery.validate.js"></script>
<script type="text/javascript" src="/assets/js/messages_vi.js"></script>
<script type="text/javascript" src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/myValidation.js"></script>
</body>

</html>
