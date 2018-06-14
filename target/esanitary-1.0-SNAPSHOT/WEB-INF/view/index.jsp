<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
</head>
<style>
	a:hover, a:visited, a:link, a:active
	{
		text-decoration: none;
	}
</style>
<div style="max-width: 50%; margin: 0 auto">
<body>
	<h2>MY HOME PAGE</h2>
	<!-- show username and role when user logged -->
	<p>
	<sec:authorize access="isAuthenticated()">
		User: <sec:authentication property="principal.username"/>
		<br>
		<br> 
		Role(s): <sec:authentication property="principal.authorities" var="authority"/>
		<c:forEach var="role" items="${authority}">
			${role}
		</c:forEach>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="Logout" />
		</form:form>
	</sec:authorize>
	</p>
	<hr>
	
	<!-- only view for admin -->
	<%--<sec:authorize access="hasAuthority('Admin')"></sec:authorize>--%>
	<%--<sec:authorize access="isAnonymous()"></sec:authorize>--%>

	<table style="width: 500px">
		<thead>
		<tr style="font-weight: bold">
			<td>Customer</td>
			<td>Contractor</td>
			<td>Admin</td>
			<td>Boss</td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/login">Login</a><br>
				<a href="${pageContext.request.contextPath}/register">Register</a><br>
			</td>
			<td>

			</td>
			<td>
				<a href="${pageContext.request.contextPath}/account">Account managerment</a><br>
				<a href="${pageContext.request.contextPath}/account/search">Account: search</a><br>
				<a href="${pageContext.request.contextPath}/account/create">Account: create</a><br>
				<hr>
				<a href="${pageContext.request.contextPath}/category">Category managerment</a><br>
				<a href="${pageContext.request.contextPath}/category/search">Category: search</a><br>
				<a href="${pageContext.request.contextPath}/category/create">Category: create</a><br>
			</td>
			<td>

			</td>
		</tr>
		</tbody>
	</table>
	<hr>
</div>
</body>
</html>