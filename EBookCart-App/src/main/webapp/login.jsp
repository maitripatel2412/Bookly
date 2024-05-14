<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookly:LoginPage</title>

<%@include file="allComponent/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container p-4 ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<form action="login" method="post">
							<h3 class="text-center">Login</h3>
							<hr>
							
							<c:if test="${not empty failedmsg}">
								<p class="text-center text-danger">${failedmsg}</p>
								<c:remove var="failedmsg" scope="session" />
							</c:if>

							<c:if test="${not empty succMsg}">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<div class="form-group" style="margin-top: 10px">
								<label for="exampleInputEmail1">Email / Mobile No</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp"
									placeholder="Enter your email or mobile no" required="required"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="enter your password" required="required"
									name="password">
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input" id="check"
									name="check"> <label class="form-check-label"
									for="check">Remember Me</label>
							</div>

							<button type="submit" class="btn btn-primary btn-block btn-sm">Login</button>

							<br>

							<p>
								Forgot Password ? <a href=""> Click here</a>
							</p>
							<p>
								Don't have an account ? <a href="register.jsp"> Create one</a>
							</p>

						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

	<hr>

	<%@include file="allComponent/footer.jsp"%>

	<br>

</body>
</html>