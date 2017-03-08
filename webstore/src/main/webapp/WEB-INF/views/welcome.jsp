<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Hello</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>${greeting}</h1>
				<p>${info}</p>
				<p class="text-right" style="padding-right: 15px">
					<a href="<spring:url value="login" />" class="btn btn-primary"
						value="login"> <span class="glyphicon-info-sign glyphicon" /></span>
						Login
					</a>
				</p>
				<p  class="text-right" style="padding-right: 15px" >
					<a href="<c:url value="/j_spring_security_logout" />"
						class="btn btn-danger" value="logout"> <span
						class="glyphicon-info-sign glyphicon" /></span> Logout
					</a>
				</p>
			</div>
		</div>

	</section>
	<section class="container">
		<div class="row">
			<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
				<div class="thumbnail">
					<div class="caption">
						<h3>Books</h3>
						<p>Display all books</p>
						<p>
							<a href="<spring:url value= "/books" />" class="btn btn-primary">
								<span class="glyphicon-info-sign glyphicon" /></span> Show all books
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
				<div class="thumbnail">
					<div class="caption">
						<h3>Add book</h3>
						<p>Create new book</p>
						<p>
							<a href="<spring:url value="/books/add" />"
								class="btn btn-primary"> <span
								class="glyphicon-info-sign glyphicon" /></span> Add book
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
				<div class="thumbnail">
					<div class="caption">
						<h3>Search book</h3>
						<p>Search your book</p>
						<p>
							<a href="/webstore/books/search" class="btn btn-primary"
								value="search"> <span class="glyphicon-info-sign glyphicon" /></span>
								Search book
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>
