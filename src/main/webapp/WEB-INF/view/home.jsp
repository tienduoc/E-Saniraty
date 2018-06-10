<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>MY HOME PAGE HEHE</h2>
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
	</sec:authorize>
	</p>
	
	<hr>
	
	<!-- only view for admin -->
	<sec:authorize access="hasAuthority('Admin')">
		<a href="${pageContext.request.contextPath}/user/list">User management</a>
	</sec:authorize>
	
	<!-- show login for guest -->
	<%--<sec:authorize access="isAnonymous()">--%>
		<a href="${pageContext.request.contextPath}/login">Login</a><br>
		<a href="${pageContext.request.contextPath}/register">Register</a><br>
		<a href="${pageContext.request.contextPath}/account">List account</a><br>
		<a href="${pageContext.request.contextPath}/account/search">Search account</a><br>
	<%--</sec:authorize>--%>
	<hr>
	
	<!-- show logout when user logged -->
	<sec:authorize access="isAuthenticated()">
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
			<input type="submit" value="Logout" />
		</form:form>
	</sec:authorize>
</body>
</html>