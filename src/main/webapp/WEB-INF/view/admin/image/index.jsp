<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/14/18
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý hình ảnh sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/image/"/>
                <jsp:param name="pageTitle" value="hình ảnh sản phẩm"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách ảnh sản phẩm</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/image/upload" class="btn btn-primary">Thêm ảnh</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Mã</th>
                                <th class="text-center">Hình ảnh</th>
                                <th class="text-center">Mã sản phẩm</th>
                                <th class="text-center">Tập tin</th>
                                <th class="text-center">Là ảnh chính</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="img" items="${images}">
                                <tr>
                                    <td>${img.id}</td>
                                    <td>
                                        <img src="${pageContext.request.contextPath}/assets/img/products/${img.url}" alt="${img.url}" style="width: 10rem; height:auto;">
                                    </td>
                                    <td>${img.productId}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/assets/img/products/${img.url}">${img.url}</a>
                                    </td>
                                    <td class="text-center">
                                        <c:if test="${img.mainPhoto}">
                                            <i class="fa fa-check" style="color: green"></i>
                                        </c:if>
                                    </td>
                                    <td class="text-right">
                                        <c:if test="${!img.mainPhoto}">
                                            <a href="${pageContext.request.contextPath}/admin/image/setMainPhoto?img_url=${img.url}&product_id=${img.productId}" class="btn btn-primary btn-xs" data-toggle="tooltip" title="Đặt làm ảnh chính"><i class="fa fa-home"></i></a>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/admin/image/update?img_url=${img.url}" class="btn btn-warning btn-xs" data-toggle="tooltip" title="Thay đổi ảnh"><i class="fa fa-pencil"></i></a>
                                        <a href="${pageContext.request.contextPath}/admin/image/delete?img_url${img.url}" class="btn btn-danger btn-xs" data-toggle="tooltip" title="Xoá ảnh"><i class="fa fa-trash"></i></a>
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

<jsp:include page="../../template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value="
    columnDefs: [
            { width: '50px', targets: 0 },
            { width: '100px', targets: 2 },
         { width: '30px', targets: 4 },
         { width: '80px', targets: 5 }

         ],
         fixedColumns: true,

    "/>
</jsp:include>
</body>
</html>
