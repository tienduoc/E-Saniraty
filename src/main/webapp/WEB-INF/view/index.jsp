<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: buunguyenlam
  Date: 6/15/2018
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../resources/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../resources/dist/css/myStyle.css">
    <title>The Sani</title>

</head>

<body>

<%--TODO dữ liệu cho Navbar--%>
<c:forEach var="rootCat" items="${parentCats}">
       <b>${rootCat.name}</b><br>
    <c:forEach var="catLevel1" items="${childCats}">
        <c:if test="${catLevel1.parentId == rootCat.id}">
            <i style="padding-left: 20px">${catLevel1.name}</i><br>
            <c:forEach var="catLevel2" items="${cats}">
                <c:if test="${catLevel2.parentId == catLevel1.id}">
                    <i style="padding-left: 50px">${catLevel2.name}</i><br>
                </c:if>
            </c:forEach>
        </c:if>
    </c:forEach>
</c:forEach>

<!-- NAVBAR -->
<nav id="navigation-bar" class="navbar navbar-default navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mobileDropdown" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">THE SANI</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="mobileDropdown">
            <ul class="nav navbar-nav">
                <!-- Thiết bị vệ sinh -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Thiết bị vệ sinh
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu mega-menu">
                        <div class="row">
                            <div class="col-md-4">
                                <h4>Bàn cầu</h4>
                                <ul class="unstyled">
                                    <li>
                                        <a href="#">Bàn cầu cảm ứng</a>
                                    </li>
                                    <li>
                                        <a href="#">Bàn cầu két âm tường</a>
                                    </li>
                                    <li>
                                        <a href="#">Bàn cầu hai khối
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Bàn cầu một khối
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Bàn cầu xổm
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Nắp bàn cầu</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h4>Bồn tiểu</h4>
                                <ul class="unstyled">
                                    <li>
                                        <a href="#">Bồn tiểu nam</a>
                                    </li>
                                    <li>
                                        <a href="#">Bồn tiểu nữ</a>
                                    </li>
                                    <li>
                                        <a href="#">Bồn tiểu cảm ứng</a>
                                    </li>
                                    <li>
                                        <a href="#">Van tiểu</a>
                                    </li>
                                    <li>
                                        <a href="#">Phụ kiện</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h4>Bồn tắm</h4>
                                <ul class="unstyled">
                                    <li>
                                        <a href="#">Bồn tắm massage</a>
                                    </li>
                                    <li>
                                        <a href="#">Bồn tắm vách kính</a>
                                    </li>
                                    <li>
                                        <a href="#">Bồn tắm yếm
                                            <i></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Bồn tắm thường
                                            <i></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <h4>Chậu lavabo</h4>
                                <ul class="unstyled">
                                    <li>
                                        <a href="#">Chậu đặt bàn</a>
                                    </li>
                                    <li>
                                        <a href="#">Chậu âm bàn</a>
                                    </li>
                                    <li>
                                        <a href="#">Chậu dương vành</a>
                                    </li>
                                    <li>
                                        <a href="#">Chậu tủ</a>
                                    </li>
                                    <li>
                                        <a href="#">Chậu treo tường</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h4>Vòi sen tắm</h4>
                                <ul class="unstyled">
                                    <li>
                                        <a href="#">Vòi sen cây</a>
                                    </li>
                                    <li>
                                        <a href="#">Vòi sen nhiệt độ</a>
                                    </li>
                                    <li>
                                        <a href="#">Vòi sen nóng lạnh</a>
                                    </li>
                                    <li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h4>Gương soi và phụ kiện</h4>
                                <ul class="unstyled">
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
                                        <a href="#">Phụ kiện vệ sinh chung</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </ul>
                </li>
                <!-- Bình nóng lạnh -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Bình nóng lạnh
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu mega-menu">
                        <div class="row">
                            <div class="col-md-4">
                                <h4>Bình nóng lạnh gián tiếp</h4>
                                <ul class="unstyled">
                                    <li>
                                        <a href="#">Aristoon</a>
                                    </li>
                                    <li>
                                        <a href="#">Ferroli</a>
                                    </li>
                                    <li>
                                        <a href="#">Funiki
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Inax
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Picenza
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Rossi</a>
                                    </li>
                                    <li>
                                        <a href="#">Kangaroo</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h4>Bình nóng lạnh trực tiếp</h4>
                                <ul class="unstyled">
                                    <li>
                                        <a href="#">Aristoon</a>
                                    </li>
                                    <li>
                                        <a href="#">Ferroli</a>
                                    </li>
                                    <li>
                                        <a href="#">Joven
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Inax
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h4>Bình năng lượng mặt trời</h4>
                                <ul class="unstyled">
                                    <li>
                                        <a href="#">Hướng dương</a>
                                    </li>
                                    <li>
                                        <a href="#">Thái dương năng</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </ul>
                </li>
                <!-- Gạch vữa -->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gạch ốp lát & Vữa ốp lát
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">Gạch mosaic</a>
                        </li>
                        <li>
                            <a href="#">Gạch men eurotile</a>
                        </li>
                        <li>
                            <a href="#">Gạch men taicera</a>
                        </li>
                        <li>
                            <a href="#">Gạch men white horse</a>
                        </li>
                        <li>
                            <a href="#">Gạch đồng tâm</a>
                        </li>
                        <li>
                            <a href="#">Gạch thạch bàn</a>
                        </li>
                        <li>
                            <a href="#">Vữa ốp lát cho gạch và đá</a>
                        </li>
                    </ul>
                </li>
                <!-- Nhà sản xuất -->
                <li class="dropdown" id="manufacturer">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Thương hiệu
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu mega-menu">
                        <div class="row">
                            <div class="col-md-3">
                                <ul class="unstyled">
                                    <li>
                                        <a><img src="../resources/img/manufactures/kohler.png"  alt="kohler" class="img-thumbnail"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </ul>
                </li>
            </ul>
            <!-- Login and logout icons -->
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="" data-toggle="modal" data-target="#myModalRegister">
                        <span class="glyphicon glyphicon-user"></span>Chào, USERNAME</a>
                </li>
                <li>
                    <a href="login.html" s>
                        <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- CAROUSEL -->
<div id="carousel-slider" class="container-fluid">
    <div class="carousel slide" id="mySlider" data-ride="carousel">
        <!-- Slide indicators -->
        <ol class="carousel-indicators">
            <li data-target="#mySlider" data-slide-to="0" class="active"></li>
            <li data-target="#mySlider" data-slide-to="1"></li>
            <li data-target="#mySlider" data-slide-to="2"></li>
        </ol>

        <!-- Images for slide -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="../resources/img/slideshows/carousel-slide-1.jpg" alt="carousel-slide-1">
            </div>
            <div class="item">
                <img src="../resources/img/slideshows/carousel-slide-2.jpg" alt="carousel-slide-2">
            </div>
            <div class="item">
                <img src="../resources/img/slideshows/carousel-slide-3.jpg" alt="carousel-slide-3">
            </div>
        </div>

        <!-- Prev & Next Icons -->
        <a href="#mySlider" data-slide="prev" class="left carousel-control">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a href="#mySlider" data-slide="next" class="right carousel-control">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div>

<!-- PANEL -->
<div id="panel-features" class="container" style="padding-top: 50px;">
    <div class="row">
        <!-- A feature -->
        <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h4>
                        <span class="glyphicon glyphicon-pawn"></span> FEATURE TITLE</h4>
                    <p>FEATURE CONTENT</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%--PRODUCT--%>
    <div class="main-product">
        <c:forEach var="cat" items="${cats}">
            <c:if test="${cat.showOnIndex == true}">
            <div class="container">
                <!-- Introducing of products categogies -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="centered-title">
                            <h2 class="text-uppercase">${cat.name}
                                <span class="heading-border"></span>
                            </h2>
                            <div class="clear"></div>
                            <em>PRODUCT GROUP DESCRIPTION
                            </em>
                        </div>
                    </div>
                </div>

                <!-- Products -->
                <%--<div class="row">--%>
                    <%--<c:forEach var="pro" items="${cat.productsById}">--%>
                    <%--<!-- Product item -->--%>
                        <%--<div class="col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">--%>
                            <%--<div class="thumbnail text-center">--%>
                                <%--<img src="http://rtlarge.ie/wp-content/uploads/2016/10/maria-toilet-510x600.jpg" alt="Bồn cầu nguyên khối">--%>
                                <%--<div class="caption">--%>
                                    <%--<h4 class="text-uppercase ellipsis"> ${pro.name}</h4>--%>
                                    <%--<p class="text-justify">PRODUCT SHORT DESCRIPTION</p>--%>
                                    <%--<p class="text-success">--%>
                                        <%--<strong><fmt:formatNumber type="number" maxFractionDigits="5" value="${pro.salePrice}"/></strong>--%>
                                        <%--<del class="text-danger">OLD PRICE</del>--%>
                                    <%--</p>--%>
                                    <%--<a href="details.html" class="label label-primary text-right">Xem chi tiết...</a>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</c:forEach>--%>
                <%--</div>--%>
            </div>
            </c:if>
        </c:forEach>
    </div>

<!-- FOOTER -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-sm-2">
                <h6>Copyright &copy; 2018 {THE SANI}</h6>
            </div>
            <div class="col-sm-4">
                <h6>About us</h6>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when
                    looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution
                    of letters, as opposed to using 'Content here, content here', making it look like readable English.
                    Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model
                    text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various
                    versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour
                    and the like).</p>
            </div>

            <div class="col-sm-2">
                <h6>Navigation</h6>
                <ul class="unstyled">
                    <li>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li>
                        <a href="#">Dịch vụ</a>
                    </li>
                    <li>
                        <a href="#">Liên kết</a>
                    </li>
                    <li>
                        <a href="#">Liên hệ</a>
                    </li>
                </ul>
            </div>

            <div class="col-sm-2">
                <h6>Follow us</h6>
                <ul class="unstyled">
                    <li>
                        <a href="#">Facebook</a>
                    </li>
                    <li>
                        <a href="#">Google Plus</a>
                    </li>
                    <li>
                        <a href="#">Twitter</a>
                    </li>
                    <li>
                        <a href="#">Instagram</a>
                    </li>
                </ul>
            </div>
            <div class="col-sm-2">
                <h6>Coded with
                    <span class="glyphicon glyphicon-heart"></span> by BROTHERS</h6>
            </div>
        </div>
    </div>
</footer>
<script src="../resources/vendor/jquery/jquery.min.js"></script>
<script src="../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../resources/dist/js/myScript.js"></script>
</body>

</html>
