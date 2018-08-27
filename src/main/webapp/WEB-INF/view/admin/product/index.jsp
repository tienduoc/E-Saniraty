<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/12/2018
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý sản phẩm"/>
</jsp:include>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>

    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb__admin.jsp">
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/product/"/>
                <jsp:param name="pageTitle" value="sản phẩm"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách sản phẩm</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/product/create" class="btn btn-primary">Thêm</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Mã SP</th>
                                <th class="text-center">Tên sản phẩm</th>
                                <th class="text-center">Thuộc nhóm</th>
                                <th class="text-center">Hãng sản xuất</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-center">Giá bán</th>
                                <th class="text-center">Tình trạng</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="p" items="${allProduct}">
                                <tr>
                                    <td class="text-left">${p.id}</td>
                                    <td class="text-left">${p.name}</td>
                                    <td class="text-left">${p.categoryByCategoryId.name}</td>
                                    <td class="text-left">${p.manufacturerByManufacturerId.name}</td>
                                    <td class="text-right">${p.unitInStock}</td>
                                    <td class="text-right" id="price"><fmt:formatNumber value="${p.salePrice}"/></td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${p.enabled}">
                                            <i class="fa fa-check" style="color: green" data-toggle="tooltip" title="Đang còn hàng"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="fa fa-close" style="color: red" data-toggle="tooltip" title="Hết hàng"></i>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <c:url value="" var="product_id">
                                            <c:param name="id" value="${p.id}" />
                                        </c:url>
                                        <a href="${pageContext.request.contextPath}/admin/product/update${product_id}" class="btn btn-warning btn-xs" data-toggle="tooltip" title="Cập nhật thông tin"><i class="fa fa-pencil"></i></a>
                                        <a href="${pageContext.request.contextPath}/admin/product/detail${product_id}" class="btn btn-success btn-xs" data-toggle="tooltip" title="Xem chi tiết"><i class="fa fa-eye"></i></a>

                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<jsp:include page="../../template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value="
    columnDefs: [
            { width: '200px', targets: 1 },
         { width: '150px', targets: 2 },
         { width: '50px', targets: 3 },
         { width: '80px', targets: 5 }
         ],
         fixedColumns: true,

    "/>
</jsp:include>

</body>
</html>