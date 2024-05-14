<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>

<%@include file="adminAllCss.jsp"%>

<style type="text/css">
a {
	text-decoration: none;
	color: white;
}

a:hover {
	text-decoration: none;
	color: black;
	background: #d6d6d6;
}
</style>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="adminNavbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">

				<a href="addBook.jsp">

					<div class="card text-white bg-primary ">
						<div class="card-body text-center">

							<i class="fa-solid fa-square-plus fa-3x"></i><br>
							<h4>Add Books</h4>
							---------------

						</div>
					</div>

				</a>

			</div>

			<div class="col-md-3">

				<a href="allBooks.jsp">

					<div class="card text-white bg-info">
						<div class="card-body text-center">

							<i class="fa-solid fa-book-open fa-3x"></i><br>
							<h4>All Books</h4>
							---------------

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">

				<a href="orders.jsp">

					<div class="card text-white bg-success">
						<div class="card-body text-center">

							<i class="fa-solid fa-gift fa-3x"></i><br>
							<h4>Order</h4>
							---------------

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">

				<a data-toggle="modal" data-target="#staticBackdrop">

					<div class="card text-white bg-danger">
						<div class="card-body text-center">

							<i class="fa-solid fa-right-from-bracket fa-3x"></i><br>
							<h4>Logout</h4>
							---------------

						</div>
					</div>
				</a>
			</div>

		</div>
	</div>

	<!-- logout model -->

	<div class="modal fade" id="staticBackdrop" data-backdrop="static"
		data-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="text-center">

						<h4>Do you want to Logout ?</h4>

						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../delete" type="button" class="btn btn-primary">Logout</a>

					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<!-- end of logout model -->

	<!-- footer section start -->


	<div style="margin-top: 190px">
		<hr>
		<%@include file="adminFooter.jsp"%><br>
	</div>

	<!-- footer section end -->


</body>
</html>