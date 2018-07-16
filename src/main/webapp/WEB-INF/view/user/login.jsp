<%--
  Created by IntelliJ IDEA.
  User: buunguyenlam
  Date: 6/19/2018
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Đăng nhập" />
</jsp:include>

<body>
<main>
    <section class="section-login">
        <div class="container">
            <div class="row">

                <div class="row">
                    <div class="col-md-12">
                        <div class="heading-primary">
                            <h2 class="heading-primary--title">Đăng nhập
                                <span class="heading-primary--line"></span>
                            </h2>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>

                <div class="clear"></div>

                <div class="col-md-6 col-sm-8 col-xs-12 col-md-offset-3 col-sm-offset-2 col-xs-offset-0">

                    <form:form action="${pageContext.request.contextPath}/authenticateUser" method="post" class="form">
                        <p>
                            <label for="username">Tên đăng nhập<span class="required">*</span></label>
                            <input type="text" name="username" id="username" class="form__input" required>
                        </p>

                        <p>
                            <label for="password">Mật khẩu<span class="required">*</span></label>
                            <input type="password" name="password" id="password" class="form__input" required>
                        </p>

                        <p style="padding-top: 1rem;">
                            <input type="submit" value="Đăng nhập" name="login" class="btn button--black col-md-12 text-uppercase">
                        </p>

                        <p class="pull-right" style="padding-top: 20px;">
                            <a href="${pageContext.request.contextPath}/register">Đăng ký</a> |
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