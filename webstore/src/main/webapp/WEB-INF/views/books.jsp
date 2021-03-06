<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">

<title>Books</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Books</h1>
				<p>This page contains all informations about books</p>
				<p class="text-right" style="padding-right: 15px">
					<a href="<spring:url value="login" />" class="btn btn-primary"
						value="login"> <span class="glyphicon-info-sign glyphicon" /></span>
						Login
					</a>
				</p>
				<p class="text-right" style="padding-right: 15px">
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
			<c:forEach items="${bookList}" var="book">
				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
						<div class="caption">
							<h3>${book.id}</h3>
							<p>${book.title}</p>
							<p>${book.authors}</p>
							<p>Status: ${book.status}</p>
							<p>
								<a href=" <spring:url value="/books/book/${book.id}" /> "
									class="btn btn-primary"> <span
									class="glyphicon-info-sign glyphicon" /></span> Details
								</a>
							</p>
							<p>
								<a
									href=" <spring:url value="/books/removed_book/${book.id}" /> "
									class="btn btn-danger"> <span
									class="glyphicon-info-sign glyphicon" /></span> Remove
								</a>
							</p>

						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<div>
			<p>
				<a href="<spring:url value="/" />" class="btn btn-info"> <span
					class="glyphicon-hand-left glyphicon"></span> back
				</a>
			</p>
		</div>
	</section>
</body>
</html>
