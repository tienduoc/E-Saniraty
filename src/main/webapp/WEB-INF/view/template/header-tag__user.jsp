<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/11/2018
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header class="header">
    <div id="top-bar" class="header__top-bar hidden-xs">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 header__logo-box">
                    <a class="header__logo" href="${pageContext.request.contextPath}/">
                        THE SANI
                    </a>
                </div>
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <div class="header__search-box">
                        <form:form action="/search" method="get" class="form">
                            <div class="form__group">
                                <input type="text" name="keyword" class="form__input" placeholder="Tìm kiếm" id="search">
                            </div>
                            <button type="submit" class="form__submit">
                                <i class="fa fa-paper-plane"></i>
                            </button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="main-menu" class="header__main-menu main_header_area animated">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-md-9 col-sm-12">
                    <nav id="navigation1" class="navigation">
                        <div class="navbar-brand hidden-lg hidden-md hidden-sm u-text-color-primary-light text-uppercase">
                            <a href="${pageContext.request.contextPath}">The Sani</a>
                        </div>
                        <div class="navigation-toggle"></div>
                        <!-- Main Menus Wrapper -->
                        <div class="nav-menus-wrapper">
                            <ul class="nav-menu">
                                <c:forEach var="cat0" items="${menu}">
                                    <c:if test="${cat0.parentId == null}">
                                        <li>
                                            <%--<a href="${pageContext.request.contextPath}/category?id=${cat0.id}">${cat0.name}</a>--%>
                                            <a>${cat0.name}</a>
                                            <ul class="nav-dropdown">
                                                <c:forEach var="cat1" items="${menu}">
                                                    <c:if test="${cat1.parentId == cat0.id}">
                                                        <li>
                                                            <%--<a href="${pageContext.request.contextPath}/category?id=${cat1.id}">${cat1.name}</a>--%>
                                                            <a>${cat1.name}</a>
                                                            <ul class="nav-dropdown">
                                                                <c:forEach var="cat2" items="${menu}">
                                                                    <c:if test="${cat2.parentId == cat1.id}">
                                                                        <li>
                                                                            <a href="${pageContext.request.contextPath}/category?id=${cat2.id}">${cat2.name}</a>
                                                                        </li>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </ul>
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                    </nav>
                </div>

                <hr class="line">

                <div class="col-lg-2 col-md-3 col-sm-12">
                    <ul class="e-commerces">

                        <li class="e-commerces__user">
                            <span class="fa fa-user"></span>
                            <div class="popup" id="popup-user">
                                <a href="" class="popup__close-button">
                                    <i class="fa fa-close"></i>
                                </a>
                                <ul class="popup__list">
                                    <c:choose>
                                        <c:when test="${pageContext.request.userPrincipal.authenticated}">
                                            <li class="popup__item clearfix u-ellipsis">
                                                <a href="">Chào <sec:authentication property="principal.username"/></a>
                                            </li>
                                            <sec:authorize access="hasAnyAuthority('Customer','Contractor')">
                                                <li class="popup__item clearfix u-ellipsis">
                                                    <a href="${pageContext.request.contextPath}/order">Quản lý đơn hàng</a>
                                                </li>
                                            </sec:authorize>
                                            <sec:authorize access="hasAuthority('Contractor')">
                                                <li class="popup__item clearfix u-ellipsis">
                                                    <a href="${pageContext.request.contextPath}/deal">Quản lý thương lượng</a>
                                                </li>
                                            </sec:authorize>
                                            <sec:authorize access="hasAnyAuthority('Admin','Boss')">
                                                <li class="popup__item clearfix u-ellipsis">
                                                    <a href="${pageContext.request.contextPath}/admin">Trang quản
                                                        trị</a>
                                                </li>
                                            </sec:authorize>
                                            <li class="popup__item clearfix u-ellipsis">
                                                <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="popup__item clearfix u-ellipsis">
                                                <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                                            </li>
                                            <li class="popup__item clearfix u-ellipsis">
                                                <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </li>

                        <li class="e-commerces__cart">
                            <a>
                                <span class="fa fa-shopping-cart"></span>
                            </a>

                            <div class="popup cart" id="popup-cart">
                                <a href="" class="popup__close-button">
                                    <i class="fa fa-close"></i>
                                </a>
                                <ul class="popup__list">
                                    <c:set var="sum" value="0"></c:set>
                                    <c:forEach var="item" items="${sessionScope.cart}">
                                        <c:set var="sum" value="${sum + item.product.salePrice * item.quantity }"></c:set>
                                        <li class="popup__item clearfix u-ellipsis">
                                            <img src="/assets/img/faucet-1.jpeg" alt="faucet-1" class="cart__image">
                                            <a href="#" class="cart__title u-ellipsis">${item.product.name}</a>
                                            <span class="cart__price">
                                            <fmt:formatNumber type="number" pattern="###,###" value="${item.product.salePrice}"/>
                                        </span>
                                            <span>x ${item.quantity}</span>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <div class="cart__footer">
                                    <span class="pull-left">Tổng cộng</span>
                                    <span class="pull-right">
                                        <fmt:formatNumber type="number" pattern="###,###" value="${sum}"/>
                                    </span>
                                </div>
                                <a href="${pageContext.request.contextPath}/cart" class="btn btn--dark btn-group-justified">Xem giỏ
                                    hàng
                                    <span style="float: right;">&rarr;</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- /.navbar-collapse -->
    </div>
</header>