<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 8/14/18
  Time: 09:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Page Heading -->
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            <%= request.getParameter("pageTitle")%>
        </h1>
        <ol class="breadcrumb">
            <li>
                <a href="${pageContext.request.contextPath}/admin">Trang tổng quan</a>
            </li>

            <li>
                <a href="<%= request.getParameter("parentURL")%>"><%= request.getParameter("parentTitle")%></a>
            </li>
            <li class="active">
                <a href="<%= request.getParameter("pageURL")%>"><%= request.getParameter("pageTitle")%></a>
            </li>

        </ol>

    </div>
</div>
<!-- /.row -->

