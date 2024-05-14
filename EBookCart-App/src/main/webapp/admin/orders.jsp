<%@page import="com.dao.impl.BookOrderDaoImpl"%>
<%@page import="com.db.DbConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookOrder"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Orders</title>
<%@include file="adminAllCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="adminNavbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center mt-4">Hello Admin</h3>

	<div class="container-fluid">
		<table class="table table-striped mt-4">
			<thead class="bg-dark text-white">
				<tr style="text-align: center;">
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
				BookOrderDaoImpl dao = new BookOrderDaoImpl(DbConnect.getConnection());

				List<BookOrder> list = dao.getAllOrder();

				for (BookOrder b : list) {
				%>

				<tr style="text-align: center;">
					<th scope="row"><%= b.getOrderId() %></th>
					<td><%= b.getUserName() %></td>
					<td><%= b.getEmail() %></td>
					<td><%= b.getAddress() %></td>
					<td><%= b.getPhoneNo() %></td>
					<td><%= b.getBookName() %></td>
					<td><%= b.getAuthorName() %></td>
					<td><%= b.getPrice() %></td>
					<td><%= b.getPaymentType() %></td>
				</tr>


				<%
				}
				%>




			</tbody>
		</table>
	</div>
	<!-- footer section start -->


	<div style="margin-top: 190px">
		<hr>
		<%@include file="adminFooter.jsp"%><br>
	</div>

	<!-- footer section end -->

</body>
</html>