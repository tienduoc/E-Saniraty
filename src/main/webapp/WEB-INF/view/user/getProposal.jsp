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


    <%--Input--%>
    <section class="section-product">
        <div class="container">
            <form action="/getProposal/result" method="post" id="form-getProposal">
                <form>
                <div class="row">


                        <c:forEach begin="1" end="5">
                            <div class="col-md-8">
                                <label>Chọn mặt hàng</label>
                            <select name="cat" required style="display:block">
                                <option value="0">None</option>
                                <c:forEach var="cat" items="${menu}">
                                    <c:if test="${cat.parentId != null && cat.id != 29 && cat.id != 34 && cat.id != 40 && cat.id != 44 && cat.id != 49 && cat.id != 61}">
                                        <option value="${cat.id}">${cat.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            </div>
                            <div class="col-md-4">
                                <label>Số lượng</label>
                            <input type="number" name="quantity" class="col-md-6" value="0" min="0" max="100"></div>
                        </c:forEach>


                </div>
                <div class="row form-group u-padTB-small">
                    <div class="col-md-2 col-md-offset-8">
                        <label>Nhập số tiền: </label>
                        <input type="number" name="maxCost" id="js-input-price" min="1" max="999999999" class="text-right">
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-12">
                        <label>&nbsp;</label>
                        <button type="button" class="btn btn--dark btn-group-justified col-xs-12"
                                id="btn-getProposal">Nhận đề xuất
                        </button>
                    </div>
                </div>
                </form>
            </form>
        </div>
    </section>

    <div class="row">
        <div class="col-md-12">
            <div class="heading-primary">
                <h2 class="heading-primary--title"> ${noSolution}</h2>
            </div>
        </div>
    </div>

    <%--Output--%>
    <section class="section-product">
        <div class="container">
            Kết quả gợi ý với số tiền tối đa:
            <strong>
                <fmt:formatNumber value="${maxCost}" pattern="###,###"/>
            </strong>
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-bordered table-responsive">
                        <thead>
                        <tr>
                            <th style="width: 80%" class="text-center">Tên mặt hàng</th>
                            <th class="text-center">Số lượng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="catQty" items="${catQty}">
                            <tr>
                                <td style="width: 80%">${catQty.getKey()}</td>
                                <td class="text-center">${catQty.getValue()}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

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
                                                    <a target="_blank" id="add" href="${pageContext.request.contextPath}/cart/add?id=${p.getValue().getId()}" title="Thêm vào giỏ">
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
<%@ include file="../template/footer-tag__user.jsp" %>
<script>
    // var limit = 5;
    // $('input[type=checkbox]').on('change', function (evt) {
    //     if ($(this).siblings(':checked').length >= limit) {
    //         this.checked = false;
    //     }
    // });

    //
    // function isChecked() {
    //     if ((!$("input[type=checkbox]").is(":checked"))) {
    //         alert("Chọn tối đa 5 danh mục");
    //         return false;
    //     }
    //     return true;
    // }

    function isValidNumber() {
        let input = document.getElementById('js-input-price');

        if (input.value < 1000000 || input.value == '' || input.value > 1000000000) {
            alert("Số tiền tối thiểu: 1 triệu đồng, tối đa: 1 tỷ đồng");
            return false;
        }
        return true;
    };

    $('#btn-getProposal').on('click', function () {
        if(isValidNumber()) {
        document.getElementById('form-getProposal').submit();
        }
    });
</script>

</body>
</html>