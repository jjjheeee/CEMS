<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/aos/aos.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="/CEMS/assets/css/style.css">

	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- Main content START -->
	<div>
		<!-- Counter boxes START -->
		<div class="row pb-3 justify-content-center">
			<!-- Counter item -->
			<div class="col-lg-3 mb-3 mb-lg-0">
				<div class="d-flex justify-content-center align-items-center p-4 bg-orange bg-opacity-15 rounded-3">
					<span class="display-6 lh-1 text-orange mb-0"><i class="fas fa-tv fa-fw"></i></span>
					<div class="ms-4">
						<div class="d-flex">
							<h5 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="6"	data-purecounter-delay="200">0</h5>
						</div>
						<p class="mb-0 h6 fw-light">응시한 모의고사</p>
					</div>
				</div>
			</div>
			<!-- Counter item -->
			<div class="col-lg-3 mb-3 mb-lg-0">
				<div class="d-flex justify-content-center align-items-center p-4 bg-purple bg-opacity-15 rounded-3">
					<span class="display-6 lh-1 text-purple mb-0"><i class="fas fa-clipboard-check fa-fw"></i></span>
					<div class="ms-4">
						<div class="d-flex">
							<h5 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="5"	data-purecounter-delay="200">0</h5>
						</div>
						<p class="mb-0 h6 fw-light">완료한 모의고사</p>
					</div>
				</div>
			</div>
			<!-- Counter item -->
			<div class="col-lg-3 mb-3 mb-lg-0">
				<div class="d-flex justify-content-center align-items-center p-4 bg-success bg-opacity-10 rounded-3">
					<span class="display-6 lh-1 text-success mb-0"><i class="fas fa-medal fa-fw"></i></span>
					<div class="ms-4">
						<div class="d-flex">
							<h5 class="purecounter mb-0 fw-bold" data-purecounter-start="0" data-purecounter-end="3" data-purecounter-delay="300">0</h5>
						</div>
						<p class="mb-0 h6 fw-light">합격된 모의고사</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Counter boxes END -->
	
		<div class="card bg-transparent border rounded-3">
			<!-- Card header START -->
			<div class="card-header bg-transparent border-bottom">
				<h3 class="mb-0">학습 기록 - 모의고사</h3>
			</div>
			<!-- Card header END -->
	
			<!-- Card body START -->
			<div class="card-body">
	
				<!-- Search and select START -->
				<div class="row g-3 align-items-center justify-content-between mb-4">
					<!-- Content -->
					<div class="col-md-8">
						<form class="rounded position-relative">
							<input class="form-control pe-5 bg-transparent" type="search" placeholder="조회" aria-label="Search">
							<button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit">
						<i class="fas fa-search fs-6 "></i>
					</button>
						</form>
					</div>
	
					<!-- Select option -->
					<div class="col-md-3">
						<!-- Short by filter -->
						<form>
							<select class="form-select js-choice border-0 z-index-9 bg-transparent" aria-label=".form-select-sm">
								<option value="">정렬</option>
								<option>최신순</option>
								<option>진행도순</option>
							</select>
						</form>
					</div>
				</div>
				<!-- Search and select END -->
	
				<!-- Course list table START -->
				<div class="table-responsive border-0">
					<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
						<!-- Table head -->
						<thead>
							<tr>
								<th scope="col" class="border-0 rounded-start">회차</th>
								<th scope="col" class="border-0">풀은 문제 / 총 문제</th>
								<th scope="col" class="border-0 rounded-end"></th>
							</tr>
						</thead>
	
						<!-- Table body START -->
						<tbody>
							<tr>
								<!-- Table data -->
								<td>
									<div class="d-flex align-items-center">
										<!-- Image -->
										<div class="w-100px">
											<img src="/CEMS/assets/images/courses/4by3/02.jpg" class="rounded" alt="">
										</div>
										<div class="mb-0 ms-2">
											<!-- Title -->
											<h6><a href="#">제 65회차 모의고사</a></h6>
											<!-- Info -->
											<div class="overflow-hidden">
												<h6 class="mb-0 text-end">90%</h6>
												<div class="progress progress-sm bg-primary bg-opacity-10">
													<div class="progress-bar bg-primary aos" role="progressbar" data-aos="slide-right" data-aos-delay="200" data-aos-duration="1000" data-aos-easing="ease-in-out" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
								<!-- Table data -->
								<td>40 / 70</td>
								<!-- Table data -->
								<td>
									<a href="#" class="btn btn-sm btn-primary-soft me-1 mb-1 mb-md-0"><i class="bi bi-play-circle me-1"></i>이어서 풀기</a>
								</td>
							</tr>
						</tbody>
						<!-- Table body END -->
					</table>
				</div>
				<!-- Course list table END -->
	
				<!-- Pagination START -->
				<div class="d-sm-flex justify-content-center align-items-sm-center mt-4 mt-sm-3">
					<!-- Pagination -->
					<nav class="d-flex justify-content-center mb-0" aria-label="navigation">
						<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
							<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-left"></i></a></li>
							<li class="page-item mb-0 active"><a class="page-link" href="#">1</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#"><i class="fas fa-angle-right"></i></a></li>
						</ul>
					</nav>
				</div>
				<!-- Pagination END -->
			</div>
			<!-- Card body START -->
		</div>
	<!-- Main content END -->
	</div>


<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/CEMS/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="/CEMS/assets/vendor/choices/js/choices.min.js"></script>
<script src="/CEMS/assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>
<script src="/CEMS/assets/vendor/aos/aos.js"></script>

