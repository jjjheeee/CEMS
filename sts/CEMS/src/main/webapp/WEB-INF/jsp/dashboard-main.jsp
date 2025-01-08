<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<!DOCTYPE html>
<html lang="en">
<head>
	<title>CEMS-Topik : ${user.user_name}'s Dashboard</title>

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
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/aos/aos.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="/CEMS/assets/css/style.css">

	<!-- jquery -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

</head>

<body>
	<%@ include file="./header.jsp" %>


<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- =======================
Page Banner START -->
<section class="pt-0">
	<div class="container-fluid px-0">
		<div class="card bg-blue h-100px h-md-200px rounded-0" style="background:url(/CEMS/assets/images/pattern/04.png) no-repeat center center; background-size:cover;">
		</div>
	</div>
	<div class="container mt-n4">
		<div class="row">
			<div class="col-12">
				<div class="card bg-transparent card-body pb-0 px-0 mt-2 mt-sm-0">
					<div class="row d-sm-flex justify-sm-content-between mt-2 mt-md-0">
						<!-- Avatar -->
						<div class="col-auto">
							<div class="avatar avatar-xxl position-relative mt-n3">
								<img class="avatar-img rounded-circle border border-white border-3 shadow" src="/CEMS/assets/images/avatar/09.jpg" alt="">
							</div>
						</div>
						<!-- Profile info -->
						<div class="col d-sm-flex justify-content-between align-items-center">
							<div>
								<h1 class="my-1 fs-4">${user.user_name}</h1>
								<!-- <ul class="list-inline mb-0">
									<li class="list-inline-item me-3 mb-1 mb-sm-0">
										<span class="h6">255</span>
										<span class="text-body fw-light">points</span>
									</li>
									<li class="list-inline-item me-3 mb-1 mb-sm-0">
										<span class="h6">7</span>
										<span class="text-body fw-light">Completed courses</span>
									</li>
									<li class="list-inline-item me-3 mb-1 mb-sm-0">
										<span class="h6">52</span>
										<span class="text-body fw-light">Completed lessons</span>
									</li>
								</ul> -->
							</div>
							<!-- Button -->
							<!-- <div class="mt-2 mt-sm-0">
								<a href="student-course-list.html" class="btn btn-outline-primary mb-0">View my courses</a>
							</div> -->
						</div>
					</div>
				</div>

				<!-- Advanced filter responsive toggler START -->
				<!-- Divider -->
				<hr class="d-xl-none">
				<div class="col-12 col-xl-3 d-flex justify-content-between align-items-center">
					<a class="h6 mb-0 fw-bold d-xl-none" href="#">Menu</a>
					<button class="btn btn-primary d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
						<i class="fas fa-sliders-h"></i>
					</button>
				</div>
				<!-- Advanced filter responsive toggler END -->
			</div>
		</div>
	</div>
</section>
<!-- =======================
Page Banner END -->

<!-- =======================
Page content START -->
<section class="pt-0">
	<div class="mx-auto">
		<div class="row">
			<div class="col-xl-1"></div>
			<!-- Left sidebar START -->
			<div class="col-xl-2">
				<!-- Responsive offcanvas body START -->
				<div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar" aria-labelledby="offcanvasSidebarLabel">
					<!-- Offcanvas header -->
					<div class="offcanvas-header bg-light">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">My profile</h5>
						<button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
					</div>
					<!-- Offcanvas body -->
					<div class="offcanvas-body p-3 p-xl-0">
						<div class="bg-dark border rounded-3 pb-0 p-3 w-100">
							<!-- Dashboard menu -->
							<div class="list-group list-group-dark list-group-borderless" id="dashboardmenu">
								<a class="list-group-item" style="display: none;" ><i class="bi bi-ui-checks-grid fa-fw me-2"></i></a>
								<a class="list-group-item" href="javascript:changeURL('dashboard');" id="dashboard"><i class="bi bi-question-diamond fa-fw me-2"></i>${user.user_nickname}의 학습기록</a>
								<a class="list-group-item ms-4" href="javascript:changeURL('statistics');" id="statistics"><i class="bi bi-arrow-return-right fa-fw me-2"></i>학습통계</a>
								<a class="list-group-item" href="javascript:changeURL('editprofile');" id="editprofile"><i class="bi bi-pencil-square fa-fw me-2"></i>개인정보 변경</a>
								<a class="list-group-item" href="javascript:changeURL('deleteprofile');" id="deleteprofile"><i class="bi bi-trash fa-fw me-2"></i>회원탈퇴</a>
								<a class="list-group-item text-danger bg-danger-soft-hover" href="logout"><i class="fas fa-sign-out-alt fa-fw me-2"></i>로그아웃</a>
								<!-- <a class="list-group-item" href="javascript:changeURL('subscription')" id="subscription"><i class="bi bi-question-diamond fa-fw me-2"></i>My Subscriptions</a> -->
								<!-- <a class="list-group-item" href="javascript:void(0);" onclick="changeURL('subscription')"><i class="bi bi-credit-card-2-front fa-fw me-2"></i>Payment info</a> -->
								<!-- <a class="list-group-item" href="javascript:void(0);" onclick="changeURL('subscription')"><i class="bi bi-cart-check fa-fw me-2"></i>Wishlist</a> -->
								<!-- <a class="list-group-item" href="javascript:void(0);" onclick="changeURL('subscription')"><i class="bi bi-gear fa-fw me-2"></i>Settings</a> -->
							</div>
						</div>
					</div>
				</div>
				<!-- Responsive offcanvas body END -->
			</div>
			<!-- Left sidebar END -->
			
			<!-- Main content START -->
			<div class="col-xl-8">
				<script>
					if(localStorage.getItem('src')){
						var src = localStorage.getItem('src')
						document.getElementById(src).click();
					}else{
					}		
					
				</script>
				<iframe  src="dashboard/dashboard" onload='javascript:(function(o){o.style.height=o.contentWindow.document.body.scrollHeight+"px";}(this));' name="dashboardIFrame" id="dashboardIFrame" style="width: 100%; height: 100%; border:none;">
			</div>
			<div class="col-xl-1"></div>

			</iframe> 
			<!-- Main content END -->
			</div><!-- Row END -->
		</div>
</section>
<!-- =======================
Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->
<%@ include file="./footer.jsp" %>


<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/CEMS/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="/CEMS/assets/vendor/choices/js/choices.min.js"></script>
<script src="/CEMS/assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>
<script src="/CEMS/assets/vendor/aos/aos.js"></script>

<!-- Template Functions -->
<script src="/CEMS/assets/js/functions.js"></script>

</body>
</html>