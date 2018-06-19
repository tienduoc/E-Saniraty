<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>

<title>Login Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

</head>

<body>

	<div>

		<div class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2 mx-auto pt-5">

			<div class="panel panel-info">

				<div class="panel-heading">
					<div class="panel-title display-4">Sign In</div>
				</div>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Login Form -->
					<form:form
						action="${pageContext.request.contextPath}/authenticateUser"
						method="POST" class="form-horizontal">

						<!-- Place for messages: error, alert etc ... -->
						<div class="form-group">
							<div class="col-xs-15">
								<div>

									<c:if test="${param.error != null}">
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Invalid username and password.
										</div>
									</c:if>

									<c:if test="${param.logout != null }">
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.
										</div>
									</c:if>

								</div>
							</div>
						</div>

						<!-- User name -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								name="username" placeholder="username" class="form-control">
						</div>

						<!-- Password -->
						<div style="margin-bottom: 25px" class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="password"
								name="password" placeholder="password" class="form-control">
						</div>

						<!-- Login/Submit Button -->
						<div style="margin-top: 10px" class="form-group">
							<div class="float-right">
								<button type="submit" class="btn btn-outline-primary">Login</button>
							</div>
						</div>
					</form:form>

				</div>

			</div>

			<div>
				<a href="${pageContext.request.contextPath}/register" class="btn btn-outline-primary" role="button" aria-pressed="true">Register New User</a>
			</div>
			
		</div>

	</div>

</body>
</html>