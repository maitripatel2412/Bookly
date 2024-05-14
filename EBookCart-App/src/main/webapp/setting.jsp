<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting</title>

<%@include file="allComponent/allCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: white;
}

a:hover {
	text-decoration: none;
	color: black;
	background: white;
}
</style>

</head>

<body style="background-color: #f7f7f7">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container p-4">
	
	<h3 class="text-center">Hello ! ${userobj.name}</h3>
		
		<div class="row p-4">
			<div class="col-md-4">
				<a href="sellBook.jsp">
					<div class="card alert alert-info">
						<div class="card-body text-center">
							<div class="text-info">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4 class="p-2">Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="userOldBook.jsp">
					<div class="card alert alert-secondary">
						<div class="card-body text-center">
							<div class="text-secondary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4 class="p-2">Your Old Books</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 ">
				<a href="userOrder.jsp">
					<div class="card alert alert-danger">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-gifts fa-3x"></i>
							</div>
							<h4 class="p-2">My Order</h4>
							<!-- <p>Track Your Order</p> -->
						</div>
					</div>
				</a>
			</div>
			

			<div class="col-md-6 mt-4">
				<a href="editProfile.jsp">
					<div class="card alert alert-warning">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-user-lock fa-3x"></i>
							</div>
							<h4 class="p-2">Edit Profile </h4>
							<p> (Login & Security)</p>
							
						</div>
					</div>
				</a>
			</div>

			<!-- <div class="col-md-4 mt-4">
				<a href="userAddress.jsp">
					<div class="card alert alert-warning">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-map-location-dot fa-3x"></i>
							</div>
							<h4 class="p-2">Your Address</h4>
							<p>Edit Address</p>
						</div>
					</div>
				</a>
			</div> -->

			

			<div class="col-md-6 mt-4">
				<a href="helpline.jsp">
					<div class="card alert alert-success">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fa-solid fa-circle-user fa-3x"></i>
							</div>
							<h4 class="p-2">Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>



		</div>
	</div>


	<hr>

	<%@include file="allComponent/footer.jsp"%>

	<br>

</body>
</html>