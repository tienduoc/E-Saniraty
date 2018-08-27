<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/19/2018
  Time: 2:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="../../template/head-tag__user.jsp">
    <jsp:param name="title" value="Đã nhận"/>
</jsp:include>
<body>
<main>
    <div class="container">
        <div class="row text-center">
            <div class="col-sm-6 col-sm-offset-3" style="border: 1px solid #EEEEEE;
                margin-top: 10rem;
                padding: 25px 30px;
                background-color: rgba(238, 238, 238, 0.64);">
                <br>
                <br>
                <div class="heading-primary">
                    <h2 class="heading-primary--title">Đã gửi yêu cầu
                        <span class="heading-primary--line"></span>
                    </h2>
                    <div class="clear"></div>
                </div>
                <p style="font-size:20px;color:#5C5C5C;">Hệ thống đã tiếp nhận yêu cầu của quý khách!</p>
                <br>
                <br>
                <a href="${pageContext.request.contextPath}/deal" class="btn btn--dark btn-group-justified">Quay về
                </a>
                <br>
                <br>
            </div>
        </div>
    </div>
</main>
</body>
</html>
