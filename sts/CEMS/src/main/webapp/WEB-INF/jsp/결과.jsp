<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CEMS:TOPIK - 결과</title>

	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">

	<!-- Favicon -->
	<link rel="shortcut icon" href="assets/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/tiny-slider/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/glightbox/css/glightbox.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/choices/css/choices.min.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="assets/css/style.css">

	<!-- jquery -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>

<body>
<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Page intro START -->
<section class="bg-light py-0 py-sm-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<!-- Badge -->
				<h5 class="mb-4 font-base bg-primary text-white py-2 px-4 rounded-2 d-inline-block">결과</h5>
				<!-- Title -->
				<!-- <h2>빈칸 채우기</h2> -->
				<!-- <p>test</p> -->
				<!-- Content -->
				<ul class="list-inline mb-0">
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-star text-warning me-2 "></i><span id="question_cnt">${result.correctCnt} / ${result.questionCnt}</span></li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-user-graduate text-orange me-2"></i>${user.user_nickname}</li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-globe text-info me-2"></i>한국어능력검정시험</li>
				</ul>
			</div>
		</div>
	</div>
</section>

<!-- =======================
Page content START -->
<section class="pb-0 py-lg-5">
	<div class="container">
		<div class="row">
			<!-- Main content START -->
			<!-- Main content END -->

			<!-- Right sidebar START -->
			<div class="col-lg-8 pt-5 pt-lg-0 text-center mx-auto">
				<div class="row mb-5 mb-lg-0">
					<div class="col-md-6 col-lg-12">
						<div class="card card-body shadow p-4 mb-4">
							<!-- Title -->
							<h4 class="my-4">This course includes</h4>
							<ul class="col-4 list-group list-group-borderless mx-auto">
								<li class="list-group-item d-flex justify-content-between align-items-center my-1">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-book-open text-primary"></i>총 문제</span>
									<span>${result.questionCnt} 문제</span>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center my-1">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-clock text-primary"></i>걸린 시간</span>
									<span>${result.timeCnt} 초</span>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center my-1">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-signal text-primary"></i>맞은 갯수</span>
									<span>${result.correctCnt} 개</span>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center my-1">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-globe text-primary"></i>틀린 갯수</span>
									<span>${result.wrongCnt} 개</span>
								</li>
								<li class="list-group-item d-flex justify-content-end align-items-center mt-3">
									<a href="/CEMS/home" class="btn btn-primary">나가기</a>
								</li>
							</ul>
						</div>
					</div>
				</div><!-- Row End -->
			</div>
			<!-- Right sidebar END -->

		</div><!-- Row END -->
	</div>
</section>
<!-- =======================
Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!— Back to top —>
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!— Bootstrap JS —>
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!— Vendors —>
<script src="assets/vendor/tiny-slider/tiny-slider.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.js"></script>
<script src="assets/vendor/choices/js/choices.min.js"></script>

<!— Template Functions —>
<script src="assets/js/functions.js"></script>

</body>
</html>