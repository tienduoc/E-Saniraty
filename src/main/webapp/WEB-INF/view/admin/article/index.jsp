<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/14/18
  Time: 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý bài viết"/>
</jsp:include>

<body>

<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/nav-tag__admin.jsp"/>
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <jsp:include page="${pageContext.request.contextPath}/WEB-INF/view/template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/article/"/>
                <jsp:param name="pageTitle" value="bài viết"/>
            </jsp:include>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách bài viết</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/article/create" class="btn btn-primary">Thêm</a>
                    </div>


                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Mã</th>
                                <th class="text-center">Tiêu đề</th>
                                <th class="text-center">Ngày viết</th>
                                <th class="text-center">Đường dẫn</th>
                                <th class="text-center">Nhà sản xuất</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="article" items="${articles}">
                                <tr>
                                    <td class="text-center">${article.id}</td>
                                    <td class="text-center">${article.title}</td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${article.date}" pattern="dd/MM/yyyy"/>
                                    </td>
                                    <td class="text-center"><a href="${article.aricleUrl}">${article.aricleUrl}</a></td>
                                    <td class="text-center">${article.manufacturerByManufacturerId.name}</td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/admin/article/update" class="btn btn-warning btn-xs">Sửa</a>
                                    </td>
                                </tr>
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
