<%@page import="com.entity.BookDetails"%>
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
<title>Admin:Edit Book</title>

<%@include file="adminAllCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="adminNavbar.jsp"%>

	<%-- <%
	String sucessMsg = (String) session.getAttribute("sucessMsg");
	String errorMsg = (String) session.getAttribute("errorMsg");
	%> --%>

	<div class="container-fluid" style="margin-top: 30px">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h5 class="text-primary">Edit Book</h5>
						</div>
						<hr>
						<%-- <%
						if (sucessMsg != null) {
						%>
						<p class="text-success text-center"><%=sucessMsg%></p>
						<%
						session.removeAttribute("sucessMsg");
						}

						if (errorMsg != null) {
						%>
						<p class="text-danger text-center"><%=errorMsg%></p>
						<%
						session.removeAttribute("errorMsg");
						}
						%> --%>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());
						BookDetails b = dao.getBookById(id);
						%>



						<form action="../editBook" method="post">
							
							<input type="hidden" name="id" value="<%= b.getBookId() %>"> 

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									placeholder="enter your book name" required="required"
									name="bookname" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									placeholder="Enter author name" required="required"
									name="author" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									aria-describedby="emailHelp" placeholder="Enter price"
									required="required" name="price" value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="bstatus" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
									

								</select>
							</div>

							<%-- <div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label><input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1" value="<%=b.getPhoto()%>">
							</div> --%>

							<br>
							<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>

						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- footer section start -->


	<div style="margin-top: 50px">
		<hr>
		<%@include file="adminFooter.jsp"%><br>
	</div>

	<!-- footer section end -->
</body>
</html>