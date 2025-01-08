<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>CEMS-Topik : 공지사항</title>

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

	<style>
		.bi-bookmark-star {
			font-size: 18px;
		
		}

		.bi-bookmark-star-fill {
			font-size: 18px;
		
		}
	</style>

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
					<h1 class="text-white">공지사항</h1>
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
<!-- =======================
Page Banner END -->

<!-- =======================
Page content START -->









<!-- ******************************* main 기찬웅 **************************************************** -->
<div class="col-12 mx-auto">
<!-- Page main content START -->
<div class="page-content-wrapper">
	<!-- Card START -->
	<div class="card bg-transparent">

		<!-- Card header START -->
		<div class="card-header bg-light">
			<!-- Search and select START -->
			<div class="row g-3 align-items-center justify-content-between mx-5">

				<!-- Search bar -->
				<div class="col-md-8 col-7">
					<form class="rounded position-relative">
						<input class="form-control bg-body" type="search" placeholder="조회" aria-label="Search">
						<button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit">
							<i class="fas fa-search fs-6 "></i>
						</button>
					</form>
				</div>

				<!-- Select option -->
				<div class="col-md-3 col-3"> 
					<!-- Short by filter -->
					<form>
						<select class="form-select js-choice border-0 z-index-9" aria-label=".form-select-sm">
							<option value="">정렬</option>
							<option>날짜</option>
							<option>제목</option>
							<option>조회수</option>
						</select>
					</form>
				</div>
				<div class="col-1 mt-4 ps-4">
					<h6><a href="/CEMS/board_write1">글쓰기</a></h6>
				</div>
			</div>
			<!-- Search and select END -->
		</div>
		<!-- Card header END -->

		<!-- Card body START -->
		<div class="card-body col-10 mx-auto">
			<!-- Course table START -->
			<div class="table-responsive border-0 rounded-3">
				<!-- Table START -->
				<table class="table table-dark-gray align-middle p-4 mb-0 table-hover table-bordered">
					<!-- Table head -->
					<thead class="text-center">
						<tr>
							<th scope="col" class="col-1 border-0 rounded-start"></th>
							<th scope="col" class="col-6 border-0">제목</th>
							<th scope="col" class="col-2 border-0">작성자</th>
							<th scope="col" class="col-2 border-0">작성일</th>
							<th scope="col" class="col-1 border-0 rounded-end">조회수</th>
						</tr>
					</thead>
					<c:forEach items="${boardlist}" var="board" varStatus="status">
					<tbody>
						<tr>
							<td>
								<div class="d-flex align-items-center position-relative pe-4">
									<div class="ms-4">
										<a href="/CEMS/updatemark_${board.board_id}" class="bookmark"><i class="bi bi-bookmark-star${board.bookmark}"></i></a>
									</div>
									<script>
										$(document).ready(function(){
											var usernm = "<c:out value='${user.admin}'/>";

			
											if(usernm == '1'){
												$(".bookmark").show();
											} else{
												$(".bookmark").hide();
											}
										});
									</script>
									<h6 class="table-responsive-title mb-0 ms-4">	
										<span>${status.count}</span>
									</h6>
								</div>
							</td>

							<td>
								<div class="d-flex align-items-center">
									<div class="ms-2">
										<a href="/CEMS/board_${board.board_id}" class="mb-0 fw-light">${board.title}</a>
									</div>
								</div>
							</td>

							<td class="text-center">
								<strong>${board.writer}</strong>
							</td>

							<td class="text-center">
								${board.write_date}
							</td>

							<td class="text-center">
								${board.viewcnt}
							</td>
						</tr>
					</tbody>
					</c:forEach>
					<!-- Table body END -->
				</table>
				<!-- Table END -->
			</div>
			<!-- Course table END -->
		</div>
		<!-- Card body END -->

		<!-- Card footer START -->
		<div class="card-footer bg-transparent pt-0 mx-auto">
			<!-- Pagination START -->
			<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
				<!-- Content -->
				<p class="mb-0 text-center text-sm-start"></p>
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
		<!-- Card footer END -->
	</div>
	<!-- Card END -->
</div>
<!-- Page main content END -->
</div>

<!-- ******************************* main 기찬웅 **************************************************** -->












<!-- =======================
Page content END -->

<!-- =======================
Action box START -->
<!-- <section class="pt-0">
	<div class="container position-relative">
		SVG
		<figure class="position-absolute top-50 start-50 translate-middle ms-3">
			<svg>
				<path d="m496 22.999c0 10.493-8.506 18.999-18.999 18.999s-19-8.506-19-18.999 8.507-18.999 19-18.999 18.999 8.506 18.999 18.999z" fill="#fff" fill-rule="evenodd" opacity=".502"/>
				<path d="m775 102.5c0 5.799-4.701 10.5-10.5 10.5-5.798 0-10.499-4.701-10.499-10.5 0-5.798 4.701-10.499 10.499-10.499 5.799 0 10.5 4.701 10.5 10.499z" fill="#fff" fill-rule="evenodd" opacity=".102"/>
				<path d="m192 102c0 6.626-5.373 11.999-12 11.999s-11.999-5.373-11.999-11.999c0-6.628 5.372-12 11.999-12s12 5.372 12 12z" fill="#fff" fill-rule="evenodd" opacity=".2"/>
				<path d="m20.499 10.25c0 5.66-4.589 10.249-10.25 10.249-5.66 0-10.249-4.589-10.249-10.249-0-5.661 4.589-10.25 10.249-10.25 5.661-0 10.25 4.589 10.25 10.25z" fill="#fff" fill-rule="evenodd" opacity=".2"/>
			</svg>
		</figure>
		
		<div class="bg-success p-4 p-sm-5 rounded-3">
			<div class="row justify-content-center position-relative">
				Svg
				<figure class="fill-white opacity-1 position-absolute top-50 start-0 translate-middle-y">
					<svg width="141px" height="141px">
						<path	d="M140.520,70.258 C140.520,109.064 109.062,140.519 70.258,140.519 C31.454,140.519 -0.004,109.064 -0.004,70.258 C-0.004,31.455 31.454,-0.003 70.258,-0.003 C109.062,-0.003 140.520,31.455 140.520,70.258 Z"/>
					</svg>
				</figure>
				Action box
				<div class="col-11 position-relative">
					<div class="row align-items-center">
						Title
						<div class="col-lg-7">
							<h3 class="text-white">Become an Instructor!</h3>
							<p class="text-white mb-3 mb-lg-0">Speedily say has suitable disposal add boy. On forth doubt miles of child. Exercise joy man children rejoiced. Yet uncommonly his ten who diminution astonished.</p>
						</div>
						Button
						<div class="col-lg-5 text-lg-end">
							<a href="#" class="btn btn-dark mb-0">Start Teaching today</a>
						</div>
					</div>
				</div>
			</div> Row END
		</div>
	</div>
</section> -->
<!-- =======================
Action box END -->

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