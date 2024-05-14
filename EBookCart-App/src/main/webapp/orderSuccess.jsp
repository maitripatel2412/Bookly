<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="allComponent/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container text-center mt-5">
		<i class="fa-solid fa-truck-fast fa-5x text-success"></i><br><br>
		<h1>Thank You</h1>
		<h2>Your Order Placed Successfully</h2>
		<h5>Within 7 Days Your Product Will be Delivered to Your Address</h5>
		<a href="index.jsp" class="btn btn-primary mt-3"> Home </a> <a
			href="userOrder.jsp" class="btn btn-danger mt-3"> View Order</a>
	</div>


	<div style="margin-top: 90px">
		<hr>
		<%@include file="allComponent/footer.jsp"%><br>
	</div>

</body>
</html>