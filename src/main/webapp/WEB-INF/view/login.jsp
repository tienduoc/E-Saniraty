<%--
  Created by IntelliJ IDEA.
  User: buunguyenlam
  Date: 6/19/2018
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../resources/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../resources/dist/css/myStyle.css">

    <link rel="stylesheet" href="../resources/dist/css/modal.css">
    <title>Đăng nhập</title>
</head>

<body>
<section class="page_single">
    <div class="container">
        <div class="row">
            <!--//==Section Heading Start==//-->
            <div class="col-md-12">
                <div class="centered-title">
                    <h2>Đăng nhập<span class="heading-border"></span></h2>
                    <div class="clear"></div>
                    <em>doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo <br>inventore veritatis et quasi architecto beatae</em>
                </div>
            </div>
            <div class="clear"></div>

            <!--//==Login Section Start==//-->
            <div class="col-md-6 col-sm-8 col-xs-12 col-md-offset-3 col-sm-offset-2 col-xs-offset-0">

                <!--//==Form Start==//-->
                <form action="${pageContext.request.contextPath}/authenticateUser" method="POST" class="login-form">
                            <%--Username--%>
                    <p>
                        <label for="username">Tên đăng nhập <span class="required">*</span></label>
                        <input type="text" name="username" id="username" class="form-controller">
                    </p>
                            <%--Password--%>
                    <p>
                        <label for="password">Mật khẩu <span class="required">*</span></label>
                        <input type="password" name="password" id="password" class="form-controller">
                    </p>
                            <%--Button--%>
                    <p>
                        <input type="submit" value="Đăng nhập" name="login" class="theme-button col-md-12">
                    </p>
                            <%--Register--%>
                    <p class="pull-right" style="padding-top: 20px;">
                        <a href="${pageContext.request.contextPath}/register">Chưa có tài khoản?</a>
                    </p>
                </form>
                <!--//==Form End==//-->
            </div>
            <!--//==Login Section End==//-->
        </div>
    </div>
</section>

<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
