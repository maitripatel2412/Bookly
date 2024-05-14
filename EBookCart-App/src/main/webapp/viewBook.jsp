<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.impl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Details</title>

<%@include file="allComponent/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="allComponent/navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());
	BookDetails b = dao.getBookById(bid);
	%>

	<div class="container p-5">

		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">

				<img src="books/<%=b.getPhoto()%>"
					style="height: 200px; width: 160px;"><br>
				<h4 class="mt-3">
					Book Name :
					<%=b.getBookName()%></h4>
				<h4>
					Author :
					<%=b.getAuthor()%></h4>
				<h4>
					Category :
					<%=b.getBookCategory()%></h4>

			</div>

			<div class="col-md-6 text-center p-5 border bg-white ">

				<h2>
					<%=b.getBookName()%></h2>

				<%
				if ("old".equals(b.getBookCategory()) || "Old".equals(b.getBookCategory())) {
				%>

				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email :
					<%=b.getUserEmail()%></h5>

				<%
				}
				%>

				<br>
				<div class="row mt-2">

					<div class="col-md-4 text-success text-center p-2">
						<i class="fa-solid fa-money-bill-1-wave fa-3x"></i>
						<p>Cash On Delivery (COD)</p>
					</div>

					<div class="col-md-4 text-success text-center p-2">
						<i class="fa-solid fa-rotate-left fa-3x"></i>
						<p>Return Available</p>
					</div>

					<div class="col-md-4 text-success text-center p-2">
						<i class="fa-solid fa-truck fa-3x"></i>
						<p>Free Delivery</p>
					</div>

				</div>

				<%
				if ("old".equals(b.getBookCategory()) || "Old".equals(b.getBookCategory())) {
				%>

				<div class="text-center p-3">

					<a href="index.jsp" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Continue Shopping</a> <a href=" "
						class="btn btn-danger"> <i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>

				</div>

				<%
				} else {
				%>

				<div class="text-center p-3">


					<%
					if (u == null) {
					%>
					<a href="login.jsp" class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Add To Cart</a>
					<%
					} else {
					%>

					<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
						class="btn btn-primary"><i
						class="fa-solid fa-cart-plus"></i> Add To Cart</a>

					<%
					}
					%>


					 <a href=" "
						class="btn btn-danger"> <i
						class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>

				</div>

				<%
				}
				%>

			</div>

		</div>
	</div>

</body>
</html>