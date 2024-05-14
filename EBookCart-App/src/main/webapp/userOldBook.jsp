<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.impl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Books</title>

<%@include file="allComponent/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="allComponent/navbar.jsp"%>

	<c:if test="${not empty sucessMsg}">
		<div class="alert alert-success text-center">${sucessMsg}</div>
		<c:remove var="sucessMsg" scope="session" />
	</c:if>
	
	<c:if test="${not empty errorMsg}">
		<div class="alert alert-danger text-center">${errorMsg}</div>
		<c:remove var="errorMsg" scope="session" />
	</c:if>

	<div class="container-fluid">
		<h3 class="text-center mt-4">Your Old Books</h3>

		<table class="table table-striped mt-4">
			<thead class="bg-dark text-white">
				<tr style="text-align: center;">
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();

				BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());
				List<BookDetails> list = dao.getOldBookByUser(email, "Old");

				for (BookDetails b : list) {
				%>

				<tr style="text-align: center;">
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a
						href="oldBookDelete?email=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"> Delete </a></td>
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