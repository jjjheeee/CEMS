<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CEMS-Topik : 모의고사</title>

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
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/<!DOCTYPE html>
<html lang="en">
<head>
<title>CEMS-Topik : 모의고사</title>

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
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/choices/css/choices.min.css">

<!-- Theme CSS -->
<link id="style-switch" rel="stylesheet" type="text/css" href="/CEMS/assets/css/style.css">
</head>

<body>
	<!-- include Header Html -->
	<%@ include file="./header.jsp" %>

<!-- **************** MAIN CONTENT START **************** -->
<main>

<!-- =======================
Page Banner START -->
<section class="bg-blue align-items-center d-flex" style="background:url(/CEMS/assets/images/pattern/04.png) no-repeat center center; background-size:cover;">
	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<!-- Title -->
				<h1 class="text-white">모의고사</h1>
				<!-- Breadcrumb -->
				<div class="d-flex justify-content-center">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb breadcrumb-dark breadcrumb-dots mb-0">
							<li class="breadcrumb-item"><a href="home">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">모의고사</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- =======================
Page Banner END -->

<!-- =======================
Page content START -->
<section class="py-5">
<div class="container">
	<div class="row">
		<!-- Main content START -->
		<div class="col-lg-8 col-xl-9">

			<!-- Search option START -->
			<div class="row mb-4 align-items-center">
				<!-- Search bar -->
				<div class="col-xl-6">
					<form class="border rounded p-2">
						<div class="input-group input-borderless">
							<input class="form-control me-1" type="search" placeholder="검색">
							<button type="button" class="btn btn-primary mb-0 rounded z-index-1"><i class="fas fa-search"></i></button>
						</div>
					</form>
				</div>

				<!-- Select option -->
				<div class="col-xl-3 mt-3 mt-xl-0">
					<form class="border rounded p-2 input-borderless">
						<select class="form-select form-select-sm js-choice border-0" aria-label=".form-select-sm">
							<option value="">최신순</option>
							<option>조회수</option>
						</select>
					</form>
				</div>

				<!-- Content -->
				<div class="col-12 col-xl-3 d-flex justify-content-between align-items-center mt-3 mt-xl-0">
					<!-- Advanced filter responsive toggler START -->
					<button class="btn btn-primary mb-0 d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fas fa-sliders-h me-1"></i> Show filter
					</button>
					<!-- Advanced filter responsive toggler END -->
				</div>

			</div>
			<!-- Search option END -->

			<!-- Course Grid START -->
			<div class="row g-4">
				<c:forEach items="${mockboard}" var="mock" varStatus="status">
					<!-- Card item START -->
					<div class="col-sm-6 col-xl-4" style="visibility: hidden;">
						<div class="card shadow h-100">
							<!-- Image -->
							<a href="/CEMS/모의고사_do_${mock.mockboard_id}"><img src="/CEMS/assets/images/courses/4by3/0${status.count}.jpg" class="card-img-top" alt="course image"></a>
							<!-- Card body -->
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="/CEMS/모의고사_do_${mock.mockboard_id}" class="badge bg-purple bg-opacity-10 text-purple">${mock.coursenm}</a>
									<span class="text-black"><i class="bi bi-eye-fill me-1"></i>${mock.viewcnt}</span>
								</div>
								<!-- Title -->
								<div class="pt-2">
									<h6 class="card-title"><a href="/CEMS/모의고사_do_${mock.mockboard_id}">${mock.title}</a></h6>
									<p class="mb-2 text-truncate-2">${mock.content}</p>
								</div>
								
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${mock.write_date}</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->
				</c:forEach>
			</div>
			<!-- Course Grid END -->

			<!-- Pagination START -->
			<div class="col-12">
				<nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
					<ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
						<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-double-left"></i></a></li>
						<li class="page-item mb-0 active"><a class="page-link" href="#">1</a></li>
						<li class="page-item mb-0"><a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a></li>
					</ul>
				</nav>
			</div>
			<!-- Pagination END -->
		</div>
		<!-- Main content END -->

		<!-- Right sidebar START -->
		<div class="col-lg-4 col-xl-3">
			
							<!-- Price START -->
							<div class="card card-body mb-5 mt-1"></div>
							<div class="card card-body shadow p-4 mb-4 mt-5">
								<!-- Title -->
								<h4 class="mb-3">Level</h4>
								<ul class="list-inline mb-0">
									<!-- Topik I -->
									<li class="list-inline-item">
										<input type="radio" class="btn-check" name="options" id="option2">
										<label class="btn btn-light btn-primary-soft-check" for="option2">TOPIK I</label>
									</li>
									<!-- Topik II -->
									<li class="list-inline-item">
										<input type="radio" class="btn-check" name="options" id="option3">
										<label class="btn btn-light btn-primary-soft-check" for="option3">TOPIK II</label>
									</li>
								</ul>
							</div>
							<!-- Price END -->
					</form><!-- Form End -->
				</div>

				<!-- Button -->
				

			</div>
			<!-- Responsive offcanvas body END -->
		</div>
		<!-- Right sidebar END -->
	</div><!-- Row END -->
</div>
</section>
<!-- =======================
Page content END -->

<!-- =======================
Newsletter START -->
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
<script src="assets/js/functions.js"></script>

</body>
</html>