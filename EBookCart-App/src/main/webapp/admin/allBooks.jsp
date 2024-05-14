<%@page import="java.text.NumberFormat.Style"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DbConnect"%>
<%@page import="com.dao.impl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Books</title>
<%@include file="adminAllCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="adminNavbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<%
	String sucessMsg = (String) session.getAttribute("sucessMsg");
	String errorMsg = (String) session.getAttribute("errorMsg");
	%>

	<h3 class="text-center mt-4">Hello Admin</h3>


	<%
	if (sucessMsg != null) {
	%>
	<h5 class="text-success text-center"><%=sucessMsg%></h5>
	<%
	session.removeAttribute("sucessMsg");
	}

	if (errorMsg != null) {
	%>
	<h5 class="text-danger text-center"><%=errorMsg%></h5>
	<%
	session.removeAttribute("errorMsg");
	}
	%>
	<div class="container-fluid">

		<table class="table table-striped mt-4">
			<thead class="bg-dark text-white">
				<tr style="text-align: center;">
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">AuthorName</th>
					<th scope="col">Price</th>
					<th scope="col">Book Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());
				List<BookDetails> list = dao.getAllBooks();

				for (BookDetails b : list) {
				%>

				<tr style="text-align: center;">
					<td><%=b.getBookId()%></td>
					<td><img src="../books/<%=b.getPhoto()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="editBooks.jsp?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-primary"><i
							class="fa-solid fa-pen-to-square fa-xl"></i> </a> <a
						href="../deleteBook?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"><i
							class="fa-solid fa-trash-can fa-xl"></i> </a></td>
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