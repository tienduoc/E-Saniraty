<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/28/18
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý combo"/>
</jsp:include>
<body>
<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Trang quản lý combo
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li>
                            <i class="fa fa-archive"></i> Combo
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Tạo Combo
                        </li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-md-offset-0">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Thêm combo</h4>
                        </div>
                        <div class="panel-body">
                            <form method="post" id="frm-example">
                                <input type="hidden" name="id" value="ID">

                                <div class="form-group row">
                                    <div class="col-md-2">
                                        <label>Mã combo</label>
                                        <input type="text" class="form-control" name="productID" value="CB1234" readonly>
                                    </div>
                                    <div class="col-md-7">
                                        <label>Tên combo</label>
                                        <input type="text" class="form-control" value="Combo siêu khủng mừng 8/3" required="required">
                                    </div>

                                    <div class="col-md-3">
                                        <label>Giá combo</label>
                                        <input type="text" class="form-control" value="3000000" required="required">
                                    </div>
                                </div>
                                <hr>
                                <!-- TABLE -->
                                <div class=" form-group row">
                                    <div class="col-md-12">
                                        <label>Chọn sản phẩm thêm vào combo</label>
                                        <table id="example" class="table table-hover table-striped">
                                            <thead>
                                            <tr>
                                                <th>
                                                    <input name="select_all" value="1" id="example-select-all" type="checkbox" />
                                                </th>
                                                <th class="text-center">Mã SP</th>
                                                <th class="text-center">Tên sản phẩm</th>
                                                <th class="text-center">Loại</th>
                                                <th class="text-center">Đơn giá</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td></td>
                                                <td>AT6207</td>
                                                <td>Bồn tắm massage</td>
                                                <td>Bồn tắm</td>
                                                <td class="text-right">2000000</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>BC6208</td>
                                                <td>Bồn cầu hai khối</td>
                                                <td>Bồn cầu</td>
                                                <td class="text-right">1300000</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>LV6210</td>
                                                <td>Lavabo đứng</td>
                                                <td>Chậu lavabo</td>
                                                <td class="text-right">800000</td>
                                            </tr>
                                            </tbody>

                                        </table>
                                        <hr>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-primary">Lưu</button>
                                        <a href="${pageContext.request.contextPath}/admin/combo/" class="btn btn-default">Quay lại</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->


<!-- jQuery -->
<script src="/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/js/bootstrap.min.js"></script>

<!-- Datatables JavaScript -->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/plug-ins/1.10.19/sorting/currency.js"></script>

<script>

    $(document).ready(function () {
        var table = $('#example').DataTable({
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_ mục",
                "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix": "",
                "sSearch": "Tìm:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sPrevious": "Trước",
                    "sNext": "Tiếp",
                    "sLast": "Cuối"
                }
            },
            'columnDefs': [{
                'targets': 0,
                'searchable': false,
                'orderable': false,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta) {
                    return '<input type="checkbox" name="id[]" value="'
                        + $('<div/>').text(data).html() + '">';
                }
            },
                {
                    "targets": 4,
                    render: $.fn.dataTable.render.number(',', '.')
                }],
            'order': [1, 'asc']
        });

        // Handle click on "Select all" control
        $('#example-select-all').on('click', function () {
            // Check/uncheck all checkboxes in the table
            var rows = table.rows({ 'search': 'applied' }).nodes();
            $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });

        // Handle click on checkbox to set state of "Select all" control
        $('#example tbody').on('change', 'input[type="checkbox"]', function () {
            // If checkbox is not checked
            if (!this.checked) {
                var el = $('#example-select-all').get(0);
                // If "Select all" control is checked and has 'indeterminate' property
                if (el && el.checked && ('indeterminate' in el)) {
                    // Set visual state of "Select all" control
                    // as 'indeterminate'
                    el.indeterminate = true;
                }
            }
        });

        $('#frm-example').on('submit', function (e) {
            var form = this;

            // Iterate over all checkboxes in the table
            table.$('input[type="checkbox"]').each(function () {
                // If checkbox doesn't exist in DOM
                if (!$.contains(document, this)) {
                    // If checkbox is checked
                    if (this.checked) {
                        // Create a hidden element
                        $(form).append(
                            $('<input>')
                                .attr('type', 'hidden')
                                .attr('name', this.name)
                                .val(this.value)
                        );
                    }
                }
            });

            // Prevent actual form submission
            e.preventDefault();
        });
    });
</script>
</body>
</html>
