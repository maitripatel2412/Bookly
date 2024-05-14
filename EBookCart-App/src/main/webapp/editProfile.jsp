<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<%@include file="allComponent/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="allComponent/navbar.jsp"%>


	<div class="container-fluid mt-4">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<form action="profileupdate" method="post">
							<h4 class="text-center text-primary">Edit Profile</h4>
							<hr>

							<c:if test="${not empty succMsg}">
								<p class="text-center text-success">${succMsg}</p>
								<c:remove var="succMsg" scope="session" />
							</c:if>

							<c:if test="${not empty failedMsg}">
								<p class="text-center text-danger">${failedMsg}</p>
								<c:remove var="failedMsg" scope="session" />
							</c:if>
							
							<input type="hidden" value="${userobj.id}" name="id">

							<div class="form-group">
								<label for="name">Enter Full Name</label> <input type="text"
									class="form-control" id="name" placeholder="enter your full name"
									required="required" name="name" value="${userobj.name}">
							</div>

							<div class="form-group">
								<label for="number">Mobile No</label> <input type="number"
									class="form-control" id="number"
									placeholder="Enter your mobile no" required="required"
									name="mobileno" value="${userobj.phoneNo}">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter your email"
									required="required" name="email" value="${userobj.email}">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="enter your password" required="required"
									name="password">
							</div>
							
							<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>

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