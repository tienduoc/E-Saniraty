<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/14/18
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Cập nhật bài viết"/>
</jsp:include>

<body>

<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb--child__admin.jsp">
                <jsp:param name="parentURL" value="${pageContext.request.contextPath}/admin/article/"/>
                <jsp:param name="parentTitle" value="bài viết"/>
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/article/update"/>
                <jsp:param name="pageTitle" value="Cập nhật bài viết"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Cập nhật nội dung bài viết</h4>
                        </div>
                        <div class="panel-body">
                            <form method="post">
                                <input type="hidden" name="id" value="ID">

                                <div class="form-group">
                                    <label>Mã</label>
                                    <input type="text" class="form-control" value="Mã" required="required" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Tiêu đề</label>
                                    <input type="text" class="form-control" value="Tiêu đề" required="required">
                                </div>
                                <div class="form-group">
                                    <label>Ngày viết</label>
                                    <input type="date" class="form-control" value="Ngày viết" required="required">
                                </div>
                                <div class="form-group">
                                    <label>Đường dẫn</label>
                                    <input type="text" class="form-control" value="URL" required="required">
                                </div>

                                <div class="form-group">
                                    <label>Nhà sản xuất</label>
                                    <select name="" style="display:block">
                                        <option name="" value="">Thiết bị vệ sinh</option>
                                        <option name="" value="">Bình nước nóng lạnh</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Lưu lại">
                                    <a href="${pageContext.request.contextPath}/admin/article" class="btn btn-default">Quay lại</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</body>

</html>

