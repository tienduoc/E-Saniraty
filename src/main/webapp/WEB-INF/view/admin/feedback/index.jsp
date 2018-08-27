<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 8/13/18
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý phản hồi"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>


    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/feedback/"/>
                <jsp:param name="pageTitle" value="phản hồi"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>

                                <th class="text-center">Khách hàng</th>
                                <th class="text-center">Nội dung nhận xét</th>
                                <th class="text-center">Mã sản phẩm</th>
                                <th class="text-center">Ngày đăng</th>
                                <th class="text-center">Trạng thái</th>
                                <th class="text-center">Tùy chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="feedback" items="${feedbacks}">
                            <tr>
                                <td>${feedback.accountByUsername.fullname}</td>
                                <td>${feedback.feedbackContent}</td>
                                <td>
                                    <a target="_blank" href="${pageContext.request.contextPath}/product/detail?id=${feedback.productId}">${feedback.productId}</a>
                                </td>
                                <td><fmt:formatDate value="${feedback.date}" pattern="dd/MM/yyyy HH:mm"/></td>
                                <td class="text-center">
                                    <c:if test="${feedback.approve}"><i class="fa fa-eye" style="color: green" data-toggle="tooltip" title="Hiển thị"></i></c:if>
                                    <c:if test="${!feedback.approve}"><i class="fa fa-eye-slash" style="color: red" data-toggle="tooltip" title="Ẩn"></i></c:if>
                                    <c:if test="${feedback.approve == null}">Mới</c:if>
                                </td>
                                <td class="text-center">
                                    <c:if test="${!feedback.approve}">
                                        <a href="${pageContext.request.contextPath}/admin/feedback/approve?id=${feedback.feedbackId}" class="btn btn-success btn-xs" data-toggle="tooltip" title="Đồng ý hiển thị"><i class="fa fa-check"></i></a>

                                    </c:if>
                                    <c:if test="${feedback.approve}">
                                        <a href="${pageContext.request.contextPath}/admin/feedback/unapprove?id=${feedback.feedbackId}" class="btn btn-danger btn-xs" data-toggle="tooltip" title="Không hiển thị"><i class="fa fa-eye-slash"></i></a>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

    </div>

    <jsp:include page="../../template/script-tags__admin.jsp">
        <jsp:param name="columnDefs" value=""/>
    </jsp:include>
</body>
</html>
