<%@page import="com.entity.User"%>
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
<title>Bookly:Home</title>

<!---------- font awesome cdn link --------->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!----- swipper cdn link -------->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />


<%@include file="allComponent/allCss.jsp"%>

<style type="text/css">
.back-img {
	background: url("image/bgg4.jpg");
	height: 60vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background: #d6d6d6;
}
</style>

</head>
<body style="background-color: #f7f7f7">


<%
	User u = (User) session.getAttribute("userobj");
%>


	<%@include file="allComponent/navbar.jsp"%>

	<div class="container-fluid back-img">
		<!-- <h2 class="text-center text-ddark">
			<br> E-book management system
		</h2> -->
	</div>




	<!-- starts Recent-Books section -->

	<div class="container">
		<br>
		<h3 class="text-center">Recent Books</h3>
		<br>
		<div class="row">

			<%
				BookDaoImpl dao1 = new BookDaoImpl(DbConnect.getConnection());
				List<BookDetails> list1 = dao1.getRecentBook();

				for (BookDetails b1 : list1) {
			%>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b1.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b1.getBookName()%></p>
						<p><%=b1.getAuthor()%></p>
						<p>
							<%
							if (b1.getBookCategory().equals("old") || b1.getBookCategory().equals("Old")) 
							{
							%>
							Category : <%=b1.getBookCategory()%>
						<div class="row">
							<a href="viewBook.jsp?bid=<%=b1.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a>
							<a href=" " class="btn btn-danger btn-sm ml-1"> 
								<i class="fa-solid fa-indian-rupee-sign"></i> <%=b1.getPrice()%></a>
						</div>

						<%
						} else 
						{
						%>

						Category : <%=b1.getBookCategory()%>

						</p>
						<div class="row">
						
						<%
						
						if(u == null){
							
						%>
						
						<a href="login.jsp" class="btn btn-danger btn-sm ml-4"><i class="fa-solid fa-cart-shopping"></i></a>
						
						<% }else { %>
						
						<a href="cartServlet?bid=<%=b1.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-4"><i class="fa-solid fa-cart-shopping"></i></a>
						
						<% } %>

							<a href="viewBook.jsp?bid=<%=b1.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href=" " class="btn btn-danger btn-sm ml-1">
								<i class="fa-solid fa-indian-rupee-sign"></i> <%=b1.getPrice()%></a>
						</div>

						<%
						}
						%>

					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>
		<br>
		<div class="text-center mt-1">
			<a href="allRecentBook.jsp" class="btn btn-success btn-sm">View All</a>
		</div>
	</div>

	<!-- end of Recent-Books section -->
	
	<br>
	<hr>







	<!-- starts new-books section -->

	<div class="container">
		<br>
		<h3 class="text-center">New Books</h3>
		<br>
		<div class="row">

			<%
				BookDaoImpl dao2 = new BookDaoImpl(DbConnect.getConnection());
				List<BookDetails> list2 = dao2.getNewBook();

				for (BookDetails b2 : list2) {
			%>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b2.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b2.getBookName()%></p>
						<p><%=b2.getAuthor()%></p>
						<p> Category :<%=b2.getBookCategory()%></p>
						<div class="row">
						
						<%
						
						if(u == null){
							
						%>
						
						<a href="login.jsp" class="btn btn-danger btn-sm ml-4"><i class="fa-solid fa-cart-shopping"></i></a>
						
						<% }else { %>
						
						<a href="cartServlet?bid=<%=b2.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-4"><i class="fa-solid fa-cart-shopping"></i></a>
						
						<% } %>
			
							<a href="viewBook.jsp?bid=<%=b2.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a> 
							<a href=" " class="btn btn-danger btn-sm ml-1">
								<i class="fa-solid fa-indian-rupee-sign"></i> <%=b2.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>



		</div>

		<br>
		<div class="text-center mt-1">
			<a href="allNewBook.jsp" class="btn btn-success btn-sm">View All</a>
		</div>
	</div>

	<!-- end of New-Books section -->
	
	<br>
	<hr>









	<!-- starts Old-Books section -->

	<div class="container">
		<br>
		<h3 class="text-center">Old Books</h3>
		<br>
		<div class="row">
			
			<%
				BookDaoImpl dao3 = new BookDaoImpl(DbConnect.getConnection());
				List<BookDetails> list3 = dao3.getOldBook();

				for (BookDetails b3 : list3) {
			%>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b3.getPhoto()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b3.getBookName()%></p>
						<p><%=b3.getAuthor()%></p>
						<p> Category :<%=b3.getBookCategory()%></p>
						<div class="row">
							<a href="viewBook.jsp?bid=<%=b3.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a> 
							<a href=" " class="btn btn-danger btn-sm ml-1">
								<i class="fa-solid fa-indian-rupee-sign"></i> <%=b3.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

		<br>
		<div class="text-center mt-1">
			<a href="allOldBook.jsp" class="btn btn-success btn-sm">View All</a>
		</div>
	</div>
	<br>

	<!-- end of Old-Books section -->




	<!-- footer section start -->

	<hr>

	<%@include file="allComponent/footer.jsp"%>

	<!-- footer section end -->

	<br>
</body>
</html>


