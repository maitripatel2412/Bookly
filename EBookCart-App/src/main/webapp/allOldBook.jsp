<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.impl.BookDaoImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old books</title>

<%@include file="allComponent/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background: #d6d6d6;
}
</style>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container-fluid">

		<br>
		<div class="row">

			<%
			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());
			List<BookDetails> list = dao.getAllOldBook();

			for (BookDetails b : list) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="viewBook.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
							<a href=" " class="btn btn-danger btn-sm ml-1"> <i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

	</div>

	<!-- footer section start -->

	<hr>

	<%@include file="allComponent/footer.jsp"%>

	<!-- footer section end -->

	<br>

</body>
</html>