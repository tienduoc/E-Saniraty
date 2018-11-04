<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang thương lượng"/>
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
                        Quản lý thương lượng
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Thương lượng
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="example">
                        <thead>
                        <tr>
                            <th class="text-center">Mã</th>
                            <th class="text-center">Mã hoá đơn</th>
                            <th class="text-center">Khách hàng</th>
                            <th class="text-center">Ngày yêu cầu</th>
                            <th class="text-center">Ngày phản hồi</th>
                            <th class="text-right">Giá đơn hàng</th>
                            <th class="text-right">Giá nhà thầu</th>
                            <th class="text-center">Trạng thái</th>
                            <th class="text-center">Tuỳ chọn</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="deal" items="${deals}">
                            <c:if test="${(deal.contructorApprove == true && (deal.bossApprove == false || deal.bossApprove == null)) || (deal.contructorApprove == false && deal.bossApprove == true)}">
                                <tr>
                                    <td>
                                        ${deal.id}
                                    </td>
                                    <td href="${pageContext.request.contextPath}/">${deal.orderId}</td>
                                    <td class="text-left">
                                        <a href="${pageContext.request.contextPath}/admin/account/detail?username=${deal.orderByOrderId.username}">
                                                ${deal.orderByOrderId.accountByUsername.fullname}
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${deal.requestDate}" pattern="dd/MM/yyyy"/>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${deal.responseDate}" pattern="dd/MM/yyyy"/>
                                    </td>
                                    <td class="text-right">
                                        <fmt:formatNumber value="${deal.orderByOrderId.totalPrice}"/>
                                    </td>
                                    <td class="text-right">
                                        <c:set var="sum" value="0"/>
                                        <c:set var="i" value="0"/>
                                        <c:forEach var="cp" items="${deal.dealHistoryDetailsById}">
                                            <c:if test="${cp.dealHistoryId.equals(deal.id)}">
                                                <c:set var="sum" value="${sum + cp.contractorPrice * deal.orderByOrderId.orderDetailsById[i].quantity}"/>
                                                <c:set var="i" value="${i+1}"/>
                                            </c:if>
                                        </c:forEach>
                                        <fmt:formatNumber value="${sum}" type="number"/>
                                    </td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${deal.contructorApprove == true && (deal.bossApprove == false || deal.bossApprove == null)}">
                                                <i class="fa fa-exchange" style="color: darkorange" data-toggle="tooltip" title="Đang thương lượng"></i>
                                            </c:when>
                                            <c:when test="${deal.contructorApprove == false && deal.bossApprove == true}">
                                                <i class="fa fa-hourglass" style="color: darkorange" data-toggle="tooltip" title="Chờ phản hồi"></i>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td class="text-right">
                                        <c:if test="${deal.contructorApprove == true && (deal.bossApprove == false || deal.bossApprove == null)}">
                                        <a href="${pageContext.request.contextPath}/supervisor/deal/update?dealHistoryId=${deal.id}" class="btn btn-warning btn-xs" data-toggle="tooltip"
                                           title="Điều chỉnh giá mới"><i class="fa fa-pencil"></i></a>
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/supervisor/deal/acceptDeal?orderId=${deal.orderId}&dealHistoryId=${deal.id}" class="btn btn-success btn-xs" data-toggle="tooltip"
                                           title="Đồng ý với giá nhà thầu đưa ra"><i class="fa fa-check"></i></a>
                                        <a href="${pageContext.request.contextPath}/supervisor/deal/cancelDeal?dealHistoryId=${deal.id}&orderId=${deal.orderId}&message=${mesage}" class="btn btn-danger btn-xs" data-toggle="tooltip"
                                           title="Không thương lượng nữa"><i class="fa fa-ban"></i></a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="example2">
                        <thead>
                        <tr>
                            <th class="text-center">Mã</th>
                            <th class="text-center">Mã hoá đơn</th>
                            <th class="text-center">Khách hàng</th>
                            <th class="text-center">Ngày yêu cầu</th>
                            <th class="text-center">Ngày phản hồi</th>
                            <th class="text-right">Giá đơn hàng</th>
                            <th class="text-right">Giá nhà thầu</th>
                            <th class="text-center">Trạng thái</th>
                            <%--<th class="text-center">Tuỳ chọn</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="deal" items="${deals}">
                            <c:if test="${(deal.contructorApprove == true && deal.bossApprove == true) || (deal.contructorApprove == false && deal.bossApprove == false)}">
                                <tr>
                                    <td>${deal.id}</td>
                                    <td href="${pageContext.request.contextPath}/">${deal.orderId}</td>
                                    <td class="text-left">
                                        <a href="${pageContext.request.contextPath}/admin/account/detail?username=${deal.orderByOrderId.username}">
                                                ${deal.orderByOrderId.accountByUsername.fullname}
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${deal.requestDate}" pattern="dd/MM/yyyy HH:mm"/>
                                    </td>
                                    <td class="text-center">
                                        <fmt:formatDate value="${deal.responseDate}" pattern="dd/MM/yyyy HH:mm"/>
                                    </td>
                                    <td class="text-right">
                                        <fmt:formatNumber value="${deal.orderByOrderId.totalPrice}"/>
                                    </td>
                                    <td class="text-right">
                                        <c:set var="sum" value="0"/>
                                        <c:forEach var="cp" items="${deal.dealHistoryDetailsById}">
                                            <c:if test="${cp.dealHistoryId.equals(deal.id)}">
                                                <c:set var="sum" value="${sum + cp.contractorPrice}"/>
                                            </c:if>
                                        </c:forEach>
                                        <fmt:formatNumber value="${sum}" type="number"/>
                                    </td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${deal.contructorApprove == true && deal.bossApprove == true}">
                                                <i class="fa fa-check" style="color: green" data-toggle="tooltip" title="Thương lượng thành công"></i>
                                            </c:when>
                                            <c:when test="${deal.contructorApprove == false && deal.bossApprove == false}">
                                                <i class="fa fa-close" style="color: red" data-toggle="tooltip" title="Đã huỷ thương lượng"></i>
                                            </c:when>
                                        </c:choose>
                                    </td>

                                    <%--<td class="text-center">--%>
                                        <%--<a href="" class="btn btn-xs btn-info" data-toggle="tooltip"--%>
                                           <%--title="Xem chi tiết thương lượng"><i class="fa fa-eye"></i></a>--%>
                                    <%--</td>--%>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- /#wrapper -->
<!-- jQuery -->
<jsp:include page="../../template/script-tags__admin.jsp">
    <jsp:param name="columnDefs" value="
        order: [[ 3, 'desc' ]],
    "/>
</jsp:include>

<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip({animation: false});

        $('#example2').DataTable({
            order: [[ 3, 'desc' ]],
            language: {
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
            }
        });
    });
</script>
</body>
</html>