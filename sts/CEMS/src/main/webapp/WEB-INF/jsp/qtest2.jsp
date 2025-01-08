<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>

	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">

	<!-- Favicon -->
	<link rel="shortcut icon" href="/CEMS/assets/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/choices/css/choices.min.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="/CEMS/assets/css/style.css">

	<!-- Include Html -->

</head>

<body>
	<%@ include file="./header.jsp" %>
<!-- **************** MAIN CONTENT START **************** -->
<main>

<!-- =======================
Page Banner START -->
<section class="bg-dark align-items-center d-flex" style="background:url(/CEMS/assets/images/pattern/04.png) no-repeat center center; background-size:cover;">
	<!-- Main banner background image -->
	<div class="container">
			<div class="row">
				<div class="col-12">
					<!-- Title -->
					<h1 class="text-white">test</h1>
					<!-- Breadcrumb -->
					<div class="d-flex">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb breadcrumb-dark breadcrumb-dots mb-0">
								<li class="breadcrumb-item"><a href="/CEMS/home">Home</a></li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
	</div>
</section>

<c:set var="cnt" value="1" />

<div class="col-12 mx-auto">
	<div class="col-5 mx-auto mt-5">
		<c:forEach items="${Question}" var="Q" varStatus="status">
			<div class="mt-5">
				<h6>${status.count}.${Q.jimun}</h6>
			</div>
			<form action="">
				<c:forTokens  var="bogi" items="${Q.bogi}" delims=" " varStatus="num">
					<div class="mt-3 col-6">
						<input type="radio" class="form-check-input" name="bogi${status.count}"  value="${num.count}"/>
						<label class="form-check-lable">
							${bogi}
						</label>
					</div>
				</c:forTokens>
			</form>
			<!-- <div class="mt-5">
				<h6>정답 : ${Question}</h6>
			</div> -->
		</c:forEach>
	</div>
</div>

</main>
<!-- **************** MAIN CONTENT END **************** -->
<!-- Footer Include -->
<%@ include file="./footer.jsp" %>

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/CEMS/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="/CEMS/assets/vendor/choices/js/choices.min.js"></script>

<!-- Template Functions -->
<script src="/CEMS/assets/js/functions.js"></script>

</body>
</html>