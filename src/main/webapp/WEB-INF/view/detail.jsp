<%--
  Created by IntelliJ IDEA.
  User: buunguyenlam
  Date: 6/19/2018
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../resources/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../resources/dist/css/myStyle.css">
    <link rel="stylesheet" href="../resources/dist/css/details.css">

    <title>Details</title>

</head>

<body>
<!-- NAVBAR -->
<nav id="navigation-bar" class="navbar navbar-default navbar-inverse">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mobileDropdown" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">THE SANI</a>
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
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Thương hiệu
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu mega-menu">
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="unstyled">
                                    <li>
                                        <img src="http://logonoid.com/images/kohler-logo.png" alt="kohler" class="img-thumbnail"> kohler
                                    </li>
                                    <li>
                                        <img src="http://in2ap.com.au/wp-content/uploads/2017/02/TOTO-black-logo-small.png" alt="kohler" class="img-thumbnail"> kohler
                                    </li>
                                    <li>
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/American_Standard_logo.svg/2000px-American_Standard_logo.svg.png"
                                             alt="kohler" class="img-thumbnail"> kohler
                                    </li>
                                    <li>
                                        <img src="https://viglaceravn.com/image/cache/data/banner/logo-viglacera-600x315.png" alt="kohler" class="img-thumbnail"> kohler
                                    </li>
                                    <li>
                                        <img src="http://logonoid.com/images/kohler-logo.png" alt="kohler" class="img-thumbnail"> kohler
                                    </li>
                                    <li>
                                        <img src="http://logonoid.com/images/kohler-logo.png" alt="kohler" class="img-thumbnail"> kohler
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
                        <span class="glyphicon glyphicon-user"></span> Đăng ký</a>
                </li>
                <li>
                    <a href="" data-toggle="modal" data-target="#myModalLogin">
                        <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- BREADCRUMB -->
<div id="breadcrumb-section">
    <div class="container">
        <h2 class="text-uppercase">Product detail</h2>
        <ol class="breadcrumb">
            <li>
                <a href="#">Home</a>
            </li>
            <li class="active">
                <a href="#">Detail</a>
            </li>
        </ol>
    </div>
</div>

<!-- MAIN OF PRODUCT DETAIL -->
<section id="page-product">
    <div class="container">
        <div class="row">
            <!-- Main product's image -->
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div id="main_area">
                    <!-- Big main product -->
                    <div class="row">
                        <div class="col-xs-12" id="slider">
                            <!-- Top part of the slider -->
                            <div class="row">
                                <div class="col-xs-12" id="carousel-bounding-box">
                                    <div class="carousel slide" id="myCarousel">
                                        <!-- Carousel items -->
                                        <div class="carousel-inner">
                                            <div class="active item" data-slide-number="0">
                                                <img src="http://placehold.it/650x500&text=one">
                                            </div>

                                            <div class="item" data-slide-number="1">
                                                <img src="http://placehold.it/650x500&text=two">
                                            </div>

                                            <div class="item" data-slide-number="2">
                                                <img src="http://placehold.it/650x500&text=three">
                                            </div>
                                        </div>
                                        <!-- Carousel nav -->
                                        <a href="#myCarousel" data-slide="prev" class="left carousel-control">
                                            <span class="glyphicon glyphicon-chevron-left"></span>
                                        </a>
                                        <a href="#myCarousel" data-slide="next" class="right carousel-control">
                                            <span class="glyphicon glyphicon-chevron-right"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Thumbnail images for navigation -->
                    <div class="row hidden-sm hidden-xs" id="slider-thumbs">
                        <div class="col-xs-12">
                            <!-- Bottom switcher of slider -->
                            <ul class="unstyled" style="padding-top: 20px;">
                                <li class="col-xs-2">
                                    <a class="thumbnail" id="carousel-selector-0">
                                        <img src="http://placehold.it/170x170&text=one">
                                    </a>
                                </li>

                                <li class="col-xs-2">
                                    <a class="thumbnail" id="carousel-selector-1">
                                        <img src="http://placehold.it/170x170&text=two">
                                    </a>
                                </li>

                                <li class="col-xs-2">
                                    <a class="thumbnail" id="carousel-selector-2">
                                        <img src="http://placehold.it/170x170&text=three">
                                    </a>
                                </li>

                                <li class="col-xs-2">
                                    <a class="thumbnail" id="carousel-selector-3">
                                        <img src="http://placehold.it/170x170&text=four">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Main product's infomation -->
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <h2>Chrome finish faucet</h2>
                <p>
                    <strong>Availability:</strong>
                    <span>In stock</span>
                </p>
                <p>
                    <strong>Size:</strong>
                    <span>40x12x22</span>
                </p>
                <p>
                    <strong>Price:</strong>
                    <strong class="text-success">1.179.000đ</strong>
                    <del class="text-danger">1.536.000đ</del>
                </p>
                <p class="text-left">"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..." "There
                    is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."</p>
                <p class="text-left">"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..." "There
                    is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."</p>
                <div class="clearfix"></div>
                <!-- Quantity selection -->
                <div class="col-md-4 col-xs-12" style="padding-left: 0;">
                    <div class="form-group">
                        <label for="qty">
                            <strong>Số lượng</strong>
                        </label>
                        <input type="number" name="qty" value="1" max="50" min="1" placeholder>
                    </div>
                </div>
                <!-- Color selection -->
                <div class="col-md-8 col-xs-12" style="padding-left: 0;">
                    <div class="form-group">
                        <label for="select-color">
                            <strong>Màu sắc</strong>
                        </label>
                        <select name="select-color">
                            <option>Chọn màu sắc</option>
                            <option>Trắng</option>
                            <option>Chrome</option>
                            <option>Inox</option>
                        </select>
                    </div>
                </div>
                <!-- Else selection -->
                <!-- <div class="col-md-5 col-sm-4"></div> -->
                <button type="button" class="theme-button">Order Now</button>
            </div>
        </div>
    </div>
</section>
<!-- PRODUCT DETAIL DESCRIPTION -->
<section class="page_single">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block-caption">
                    <div class="left-title">
                        <h2>Product description
                            <span class="heading-border"></span>
                        </h2>
                        <div class="clear"></div>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ad a velit accusamus deserunt necessitatibus quae, amet facere provident fugiat. Quos officiis inventore, tenetur et maiores nobis doloribus debitis corporis optio.</p>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Animi facere aspernatur natus fugit praesentium quia obcaecati repellendus nemo quod id temporibus debitis aut quibusdam accusamus, atque dolores ipsum eius iste.</p>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus amet quae excepturi illo voluptates dolores fugiat, assumenda in soluta error, odit minima distinctio ipsam officia expedita quam, accusantium vitae iure!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- MANUFACTURE -->
<section class="page_single">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block-caption">
                    <div class="left-title">
                        <h2>About Manufaturer
                            <span class="heading-border"></span>
                        </h2>
                        <div class="clear"></div>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ad a velit accusamus deserunt necessitatibus
                            quae, amet facere provident fugiat. Quos officiis inventore, tenetur et maiores nobis doloribus debitis
                            corporis optio.</p>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Animi facere aspernatur natus fugit praesentium
                            quia obcaecati repellendus nemo quod id temporibus debitis aut quibusdam accusamus, atque dolores
                            ipsum eius iste.</p>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Possimus amet quae excepturi illo voluptates
                            dolores fugiat, assumenda in soluta error, odit minima distinctio ipsam officia expedita quam, accusantium
                            vitae iure!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- REVIEWS -->
<section class="page_single">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Review title -->
                <div class="block-caption">
                    <div class="left-title">
                        <h2>Product reviews
                            <span class="heading-border"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                </div>
                <!-- A review -->
                <div class="media">
                    <div class="media-left"><a href=""><img class="media-object" src="http://placehold.it/50x50&text=avatar" alt=""></a></div>
                    <div class="media-body">
                        <h5 class="media-heading">BUU</h5>
                        <p>sapien massa, convallis a pellentesq ue neCurabitur aliquet quam id dui posuere. sapien massa, convallis a pellentesq ue neCurabitur aliquet quam id dui posuere. massa, convallis a pellentesq ue neCurabitu</p>
                    </div>
                </div>

                <!-- List of reviews and reply reviews -->
                <ul class="media-list">
                    <li>
                        <div class="media">
                            <div class="media-left">
                                <a href="">
                                    <img class="media-object" src="http://placehold.it/50x50&text=avatar" alt="">
                                </a>
                            </div>
                            <div class="media-body">
                                <h5 class="media-heading">DUOC</h5>
                                <p>Beautiful a pellentesq ue neCurabitu</p>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="">
                                            <img class="media-object" src="http://placehold.it/50x50&text=avatar" alt="">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h5 class="media-heading">BUU</h5>
                                        <p>Fuck! convallis a pellentesq ue neCurabitur alique</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="">
                                            <img class="media-object" src="http://placehold.it/50x50&text=avatar" alt="">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h5 class="media-heading">Kiet</h5>
                                        <p>Fuck! sapien massa, convallis a pellentesq ue neCurabitur aliquet quam id dui posuere. massa, convallis
                                            a pellentesq ue neCurabitu</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="media">
                        <div class="media">
                            <div class="media-left">
                                <a href="">
                                    <img class="media-object" src="http://placehold.it/50x50&text=avatar" alt="">
                                </a>
                            </div>
                            <div class="media-body">
                                <h5 class="media-heading">SUTV</h5>
                                <p>Shut up a pellentesq ue neCurabitu</p>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="">
                                            <img class="media-object" src="http://placehold.it/50x50&text=avatar" alt="">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h5 class="media-heading">BUU</h5>
                                        <p>Fuck! convallis a pellentesq ue neCurabitur alique</p>
                                    </div>
                                </div>
                                <div class="media">
                                    <div class="media-left">
                                        <a href="">
                                            <img class="media-object" src="http://placehold.it/50x50&text=avatar" alt="">
                                        </a>
                                    </div>
                                    <div class="media-body">
                                        <h5 class="media-heading">Kiet</h5>
                                        <p>Fuck! sapien massa, convallis a pellentesq ue neCurabitur aliquet quam id dui posuere. massa, convallis
                                            a pellentesq ue neCurabitu</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>

                <div class="media">
                    <div class="media-left">
                        <a href="">
                            <img class="media-object" src="http://placehold.it/50x50&text=avatar" alt="">
                        </a>
                    </div>
                    <div class="media-body">
                        <h5 class="media-heading">EM VY</h5>
                        <p>Ai lớp du <3</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- LEAVE REVIEW -->
<section class="page_single">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="block-caption">
                    <div class="left-title">
                        <h2>Leave review
                            <span class="heading-border"></span>
                        </h2>
                        <div class="clear"></div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
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
<script src="../resources/dist/js/details.js"></script>
</body>

</html>
