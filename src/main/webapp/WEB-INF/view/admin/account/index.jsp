<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/12/2018
  Time: 2:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý tài khoản"/>
</jsp:include>

<body>

<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/nav-tag__admin.jsp"/>
    <div id="page-wrapper">
        <div class="container-fluid">

            <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/account/"/>
                <jsp:param name="pageTitle" value="tài khoản"/>
            </jsp:include>


            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách tài khoản</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/account/create"
                           class="btn btn-primary">Thêm</a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Tài khoản</th>
                                <th class="text-center">Họ tên</th>
                                <th class="text-center">Vai trò</th>
                                <th class="text-center">Email</th>
                                <th class="text-center">Địa chỉ</th>
                                <th class="text-center">Điện thoại</th>
                                <th class="text-center">Trạng thái</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="acc" items="${accounts}">
                                <c:if test="${!acc.roleId.matches('AD|BO')}">
                                    <tr>
                                        <td>${acc.username}</td>
                                        <td>${acc.fullname}</td>
                                        <td>${acc.roleByRoleId.name}</td>
                                        <td><a href="mailto:${acc.email}">${acc.email}</a></td>
                                        <td>${acc.address}</td>
                                        <td><a href="tel:${acc.phone}">${acc.phone}</a></td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${acc.enabled}">
                                                    <i class="fa fa-check" style="color: green" data-toggle="tooltip" title="Kích hoạt"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fa fa-close" style="color: red" data-toggle="tooltip" title="Đóng"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <a href="${pageContext.request.contextPath}/admin/account/update?username=${acc.username}"
                                               class="btn btn-warning btn-xs" data-toggle="tooltip" title="Cập nhật thông tin"><i class="fa fa-pencil"></i></a>
                                            <a href="${pageContext.request.contextPath}/admin/account/detail?username=${acc.username}"
                                               class="btn btn-success btn-xs" data-toggle="tooltip" title="Xem chi tiết"><i class="fa fa-eye"></i></a>

                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value="
        columnDefs: [
            { width: '10px', targets: 0 },
            { width: '30px', targets: 2 },
            { width: '50px', targets: 3 },
            { width: '10px', targets: 6 },
            { width: '40px', targets: 7 }
         ],
         fixedColumns: true,
    "/>
</jsp:include>

</body>

</html>
