<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/14/18
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Chi tiết hình ảnh sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb--child__admin.jsp">
                <jsp:param name="parentURL" value="${pageContext.request.contextPath}/admin/image/"/>
                <jsp:param name="parentTitle" value="hình ảnh sản phẩm"/>
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/image/detail"/>
                <jsp:param name="pageTitle" value="Chi tiết hình ảnh sản phẩm"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Chi tiết hình ảnh</h4>
                        </div>
                        <div class="panel-body">
                            <form method="post">
                                <div class="form-group">
                                    <label>Mã</label>
                                    <input type="text" class="form-control" value="1" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Ảnh hiện tại</label>
                                    <img src="/img/faucet-1.jpeg" alt="" style="width: 400px; height: auto;">
                                </div>
                                <div class="form-group">
                                    <label>Sản phẩm</label>
                                    <input type="text" class="form-control" value="Bàn Cầu American Standard 2040" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Đường dẫn</label>
                                    <input type="text" class="form-control" value="faucet-1.jpeg" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Ảnh chính</label>
                                    <input type="text" class="form-control" value="true" readonly>
                                </div>
                                <div class="form-group">
                                    <a href="${pageContext.request.contextPath}/admin/image" class="btn btn-default">Quay lại</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->

<jsp:include page="../../template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value=""/>
</jsp:include>
</body>
</html>
