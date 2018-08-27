<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/12/2018
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/head-admin_tag.jsp">
    <jsp:param name="title" value="Tạo tài khoản"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/nav-tag__admin.jsp" />

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/breakcrumb--child__admin.jsp">
                <jsp:param name="parentURL" value="${pageContext.request.contextPath}/admin/account/"/>
                <jsp:param name="parentTitle" value="tài khoản"/>
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/account/create"/>
                <jsp:param name="pageTitle" value="Tạo tài khoản"/>
            </jsp:include>
            <!-- /.row -->


            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Tạo tài khoản mới</h4>
                        </div>
                        <div class="panel-body">
                            <form:form action="create" modelAttribute="account" method="post">
                                <div class="form-group">
                                    <label for="username">Tên đăng nhập</label>
                                    <form:input path="username" type="text" class="form-control" name="username" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="fullname">Họ và tên</label>
                                    <form:input path="fullname" type="text" class="form-control" name="fullname" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="password">Mật khẩu</label>
                                    <form:input path="password" type="password" class="form-control" name="password" required="required"/>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <form:input path="email" type="email" class="form-control" name="email" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ</label>
                                    <form:input path="address" type="text" class="form-control" name="address"  required="required"/>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Điện thoại</label>
                                    <form:input path="phone" type="text" class="form-control" name="phone" required="required"/>
                                </div>
                                <div class="form-group">
                                    <label>Vai trò</label>
                                    <select name="roleId" required style="display:block">
                                        <option value="">None</option>
                                        <c:forEach var="r" items="${roles}">
                                            <c:if test="${!(r.name.equalsIgnoreCase('Boss') || r.name.equalsIgnoreCase('Admin'))}">
                                                <option value="${r.id}">${r.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="status">Kích hoạt</label>
                                    <form:checkbox path="enabled" name="status" checked="checked"/>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Lưu">
                                    <a href="${pageContext.request.contextPath}/admin/account" class="btn btn-default">Quay lại</a>
                                </div>
                            </form:form>
                        </div>
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
    <jsp:param name="columnDefs" value=""/>
</jsp:include>

</body>

</html>