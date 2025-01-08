<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CEMS-Topik : Admin Dashboard</title>

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
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/apexcharts/css/apexcharts.css">
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/overlay-scrollbar/css/OverlayScrollbars.min.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="/CEMS/assets/css/style.css">
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

	<script>

		$(window).ready(function(){
			$.ajax({
				url:'/CEMS/adminDash', //Controller에서 요청 받을 주소
				type:'post', //POST 방식으로 전달
				data: {},
				success:function(data){
					$("#total_question_cnt").html(data.total_question_cnt);
					$("#used_question_cnt").html(data.used_question_cnt);
					$("#user_cnt").html(data.user_cnt);
					$("#total_time").html(data.total_time);
				},
				error:function(){
					alert("에러입니다");
				}
			});
		});
	</script>
</head>

<body>


<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- Sidebar START -->
<nav class="navbar sidebar navbar-expand-xl navbar-dark bg-dark">

	<!-- Navbar brand for xl START -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand" href="home">
			<!-- <img class="navbar-brand-item" src="/CEMS/assets/images/logo-light.svg" alt=""> -->
			CEMS - Topik
		</a>
	</div>
	<!-- Navbar brand for xl END -->
	
	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column bg-dark">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				
				<!-- Menu item 1 -->
				<li class="nav-item"><a href="/CEMS/admin" class="nav-link active"><i class="bi bi-house fa-fw me-2"></i>관리자 페이지</a></li>
				
				<!-- Title -->
				<li class="nav-item ms-2 my-2">Pages</li>

				<!-- Menu item 3 -->
				<li class="nav-item"> <a class="nav-link" href="/CEMS/admin/admin-userpage"><i class="fas fa-user-graduate fa-fw me-2"></i>회원 관리</a></li>

				<!-- Menu item 5 -->
				<!-- <li class="nav-item"> <a class="nav-link" href="#"><i class="far fa-comment-dots fa-fw me-2"></i>Reviews</a></li> -->

				<!-- Menu item 7 -->
				<!-- <li class="nav-item"> <a class="nav-link" href="#"><i class="fas fa-user-cog fa-fw me-2"></i>Admin Settings</a></li> -->

		</div>
	</div>
</nav>
<!-- Sidebar END -->

<!-- Page content START -->
<div class="page-content">

	<!-- Top bar START -->
	<nav class="navbar top-bar navbar-light border-bottom py-0 py-xl-3">
		<div class="container-fluid p-0">
			<div class="d-flex align-items-center w-100">

				<!-- Logo START -->
				<div class="d-flex align-items-center d-xl-none">
					<a class="navbar-brand" href="index.html">
						<img class="light-mode-item navbar-brand-item h-30px" src="/CEMS/assets/images/logo-mobile.svg" alt="">
						<img class="dark-mode-item navbar-brand-item h-30px" src="/CEMS/assets/images/logo-mobile-light.svg" alt="">
					</a>
				</div>
				<!-- Logo END -->
				
				<!-- Toggler for sidebar START -->
				<div class="navbar-expand-xl sidebar-offcanvas-menu">
					<button class="navbar-toggler me-auto" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar" aria-expanded="false" aria-label="Toggle navigation" data-bs-auto-close="outside">
						<i class="bi bi-text-right fa-fw h2 lh-0 mb-0 rtl-flip" data-bs-target="#offcanvasMenu"> </i>
					</button>
				</div>
				<!-- Toggler for sidebar END -->
				
				<!-- Top bar left -->
				<div class="navbar-expand-lg ms-auto ms-xl-0">
					
					<!-- Toggler for menubar START -->
					<button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTopContent" aria-controls="navbarTopContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-animation">
							<span></span>
							<span></span>
							<span></span>
						</span>
					</button>
					<!-- Toggler for menubar END -->

					<!-- Topbar menu START -->
					<div class="collapse navbar-collapse w-100" id="navbarTopContent">
						<!-- Top search START -->
						<div class="nav my-3 my-xl-0 flex-nowrap align-items-center">
							<div class="nav-item w-100">
								<form class="position-relative">
									<input class="form-control pe-5 bg-secondary bg-opacity-10 border-0" type="search" placeholder="조회" aria-label="Search">
									<button class="bg-transparent px-2 py-0 border-0 position-absolute top-50 end-0 translate-middle-y" type="submit"><i class="fas fa-search fs-6 text-primary"></i></button>
								</form>
							</div>
						</div>
						<!-- Top search END -->
					</div>
					<!-- Topbar menu END -->
				</div>
				<!-- Top bar left END -->
				
				<!-- Top bar right START -->
				<div class="ms-xl-auto">
					<ul class="navbar-nav flex-row align-items-center">

						<!-- Notification dropdown START -->
						<li class="nav-item ms-2 ms-md-3 dropdown">
							<!-- Notification button -->
							<a class="btn btn-light btn-round mb-0" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside">
								<i class="bi bi-bell fa-fw"></i>
							</a>
							<!-- Notification dote -->
							<span class="notif-badge animation-blink"></span>

							<!-- Notification dropdown menu START -->
							<div class="dropdown-menu dropdown-animation dropdown-menu-end dropdown-menu-size-md p-0 shadow-lg border-0">
								<div class="card bg-transparent">
									<div class="card-header bg-transparent border-bottom py-4 d-flex justify-content-between align-items-center">
										<h6 class="m-0">Notifications <span class="badge bg-danger bg-opacity-10 text-danger ms-2">2 new</span></h6>
										<a class="small" href="#">Clear all</a>
									</div>
									<div class="card-body p-0">
										<ul class="list-group list-unstyled list-group-flush">
											<!-- Notif item -->
											<li>
												<a href="#" class="list-group-item-action border-0 border-bottom d-flex p-3">
													<div class="me-3">
														<div class="avatar avatar-md">
															<img class="avatar-img rounded-circle" src="/CEMS/assets/images/avatar/08.jpg" alt="avatar">
														</div>
													</div>
													<div>
														<p class="text-body small m-0">Congratulate <b>Joan Wallace</b> for graduating from <b>Microverse university</b></p>
														<u class="small">Say congrats</u>
													</div>
												</a>
											</li>

											<!-- Notif item -->
											<li>
												<a href="#" class="list-group-item-action border-0 border-bottom d-flex p-3">
													<div class="me-3">
														<div class="avatar avatar-md">
															<img class="avatar-img rounded-circle" src="/CEMS/assets/images/avatar/02.jpg" alt="avatar">
														</div>
													</div>
													<div>
														<h6 class="mb-1">Larry Lawson Added a new course</h6>
														<p class="small text-body m-0">What's new! Find out about new features</p>
														<u class="small">View detail</u>
													</div>
												</a>
											</li>

											<!-- Notif item -->
											<li>
												<a href="#" class="list-group-item-action border-0 border-bottom d-flex p-3">
													<div class="me-3">
														<div class="avatar avatar-md">
															<img class="avatar-img rounded-circle" src="/CEMS/assets/images/avatar/05.jpg" alt="avatar">
														</div>
													</div>
													<div>
														<h6 class="mb-1">New request to apply for Instructor</h6>
														<u class="small">View detail</u>
													</div>
												</a>
											</li>

											<!-- Notif item -->
											<li>
												<a href="#" class="list-group-item-action border-0 border-bottom d-flex p-3">
													<div class="me-3">
														<div class="avatar avatar-md">
															<img class="avatar-img rounded-circle" src="/CEMS/assets/images/avatar/03.jpg" alt="avatar">
														</div>
													</div>
													<div>
														<h6 class="mb-1">Update v2.3 completed successfully</h6>
														<p class="small text-body m-0">What's new! Find out about new features</p>
														<small class="text-body">5 min ago</small>
													</div>
												</a>
											</li>
										</ul>
									</div>
									<!-- Button -->
									<div class="card-footer bg-transparent border-0 py-3 text-center position-relative">
										<a href="#" class="stretched-link">See all incoming activity</a>
									</div>
								</div>
							</div>
							<!-- Notification dropdown menu END -->
						</li>
						<!-- Notification dropdown END -->

						<!-- Profile dropdown START -->
						<li class="nav-item ms-2 ms-md-3 dropdown">
							<!-- Avatar -->
							<a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="bi bi-gear-wide-connected"></i>
							</a>

							<!-- Profile dropdown START -->
							<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
								<!-- Profile info -->
								<li class="px-3">
									<div class="d-flex align-items-center">
										<!-- Avatar -->
										<div class="avatar me-3 mb-3">
											<i class="bi bi-gear-wide-connected"></i>
										</div>
										<div>
											<a class="h6 mt-2 mt-sm-0" href="#">${user.user_name}</a>
											<p class="small m-0">${user.user_id}</p>
										</div>
									</div>
								</li>
                				<li> <hr class="dropdown-divider"></li>
								<!-- Links -->
								<li><a class="dropdown-item" href="#"><i class="bi bi-person fa-fw me-2"></i>Edit Profile</a></li>
								<li><a class="dropdown-item" href="#"><i class="bi bi-gear fa-fw me-2"></i>Account Settings</a></li>
								<li><a class="dropdown-item" href="#"><i class="bi bi-info-circle fa-fw me-2"></i>Help</a></li>
								<li><a class="dropdown-item bg-danger-soft-hover" href="#"><i class="bi bi-power fa-fw me-2"></i>Sign Out</a></li>
								<li> <hr class="dropdown-divider"></li>

								<!-- Dark mode switch START -->
								<li>
									<div class="modeswitch-wrap" id="darkModeSwitch">
										<div class="modeswitch-item">
											<div class="modeswitch-icon"></div>
										</div>
										<span>Dark mode</span>
									</div>
								</li> 
								<!-- Dark mode switch END -->
							</ul>
							<!-- Profile dropdown END -->
						</li>
						<!-- Profile dropdown END -->
					</ul>
				</div>
				<!-- Top bar right END -->
			</div>
		</div>
	</nav>
	<!-- Top bar END -->

	<!-- Page main content START -->
	<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row">
			<div class="col-12 mb-3">
				<h1 class="h3 mb-2 mb-sm-0">관리자 페이지</h1>
			</div>
		</div>

		<!-- Counter boxes START -->
		<div class="row g-4 mb-4">
			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-warning bg-opacity-15 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<h2 id="total_question_cnt" class="mb-0 fw-bold">0</h2>
							<span class="mb-0 h6 fw-light">누적 생성 문제수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-warning text-white mb-0"><i class="fas fa-tv fa-fw"></i></div>
					</div>
				</div>
			</div>

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-purple bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<h2 id="used_question_cnt" class="mb-0 fw-bold">0</h2>
							<span class="mb-0 h6 fw-light">누적 사용 문제수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-purple text-white mb-0"><i class="fas fa-user-tie fa-fw"></i></div>
					</div>
				</div>
			</div>

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-primary bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<h2 id="user_cnt" class="mb-0 fw-bold">0</h2>
							<span class="mb-0 h6 fw-light">회원수</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-primary text-white mb-0"><i class="fas fa-user-graduate fa-fw"></i></div>
					</div>
				</div>
			</div>

			<!-- Counter item -->
			<div class="col-md-6 col-xxl-3">
				<div class="card card-body bg-success bg-opacity-10 p-4 h-100">
					<div class="d-flex justify-content-between align-items-center">
						<!-- Digit -->
						<div>
							<div class="d-flex">
								<h2 id="total_time" class="mb-0 fw-bold">0</h2>
								<span class="mb-0 h2 ms-1">sec</span>
							</div>
							<span class="mb-0 h6 fw-light">뺏은 시간</span>
						</div>
						<!-- Icon -->
						<div class="icon-lg rounded-circle bg-success text-white mb-0"><i class="bi bi-stopwatch-fill fa-fw"></i></div>
					</div>
				</div>
			</div>
		</div>
		<!-- Counter boxes END -->	
		<!-- Chart and Ticket START -->
		<div class="row g-4 mb-4">

			<!-- Chart START -->
			<div class="col-xxl-8">
				<div class="card shadow h-100">

					<!-- Card header -->
					<div class="card-header p-4 border-bottom">
						<h5 class="card-header-title">Earnings</h5>
					</div>

					<!-- Card body -->
					<div class="card-body">
						<!-- Apex chart -->
						<div id="ChartPayout"></div>
					</div>
				</div>
			</div>
			<!-- Chart END -->


		</div>
		<!-- Chart and Ticket END -->

		

	</div>
	<!-- Page main content END -->
</div>
<!-- Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/CEMS/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="/CEMS/assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>
<script src="/CEMS/assets/vendor/apexcharts/js/apexcharts.min.js"></script>
<script src="/CEMS/assets/vendor/overlay-scrollbar/js/overlayscrollbars.min.js"></script>

<!-- Template Functions -->
<script src="/CEMS/assets/js/functions.js"></script>


</body>
</html>