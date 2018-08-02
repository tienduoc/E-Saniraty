<%--
  Created by IntelliJ IDEA.
  User: buunguyenlam
  Date: 6/19/2018
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <form:form action="${pageContext.request.contextPath}/authenticateUser" method="post" class="form" id="login-form">

                        <p>
                            <input type="text" name="username" class="form__input" placeholder="Tên đăng nhập">
                        </p>

                        <p>
                            <input type="password" name="password" class="form__input" placeholder="Mật khẩu">
                        </p>
                        <p>
                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger">
                                    <strong>Lỗi!</strong> Tên đăng nhập hoặc mật khẩu không đúng!
                                </div>
                            </c:if>
                        </p>

                        <p style="padding-top: 1rem;">
                            <input type="submit" value="Đăng nhập" name="login" class="btn button--black col-md-12 text-uppercase" onsubmit="return valid.Apply()">
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

<script type="text/javascript" src="/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="/assets/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/assets/js/jquery.validate.js"></script>
<script type="text/javascript" src="/assets/js/messages_vi.js"></script>
<script type="text/javascript" src="/assets/js/main.js"></script>
<script type="text/javascript" src="/assets/js/myValidation.js"></script>
</body>

</html>