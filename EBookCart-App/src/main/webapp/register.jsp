<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookly:RegistrationPage</title>

<%@include file="allComponent/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<form action="register" method="post">
							<h3 class="text-center">Sign Up</h3>
							<hr>
							
							<c:if test="${not empty succMsg}">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty failedMsg}">
								<p class="text-center text-danger">${failedMsg}</p>
								<c:remove var="failedMsg" scope="session" />
							</c:if>

							<div class="form-group">
								<label for="name">Name</label> <input type="text"
									class="form-control" id="name" placeholder="enter your name"
									required="required" name="name">
							</div>

							<div class="form-group">
								<label for="number">Mobile No</label> <input type="number"
									class="form-control" id="number"
									placeholder="Enter your mobile no" required="required"
									name="mobileno">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter your email"
									required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="enter your password" required="required"
									name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree
									Terms & Conditions</label>
							</div>
							<br>
							<button type="submit" class="btn btn-primary btn-block btn-sm">Sign up</button>

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