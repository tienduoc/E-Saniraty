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
<html>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Thêm ảnh sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Trang quản lý hình ảnh
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-archive"></i> Hình ảnh
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Thêm hình ảnh
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Thêm hình ảnh</h4>
                        </div>
                        <div class="panel-body">
                            <form:form action="${pageContext.request.contextPath}/admin/image/upload" modelAttribute="proImage" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label>Sản phẩm</label>
                                    <select name="productId" style="display:block; width: 100%; height: 4rem;">
                                    <c:forEach var="p" items="${products}">
                                        <option value="${p.id}">${p.name}</option>
                                    </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Hình ảnh</label>
                                    <div class="input-group">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default btn-file">
                                                    Chọn...
                                                    <input type="file" name="file" accept="image/gif, image/jpeg, image/png" id="imgInp" required/>
                                                </span>
                                            </span>
                                        <input type="text" class="form-control" readonly>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <img id='img-upload' />
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" value="Lưu">
                                    <a href="${pageContext.request.contextPath}/admin/image" class="btn btn-default">Quay lại</a>
                                </div>
                                ${result}
                            </form:form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- Datatables JavaScript -->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>

    <script>
    $(document).ready(function () {
        $(document).on('change', '.btn-file :file', function () {
            var input = $(this),
                label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
            input.trigger('fileselect', [label]);
        });

        $('.btn-file :file').on('fileselect', function (event, label) {

            var input = $(this).parents('.input-group').find(':text'),
                log = label;

            if (input.length) {
                input.val(log);
            } else {
                if (log) alert(log);
            }

        });
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#img-upload').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#imgInp").change(function () {
            readURL(this);
        });
    });
</script>



</body>

</html>