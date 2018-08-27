<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 8/13/18
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý nhận xét"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />


    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/comment/"/>
                <jsp:param name="pageTitle" value="nhận xét"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách bình luận</h4>
                    <div class="form-group">
                        <a href="comboCreate.html" class="btn btn-primary">Thêm</a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Status</th>
                                <th class="text-center">Author</th>
                                <th class="text-center">Comment</th>
                                <th class="text-center">Comment on</th>
                                <th class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td>Approved</td>
                                <td>johndoe</td>
                                <td>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                                    <span>April 28th 2018</span>
                                </td>
                                <td>W126</td>
                                <td>
                                    <button class="badge bg-success">Approve</button>
                                    <button class="badge bg-danger">Unapprove</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

    </div>

    <%@ include file="../../template/script-tags__admin.jsp" %>
</body>
</html>
