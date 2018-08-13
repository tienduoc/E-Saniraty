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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Cảm ơn"/>
</jsp:include>

<body>
<%@ include file="../template/header-tag__user.jsp" %>
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
                    <h2 class="heading-primary--title">Cảm ơn bạn đã mua hàng
                        <span class="heading-primary--line"></span>
                    </h2>
                    <div class="clear"></div>
                </div>
                <c:if test="${orderId != null}">
                    <p style="font-size:20px;color:#5C5C5C;">Mã đơn hàng của bạn là<br>
                        <a href="${pageContext.request.contextPath}/order/view?orderId=${orderId}">${orderId}</a></p>
                    <br><br>
                <sec:authorize access="hasAnyAuthority('Contractor')">
                    <p style="font-size:20px;color:#5C5C5C;"><a href="${pageContext.request.contextPath}/deal/create?orderId=${orderId}">Nhấn để thương lượng giá sán phẩm</a></p>
                    <br>
                    <br>
                </sec:authorize>
                </c:if>
                <a href="${pageContext.request.contextPath}/" class="button button--black">Quay về
                </a>
                <br>
                <br>
            </div>
        </div>
    </div>
</main>

<%@ include file="../template/footer-tag__user.jsp" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
