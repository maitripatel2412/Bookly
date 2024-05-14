<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address / Edit Address</title>

<%@include file="allComponent/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="allComponent/navbar.jsp"%>


	<div class="container">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-primary">Add Address</h3>
						<hr>
						<form action="">

							<div class="form-row">

								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Address
									</label> <input type="text" class="form-control" id="inputPassword4">
								</div>

								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Landmark
									</label> <input type="text" class="form-control" id="inputPassword4">
								</div>

							</div>

							<div class="form-row">

								<div class="col-md-4">
									<label for="inputPassword4" class="form-label">City</label> <input
										type="text" class="form-control" id="inputPassword4">
								</div>
								<div class="col-md-4">
									<label for="inputEmail4" class="form-label">State</label> <input
										type="text" class="form-control" id="inputEmail4">
								</div>
								<div class="col-md-4">
									<label for="inputPassword4" class="form-label">pincode</label>
									<input type="number" class="form-control" id="inputPassword4">
								</div>
							</div>
							<br>

							<button type="submit"
								class="btn btn-warning btn-block btn-sm text-white">Update
								Address</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div style="margin-top: 40px">
		<hr>
		<%@include file="allComponent/footer.jsp"%><br>
	</div>

</body>
</html>