<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.impl.CartDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>

<%@include file="allComponent/allCss.jsp"%>

</head>

<body style="background-color: #f7f7f7">

	<%@include file="allComponent/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


	<div class="container">
		<div class="row p-4">

			<div class="col-md-6 text-center p-5 border bg-white">


				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								CartDaoImpl dao = new CartDaoImpl(DbConnect.getConnection());
								List<Cart> cart = dao.getBookByUser(u.getId());

								Double totalPrice = 0.00;

								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="deletebookfromcart?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid() %>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details For Order</h3>
						<hr>
						<form action="order" method="post">
						
						<input type="hidden" value="${userobj.id}" name="id"> 
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="form-label">Name </label> <input
										type="text" class="form-control" id="inputEmail4"
										value="${userobj.name}" name="name" required>
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Email </label> <input
										type="email " class="form-control" id="inputPassword4"
										value="${userobj.email}" name="email" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="form-label">Mobile No </label>
									<input type="number" class="form-control" id="inputEmail4"
										value="${userobj.phoneNo}" name="phoneNo" required>
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Address
									</label> <input type="text" class="form-control" id="inputPassword4" name="address" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="form-label">Landmark</label> <input
										type="text" class="form-control" id="inputEmail4" name="landmark" required>
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">City</label> <input
										type="text" class="form-control" id="inputPassword4" name="city" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4" class="form-label">State</label> <input
										type="text" class="form-control" id="inputEmail4" name="state" required>
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Pincode</label>
									<input type="number" class="form-control" id="inputPassword4" name="pincode" required>
								</div>
							</div>

							<div class="form-group">
								<label> Payment Type </label> <select class="form-control" name="payment">
									<option value="noselect">---Select---</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">

								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping </a>

							</div>

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