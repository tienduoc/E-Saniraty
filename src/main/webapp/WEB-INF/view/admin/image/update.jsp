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
    <jsp:param name="title" value="Cập nhật hình ảnh sản phẩm"/>
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
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/image/update"/>
                <jsp:param name="pageTitle" value="Cập nhật hình ảnh"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Cập nhật hình ảnh</h4>
                        </div>
                        <div class="panel-body">
                            <form method="post">

                                <div class="form-group">
                                    <label>Ảnh hiện tại</label> <br>
                                    <img src="${pageContext.request.contextPath}/assets/img/products/${image.url}" alt="" style="max-width: 200px; height: auto;">
                                </div>
                                <div class="form-group">
                                    <label>Sản phẩm</label>
                                    <input type="text" class="form-control" value="${image.productByProductId.id}" readonly>
                                </div>
                                <div class="form-group">
                                    <label>Hình ảnh</label>
                                    <div class="input-group">
                                            <span class="input-group-btn">
                                                <span class="btn btn-default btn-file">
                                                    Chọn...
                                                    <input type="file" id="imgInp" required>
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
