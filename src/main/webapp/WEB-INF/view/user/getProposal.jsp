<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/13/18
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Đề xuất mua hàng"/>
</jsp:include>

<body>
<%@ include file="../template/header-tag__user.jsp" %>

<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Đề xuất mua hàng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Đề xuất mua hàng</a>
                </li>
            </ol>
        </div>
    </section>

    ${noSolution}

    <%--Input--%>
    <section class="section-product">
        <div class="container">
            <div class="row">

                <form action="/getProposal/result" method="get" id="getProposal">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="product-sorting">
                            <div class="col-md-10 col-sm-10 col-xs-12">
                                <div class="row">
                                    <form>
                                        <div class="col-md-10 col-sm-6 col-xs-12">
                                            <div class="custom-control custom-checkbox">
                                                <c:forEach var="cat" items="${menu}">
                                                    <c:if test="${cat.parentId != null}">
                                                        <input type="checkbox" name="cat" value="${cat.id}"> <label for="">${cat.name}</label>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                            <input type="number" name="maxCost" id="">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <input type="submit" onclick="document.getElementById('getProposal').submit();" class="btn btn-primary btn-block">Xin đề xuất</input>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <%--Output--%>
    <section class="section-product">
        <div class="container">

            <!-- Products -->
            <c:set var="numOfSol" value="1"/>
            <c:forEach var="sol" items="${solutionList}">
                <!-- Introducing of products categogies -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading-secondary">
                            <h2 class="heading-secondary--title">Gợi ý số: #${numOfSol} | Giá: <fmt:formatNumber value="${sol.getEvaluatedValue()}" pattern="###,###"/>
                                <span class="heading-secondary--line"></span>
                            </h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="p" items="${sol.getValues()}">
                        <!-- Product item -->
                        <div class="col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                            <div class="product">
                                <div class="product__thumbnail">
                                    <c:forEach var="img" items="${p.getValue().productImagesById}">
                                        <c:choose>
                                            <c:when test="${img.productId.equals(p.getValue().getId()) && img.mainPhoto == true}">
                                                <img src="${pageContext.request.contextPath}/assets/img/products/${img.url}"
                                                     alt="">
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <div class="quick-add">
                                        <div class="quick-add__wrap">
                                            <ul class="quick-add__list">
                                                <li>
                                                    <a id="add" href="${pageContext.request.contextPath}/cart/add?id=${p.getValue().getId()}" title="Add to cart">
                                                        <i class="fa fa-shopping-basket"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="product__info">
                                    <h2 class="product__info--title u-ellipsis">
                                        <a target="_blank" href="${pageContext.request.contextPath}/product/detail?id=${p.getValue().getId()}">${p.getValue().getName()}</a>
                                    </h2>
                                    <span class="product__info--price">
                                <fmt:formatNumber value="${p.getValue().getSalePrice()}" pattern="###,###"/>
                            </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <c:set var="numOfSol" value="${numOfSol+1}"/>
            </c:forEach>

        </div>
    </section>
</main>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script>
    var limit = 3;
    $('input[type=checkbox]').on('change', function (evt) {
        if ($(this).siblings(':checked').length >= limit) {
            this.checked = false;
        }
    });
</script>

</body>
</html>