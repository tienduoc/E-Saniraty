<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/11/2018
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="rootUrl" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}" />
<header class="header">
    <div id="top-bar" class="header__top-bar hidden-xs">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-4 header__logo-box">
                    <a class="header__logo" href="${rootUrl}">
                        THE SANI
                    </a>
                </div>
                <div class="col-md-8 col-sm-8 col-xs-12">
                    <div class="header__search-box">
                        <form action="#" class="form">
                            <div class="form__group">
                                <input type="text" class="form__input" placeholder="Tìm kiếm" id="search">
                            </div>
                            <button type="submit" class="form__submit">
                                <i class="fa fa-paper-plane"></i>
                            </button>
                        </form>
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
                                <li>
                                    <a href="#">Thiết bị vệ sinh</a>
                                    <ul class="nav-dropdown">

                                        <li>
                                            <a href="#">Bồn tắm</a>
                                            <ul class="nav-dropdown">


                                                <li>
                                                    <a href="#">Bồn tắm massage</a>
                                                </li>
                                                <li>
                                                    <a href="#">Bồn tắm vách kính</a>
                                                </li>
                                                <li>
                                                    <a href="#">Bồn tắm yếm</a>
                                                </li>
                                                <li>
                                                    <a href="#">Bồn tắm thường</a>
                                                </li>

                                            </ul>
                                        </li>

                                        <li>
                                            <a href="#">Bồn cầu</a>
                                            <ul class="nav-dropdown">


                                                <li>
                                                    <a href="#">Bồn cầu cảm ứng</a>
                                                </li>
                                                <li>
                                                    <a href="#">Bồn cầu một khối</a>
                                                </li>
                                                <li>
                                                    <a href="#">Bồn cầu hai khối</a>
                                                </li>
                                                <li>
                                                    <a href="#">Bồn cầu âm tường</a>
                                                </li>
                                                <li>
                                                    <a href="#">Bồn cầu xổm</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a href="#">Chậu rửa mặt</a>
                                            <ul class="nav-dropdown">
                                                <li>
                                                    <a href="#">Chậu đặt bàn</a>
                                                </li>
                                                <li>
                                                    <a href="#">Chậu liền bàn</a>
                                                </li>
                                                <li>
                                                    <a href="#">Chậu treo tường</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a href="#">Vòi sen</a>
                                            <ul class="nav-dropdown">
                                                <li>
                                                    <a href="#">Vòi sen cây</a>
                                                </li>
                                                <li>
                                                    <a href="#">Vòi sen nóng lạnh</a>
                                                </li>
                                                <li>
                                                    <a href="#">Vòi sen áp suất</a>
                                                </li>
                                                <li>
                                                    <a href="#">Vòi sen massage</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li>
                                            <a href="#">Vòi chậu</a>
                                            <ul class="nav-dropdown">
                                                <li>
                                                    <a href="#">Vòi chậu cảm ứng</a>
                                                </li>
                                                <li>
                                                    <a href="#">Vòi chậu nóng lạnh</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#">Bình nước nóng lạnh</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="#">Bình trực tiếp</a>
                                        </li>
                                        <li>
                                            <a href="#">Bình gián tiếp</a>
                                        </li>
                                        <li>
                                            <a href="#">Bình năng lượng mặt trời</a>
                                        </li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#">Gạch vữa</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="#">Gạch Mosaic</a>
                                        </li>

                                        <li>
                                            <a href="#">Gạch men Eurotile</a>
                                        </li>
                                        <li>
                                            <a href="#">Gạch Đồng Tâm</a>
                                        </li>
                                        <li>
                                            <a href="#">Gạch thạch bàn</a>
                                        </li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="#">Phụ kiện & Gương soi</a>
                                    <ul class="nav-dropdown">
                                        <li>
                                            <a href="#">Đèn sưởi phòng tắm</a>
                                        </li>

                                        <li>
                                            <a href="#">Máy sấy tay</a>
                                        </li>
                                        <li>
                                            <a href="#">Gương soi</a>
                                        </li>
                                        <li>
                                            <a href="#">Phụ kiện phòng tắm</a>
                                        </li>
                                        <li>
                                            <a href="#">Phụ kiện vệ sinh</a>
                                        </li>
                                    </ul>
                                </li>
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
                                <a href="#login.html" class="popup__close-button">
                                    <i class="fa fa-close"></i>
                                </a>
                                <ul class="popup__list">
                                    <li class="popup__item clearfix">
                                        <a href="login.html">Đăng nhập</a>
                                    </li>
                                    <li class="popup__item clearfix">
                                        <a href="login.html">Đăng xuất</a>
                                    </li>
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
                                    <li class="popup__item clearfix">
                                        <img src="/assets/img/faucet-1.jpeg" alt="faucet-1" class="cart__image">
                                        <a href="#" class="cart__title">Tên sản phẩm...</a>
                                        <span class="cart__price">800.000d</span>
                                        <span>x 01</span>
                                    </li>
                                </ul>
                                <div class="cart__footer">
                                    <span class="pull-left">Tổng cộng</span>
                                    <span class="pull-right"> 240000d </span>
                                </div>
                                <a href="${rootUrl}/cart" class="button button--black">Xem giỏ hàng
                                    <span style="float: right;">&rarr;</span>
                                </a>
                                <!-- <button type="submit" class="btn button--black col-xs-12">thanh toán <span style="float: right;">&rarr;</span></button> -->
                            </div>
                        </li>

                    </ul>
                </div>
            </div>

        </div>
        <!-- /.navbar-collapse -->
    </div>

</header>
