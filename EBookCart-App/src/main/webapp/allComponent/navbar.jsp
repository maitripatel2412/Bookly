<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success" >
			<h3><i class="fas fa-book"> Bookly</i></h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		
		<c:if test="${not empty userobj}">
		
		<div class="col-md-3">
			<a href="checkout.jsp" class="btn btn-success"><i class="fas fa-shopping-cart"></i></a>
			<a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-user"></i> ${userobj.name }</a>
			<a href="delete" class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
		</div>
		
		</c:if>
		
		<c:if test="${empty userobj}">
		
		 <div class="col-md-3">
			<a href="login.jsp" class="btn btn-success">Login</a>
			<a href="register.jsp" class="btn btn-primary">Sign Up</a>
		</div>
		
		</c:if>
		
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i class="fa-solid fa-house"></i> Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="allRecentBook.jsp">Recent-Books</a></li>
			<li class="nav-item active"><a class="nav-link" href="allNewBook.jsp">New-Books</a></li>
			<li class="nav-item active"><a class="nav-link" href="allOldBook.jsp">Old-Books</a></li>
		</ul>
		
		<form class="form-inline my-2 my-lg-0">
				<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit">Setting</a>
				<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">Contact Us</button>
			</form>
		
	</div>
</nav>

