<%@page import="java.util.List"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="com.dao.impl.BookOrderDaoImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.DbConnect"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>

<%@include file="allComponent/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container-fluid">
		<h3 class="text-center mt-4">Your Order History</h3>

		<table class="table table-striped mt-4">
			<thead class="bg-dark text-white">
				<tr style="text-align: center;">
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");

				BookOrderDaoImpl dao = new BookOrderDaoImpl(DbConnect.getConnection());

				List<BookOrder> list = dao.getBook(u.getEmail());

				for (BookOrder b : list) {
				%>

				<tr style="text-align: center;">
					<th scope="row"><%= b.getOrderId() %></th>
					<td><%= b.getUserName() %></td>
					<td><%= b.getBookName() %></td>
					<td><%= b.getAuthorName() %></td>
					<td><i class="fa-solid fa-indian-rupee-sign"></i><%= b.getPrice() %></td>
					<td><%= b.getPaymentType() %></td>
				</tr>

				<%
				}
				%>


			</tbody>
		</table>
	</div>

	<div style="margin-top: 250px">
		<hr>
		<%@include file="allComponent/footer.jsp"%><br>
	</div>

</body>
</html>