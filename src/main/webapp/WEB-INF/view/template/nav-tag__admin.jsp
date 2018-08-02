<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">THE SANI</a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">

        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
            <ul class="dropdown-menu alert-dropdown">
                <li>
                    <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">View All</a>
                </li>
            </ul>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>
                <%--Chào <sec:authentication property="principal.username"/>--%>
                <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <a href="#"><i class="fa fa-fw fa-user"></i> Tài khoản</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-fw fa-gear"></i> Cài đặt</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout"><i class="fa fa-fw fa-power-off"></i> Thoát</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li>
                <a href="${pageContext.request.contextPath}/admin/"><i class="fa fa-fw fa-dashboard"></i> Tổng quan</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/category/"><i class="fa fa-fw fa-folder-open"></i> Quản lý nhóm sản phẩm</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/product/"><i class="fa fa-fw fa-shower"></i> Quản lý sản phẩm</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/order/"><i class="fa fa-shopping-cart"></i> Quản lý đơn hàng</a>
            </li>
            <sec:authorize access="hasAuthority('Boss')">
            <li>
                <a href="${pageContext.request.contextPath}/supervisor/deal/"><i class="fa fa-handshake-o"></i> Yêu cầu thương lượng</a>
            </li>
            </sec:authorize>
            <li>
                <a href="${pageContext.request.contextPath}/admin/account/"><i class="fa fa-fw fa-users"></i> Quản lý tài khoản</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/image/"><i class="fa fa-fw fa-picture-o"></i> Hình ảnh sản phẩm</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/article/"><i class="fa fa-fw fa-file-text-o"></i> Quản lý bài viết</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-fw fa-line-chart"></i> Báo cáo</a>
            </li>

        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>