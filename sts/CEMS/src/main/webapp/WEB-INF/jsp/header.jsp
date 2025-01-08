<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">

	<!-- Favicon -->
	<!-- Title icon -->
	<!-- <link rel="shortcut icon" href="/CEMS/assets/images/favicon.ico"> -->

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/tiny-slider/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/glightbox/css/glightbox.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="/CEMS/assets/css/style.css">

	<!-- Include Html -->
    <script src="https://www.w3schools.com/lib/w3.js"></script>

	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" ></script>
	<script src="/CEMS/assets/js/functions.js"></script>
	<script>

$("#logindiv").show();
$("#userdiv").hide();

// Login Check.
var login_C = '<c:out value="${user.admin}"/>';

$(document).ready(function(){
	if(login_C=='1'){
		$("#admin-dashboard").show();
	}
	else{
		$("#admin-dashboard").hide();

	}
	if (!(login_C == '')) {
			$("#logindiv").hide();
			$("#userdiv").show();
			// logindiv.style.display = 'none';
			// userdiv.style.display = 'inline';
	}else{
		$("#logindiv").show();
		$("#userdiv").hide();
		$(".topik").prop("href", "loginpage");
		// logindiv.style.display = 'inline';
		// userdiv.style.display = 'none';
	}
});

	</script>
    
</head>
<body>
    	<!-- Header START -->
<header class="navbar-light navbar-sticky header-static">
	<!-- Logo Nav START -->
	<nav class="navbar navbar-expand-xl">
		<div class="container-fluid px-3 px-xl-5">
			<!-- Logo START -->
			<a class="navbar-brand" href="home">
				<!-- Main logo -->
				CEMS-Topik
				<!-- <img class="light-mode-item navbar-brand-item" src="/CEMS/assets/images/logo.svg" alt="logo">
				<img class="dark-mode-item navbar-brand-item" src="asse	ts/images/logo-light.svg" alt="logo"> -->
			</a>
			<!-- Logo END -->

			<!-- Responsive navbar toggler -->
			<button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-animation">
					<span></span>
					<span></span>
					<span></span>
				</span>
			</button>

			<!-- Main navbar START -->
			<div class="navbar-collapse w-100 collapse justify-content-center" id="navbarCollapse">

				<!-- Nav Main menu START -->
				<ul class="navbar-nav navbar-nav-scroll">
					<!-- STUDY TOPIK Nav -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="demoMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >Study TOPIK</a>
						<ul class="dropdown-menu" aria-labelledby="demoMenu">
							<li> <a class="dropdown-item topik" href="모의고사"><i class="bi bi-calendar-event-fill fa-fw me-1"></i>모의고사</a> </li>
							<li> <hr class="dropdown-divider"></li>
							<li> <a class="dropdown-item topik" href="TOPIKI"><i class="bi bi-journal-bookmark-fill fa-fw me-1"></i>TOPIK I</a> </li>
							<li> <a class="dropdown-item topik" href="TOPIKII"><i class="bi bi-journal-bookmark-fill fa-fw me-1"></i>TOPIK II</a> </li>
							<!-- <li> <hr class="dropdown-divider"></li> -->
							<!-- <li> <a class="dropdown-item topik" href="#">comming soon... <i class="bi bi-box-arrow-up-right fa-fw me-1"></i></a>  </li> -->
						</ul>
					</li>

					<!-- Nav item 2 Pages -->
					<li class="nav-item dropdown" style="display: none;">
						<a class="nav-link dropdown-toggle" href="#" id="pagesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
						<ul class="dropdown-menu" aria-labelledby="pagesMenu">
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item dropdown-toggle" href="#">Course</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="course-categories">Course Categories</a></li>
									<li> <hr class="dropdown-divider"></li>
									<li> <a class="dropdown-item" href="course-grid">Course Grid Classic</a></li>
									<li> <a class="dropdown-item" href="course-grid-2">Course Grid Minimal</a></li>
									<li> <hr class="dropdown-divider"></li>
									<li> <a class="dropdown-item" href="course-list">Course List Classic</a></li>
									<li> <a class="dropdown-item" href="course-list-2">Course List Minimal</a></li>
									<li> <hr class="dropdown-divider"></li>
									<li> <a class="dropdown-item" href="course-detail">Course Detail Classic</a></li>
									<li> <a class="dropdown-item" href="course-detail-min">Course Detail Minimal</a></li>
									<li> <a class="dropdown-item" href="course-detail-adv">Course Detail Advance</a></li>
									<li> <a class="dropdown-item" href="course-detail-module">Course Detail Module<span class="badge bg-success ms-2 smaller">New</span></a></li>
									<li> <a class="dropdown-item" href="course-video-player">Course Full Screen Video</a></li>
								</ul>
							</li>
							
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item dropdown-toggle" href="#">About</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="/CEMS/about">About Us</a></li>
									<li> <a class="dropdown-item" href="contact-us">Contact Us</a></li>
									<li> <a class="dropdown-item" href="blog-grid">Blog Grid</a></li>
									<li> <a class="dropdown-item" href="blog-masonry">Blog Masonry</a></li>
									<li> <a class="dropdown-item" href="blog-detail">Blog Detail</a></li>
									<li> <a class="dropdown-item" href="pricing">Pricing</a></li>
								</ul>
							</li>
							
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item dropdown-toggle" href="#">Hero Banner</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="docs/snippet-hero-12">Hero Form<span class="badge bg-success ms-2 smaller">New</span></a></li>
									<li> <a class="dropdown-item" href="docs/snippet-hero-13">Hero Vector<span class="badge bg-success ms-2 smaller">New</span></a></a></li>
									<li> <p class="dropdown-item mb-0">Coming soon....</p></li>
								</ul>
							</li>
							
							<li> <a class="dropdown-item" href="instructor-list">Instructor List</a></li>
							<li> <a class="dropdown-item" href="instructor-single">Instructor Single</a></li>
							<li> <a class="dropdown-item" href="become-instructor">Become an Instructor</a></li>
							<li> <a class="dropdown-item" href="abroad-single">Abroad Single</a></li>
							<li> <a class="dropdown-item" href="workshop-detail">Workshop Detail<span class="badge bg-success ms-2 smaller">New</span></a></li>
							
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item dropdown-toggle" href="#">Shop</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="shop">Shop grid</a></li>
									<li> <a class="dropdown-item" href="shop-product-detail">Product detail</a></li>
									<li> <a class="dropdown-item" href="cart">Cart</a></li>
									<li> <a class="dropdown-item" href="checkout">Checkout</a></li>
									<li> <a class="dropdown-item" href="empty-cart">Empty Cart</a></li>
									<li> <a class="dropdown-item" href="wishlist">Wishlist</a></li>
								</ul>
							</li>
							
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item dropdown-toggle" href="#">Help</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="help-center">Help Center</a></li>
									<li> <a class="dropdown-item" href="help-center-detail">Help Center Single</a></li>
								</ul>
							</li>
							
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item dropdown-toggle" href="#">Authentication</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="sign-in.jsp">Sign In</a></li>
									<li> <a class="dropdown-item" href="sign-up.jsp">Sign Up</a></li>
									<li> <a class="dropdown-item" href="forgot-password">Forgot Password</a></li>
								</ul>
							</li>
							
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item dropdown-toggle" href="#">Form</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="request-demo">Request a demo</a></li>
									<li> <a class="dropdown-item" href="book-class">Book a Class</a></li>
									<li> <a class="dropdown-item" href="request-access">Free Access</a></li>
									<li> <a class="dropdown-item" href="university-admission-form">Admission Form</a></li>
								</ul>
							</li>
							
							<li> <a class="dropdown-item" href="faq">FAQs</a></li>
							<li> <a class="dropdown-item" href="error-404">Error 404</a></li>
							<li> <a class="dropdown-item" href="coming-soon">Coming Soon</a></li>
						</ul>
					</li>


					<!-- 게시판 Nav -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="demoMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
						<ul class="dropdown-menu" aria-labelledby="demoMenu">
							<li> <a class="dropdown-item" href="/CEMS/랭킹"><i class="bi bi-trophy-fill fa-fw me-1" style="color: orange;"></i> 랭킹</a></li>
							<li> <hr class="dropdown-divider"></li>

							<li> <a class="dropdown-item" href="/CEMS/공지사항" ><i class="bi bi-megaphone-fill fa-fw me-1" style="color: red;"></i> 공지사항</a></li>
							<li> <a class="dropdown-item" href="/CEMS/게시판" ><i class="fas fa-table text-orange fa-fw me-1"></i> 자유게시판</a></li>
							<!-- <li> <a class="dropdown-item" href="#"><i class="bi bi-question-square-fill fa-fw me-1"></i> FAQ</a></li> -->
							<!-- <li> <a class="dropdown-item" href="index-3">Home Academy</a></li>
							<li> <a class="dropdown-item" href="index-4">Home Course</a></li>
							<li> <a class="dropdown-item" href="index-5">Home University</a></li>
							<li> <a class="dropdown-item" href="index-6">Home Kindergarten</a></li>
							<li> <a class="dropdown-item" href="index-7">Home Landing</a></li>
							<li> <a class="dropdown-item" href="index-8">Home Tutor</a></li>
							<li> <a class="dropdown-item" href="index-9">Home School</a><li>
							<li> <a class="dropdown-item" href="index-10">Home Abroad</a></li>
							<li> <a class="dropdown-item" href="index-11">Home Workshop<span class="badge bg-success ms-2 smaller">New</span></a></li> -->
						</ul>
					</li>

					<!-- About Us Nav -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="demoMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">About Us</a>
						<ul class="dropdown-menu" aria-labelledby="demoMenu">
							<li> <a class="dropdown-item" href="about"><i class="bi bi-people-fill fa-fw me-1"></i> C.E.M.S</a></li>
							<!-- <li> <a class="dropdown-item" href="#"><i class="bi bi-telephone-fill fa-fw me-1"></i> Contact Us</a></li> -->
							<li id="admin-dashboard"> <a class="dropdown-item" href="admin"><i class="bi bi-telephone-fill fa-fw me-1"></i> ADMIN Dashboard</a></li>
							
							<!-- <li> <a class="dropdown-item" href="index-3">Home Academy</a></li>
							<li> <a class="dropdown-item" href="index-4">Home Course</a></li>
							<li> <a class="dropdown-item" href="index-5">Home University</a></li>
							<li> <a class="dropdown-item" href="index-6">Home Kindergarten</a></li>
							<li> <a class="dropdown-item" href="index-7">Home Landing</a></li>
							<li> <a class="dropdown-item" href="index-8">Home Tutor</a></li>
							<li> <a class="dropdown-item" href="index-9">Home School</a><li>
							<li> <a class="dropdown-item" href="index-10">Home Abroad</a></li>
							<li> <a class="dropdown-item" href="index-11">Home Workshop<span class="badge bg-success ms-2 smaller">New</span></a></li> -->
						</ul>
					</li>

					<!-- Nav item 3 Account -->
					<li class="nav-item dropdown" style="display: none;">
						<a class="nav-link dropdown-toggle" href="#" id="accounntMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Accounts</a>
						<ul class="dropdown-menu" aria-labelledby="accounntMenu">
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend" >
								<a class="dropdown-item dropdown-toggle" href="#"><i class="fas fa-user-tie fa-fw me-1"></i>Instructor</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="instructor-dashboard"><i class="bi bi-grid-fill fa-fw me-1"></i>Dashboard</a> </li>
									<li> <a class="dropdown-item" href="instructor-manage-course"><i class="bi bi-basket-fill fa-fw me-1"></i>Courses</a> </li>
									<li> <a class="dropdown-item" href="instructor-create-course"><i class="bi bi-file-earmark-plus-fill fa-fw me-1"></i>Create Course</a> </li>
									<li> <a class="dropdown-item" href="course-added"><i class="bi bi-file-check-fill fa-fw me-1"></i>Course Added</a> </li>
									<li> <a class="dropdown-item" href="instructor-quiz"><i class="bi bi-question-diamond fa-fw me-1"></i>Quiz</a> </li>
									<li> <a class="dropdown-item" href="instructor-earning"><i class="fas fa-chart-line fa-fw me-1"></i>Earnings</a> </li>
									<li> <a class="dropdown-item" href="instructor-studentlist"><i class="fas fa-user-graduate fa-fw me-1"></i>Students</a> </li>
									<li> <a class="dropdown-item" href="instructor-order"><i class="bi bi-cart-check-fill fa-fw me-1"></i>Orders</a> </li>
									<li> <a class="dropdown-item" href="instructor-review"><i class="bi bi-star-fill fa-fw me-1"></i>Reviews</a> </li>
									<li> <a class="dropdown-item" href="instructor-payout"><i class="fas fa-wallet fa-fw me-1"></i>Payout</a> </li>
								</ul>
							</li>
							
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item dropdown-toggle" href="#"><i class="fas fa-user-graduate fa-fw me-1"></i>Student</a>
								<ul class="dropdown-menu dropdown-menu-start" data-bs-popper="none">
									<li> <a class="dropdown-item" href="student-dashboard"><i class="bi bi-grid-fill fa-fw me-1"></i>Dashboard</a> </li>
									<li> <a class="dropdown-item" href="student-subscription"><i class="bi bi-card-checklist fa-fw me-1"></i>My Subscriptions</a> </li>
									<li> <a class="dropdown-item" href="student-course-list"><i class="bi bi-basket-fill fa-fw me-1"></i>Courses</a> </li>
									<li> <a class="dropdown-item" href="student-course-resume"><i class="far fa-fw fa-file-alt me-1"></i>Course Resume</a> </li>
									<li> <a class="dropdown-item" href="student-quiz"><i class="bi bi-question-diamond fa-fw me-1"></i>Quiz </a> </li>
									<li> <a class="dropdown-item" href="student-payment-info"><i class="bi bi-credit-card-2-front-fill fa-fw me-1"></i>Payment Info</a> </li>
									<li> <a class="dropdown-item" href="student-bookmark"><i class="fas bi-cart-check-fill fa-fw me-1"></i>Wishlist</a> </li>
								</ul>
							</li>
							
							<li> <a class="dropdown-item" href="admin-dashboard"><i class="fas fa-user-cog fa-fw me-1"></i>Admin</a> </li>
							<li> <hr class="dropdown-divider"></li>
							<li> <a class="dropdown-item" href="instructor-edit-profile"><i class="fas fa-fw fa-edit me-1"></i>Edit Profile</a> </li>
							<li> <a class="dropdown-item" href="instructor-setting"><i class="fas fa-fw fa-cog me-1"></i>Settings</a> </li>
							<li> <a class="dropdown-item" href="instructor-delete-account"><i class="fas fa-fw fa-trash-alt me-1"></i>Delete Profile</a> </li>
							
							<li> <hr class="dropdown-divider"></li>
							<!-- Dropdown Level -->
							
						</ul>
					</li>
					

					<!-- Nav item 4 Megamenu-->
					<li class="nav-item dropdown dropdown-fullwidth" style="display: none;">
						<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SiteMap</a>
						<div class="dropdown-menu dropdown-menu-end" data-bs-popper="none">
							<div class="row p-4 g-4">
								<!-- Dropdown column item -->
								<div class="col-xl-6 col-xxl-3">
									<h6 class="mb-0">Get started</h6>
									<hr>
									<ul class="list-unstyled">
										<li> <a class="dropdown-item" href="#">Market research</a> </li>
										<li> <a class="dropdown-item" href="#">Advertising</a> </li>
										<li> <a class="dropdown-item" href="#">Consumer behavior</a> </li>
										<li> <a class="dropdown-item" href="#">Digital marketing</a> </li>
										<li> <a class="dropdown-item" href="#">Marketing ethics</a> </li>
										<li> <a class="dropdown-item" href="#">Social media marketing</a> </li>
										<li> <a class="dropdown-item" href="#">Public relations</a> </li>
										<li> <a class="dropdown-item" href="#">Advertising</a> </li>
										<li> <a class="dropdown-item" href="#">Decision science</a> </li>
										<li> <a class="dropdown-item" href="#">SEO</a> </li>
										<li> <a class="dropdown-item" href="#">Business marketing</a> </li>
									</ul>
								</div>
								
								<!-- Dropdown column item -->
								<div class="col-xl-6 col-xxl-3">
									<h6 class="mb-0">Degree</h6>
									<hr>
									<!-- Dropdown item -->
									<div class="mb-2 position-relative bg-primary-soft-hover rounded-2 transition-base p-3">
										<a class="stretched-link h6 mb-0" href="#">Contact management</a>
										<p class="mb-0 small text-truncate-2">Speedily say has suitable disposal add boy. On forth doubt miles of child.</p>
									</div>
									<!-- Dropdown item -->
									<div class="mb-2 position-relative bg-primary-soft-hover rounded-2 transition-base p-3">
										<a class="stretched-link h6 mb-0" href="#">Sales pipeline</a>
										<p class="mb-0 small text-truncate-2">Speedily say has suitable disposal add boy. On forth doubt miles of child.</p>
									</div>
									<!-- Dropdown item -->
									<div class="mb-2 position-relative bg-primary-soft-hover rounded-2 transition-base p-3">
										<a class="stretched-link h6 mb-0" href="#">Security & Permission</a>
										<p class="mb-0 small text-truncate-2">Speedily say has suitable disposal add boy. On forth doubt miles of child.</p>
									</div>
								</div>
								
								<!-- Dropdown column item -->
								<div class="col-xl-6 col-xxl-3">
									<h6 class="mb-0"></h6>
									<hr>
									<!-- Dropdown item -->
									<div class="d-flex mb-4 position-relative">
										<h2 class="mb-0"><i class="fab fa-fw fa-google text-google-icon"></i></h2>
										<div class="ms-2">
											<a class="stretched-link h6 mb-0" href="#">Google SEO certificate</a>
											<p class="mb-0 small">No prerequisites</p>
										</div>
									</div>
									<!-- Dropdown item -->
									<div class="d-flex mb-4 position-relative">
										<h2 class="mb-0"><i class="fab fa-fw fa-linkedin-in text-linkedin"></i></h2>
										<div class="ms-2">
											<a class="stretched-link h6 mb-0" href="#">Business Development Executive(BDE)</a>
											<p class="mb-0 small">No prerequisites</p>
										</div>
									</div>
									<!-- Dropdown item -->
									<div class="d-flex mb-4 position-relative">
										<h2 class="mb-0"><i class="fab fa-fw fa-facebook text-facebook"></i></h2>
										<div class="ms-2">
											<a class="stretched-link h6 mb-0" href="#">Facebook social media marketing</a>
											<p class="mb-0 small">Expert advice</p>
										</div>
									</div>
									<!-- Dropdown item -->
									<div class="d-flex mb-4 position-relative">
										<h2 class="mb-0"><i class="fas fa-fw fa-basketball-ball text-dribbble"></i></h2>
										<div class="ms-2">
											<a class="stretched-link h6 mb-0" href="#">Creative graphics design</a>
											<p class="mb-0 small">No prerequisites</p>
										</div>
									</div>
								</div>
								
								<!-- Dropdown column item -->
								<div class="col-xl-6 col-xxl-3">
									<h6 class="mb-0">Download Eduport</h6>
									<hr>
									<!-- Image -->
									<img src="/CEMS/assets/images/element/14.svg" alt="">
									
									<!-- Download button -->
									<div class="row g-2 justify-content-center mt-3">
										<!-- Google play store button -->
										<div class="col-6 col-sm-4 col-xxl-6">
											<a href="#"> <img src="/CEMS/assets/images/client/google-play.svg" class="btn-transition" alt="google-store"> </a>
										</div>
										<!-- App store button -->
										<div class="col-6 col-sm-4 col-xxl-6">
											<a href="#"> <img src="/CEMS/assets/images/client/app-store.svg" class="btn-transition" alt="app-store"> </a>
										</div>
									</div>
								</div>
								
								<!-- Action box -->
								<div class="col-12">
									<div class="alert alert-success alert-dismissible fade show mt-2 mb-0 rounded-3" role="alert">
										<!-- Avatar -->
										<div class="avatar avatar-xs me-2">
											<img class="avatar-img rounded-circle" src="/CEMS/assets/images/avatar/09.jpg" alt="avatar">
										</div>
										<!-- Info -->
										The personality development class starts at 2:00 pm, click to <a href="#" class="alert-link">Join Now</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					

					<!-- Nav item 5 link-->
					<li class="nav-item dropdown" style="display: none;">
						<a class="nav-link" href="#" id="advanceMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-ellipsis-h"></i>
						</a>
						<ul class="dropdown-menu dropdown-menu-end min-w-auto" data-bs-popper="none">
							<li> 
								<a class="dropdown-item" href="https://support.webestica.com/" target="_blank">
									<i class="text-warning fa-fw bi bi-life-preserver me-2"></i>Support
								</a> 
							</li>
							<li> 
								<a class="dropdown-item" href="docs/index" target="_blank">
									<i class="text-danger fa-fw bi bi-card-text me-2"></i>Documentation
								</a> 
							</li>
							<li> <hr class="dropdown-divider"></li>
							<li> 
								<a class="dropdown-item" href="https://eduport.webestica.com/rtl/" target="_blank">
									<i class="text-info fa-fw bi bi-toggle-off me-2"></i>RTL demo
								</a> 
							</li>
							<li> 
								<a class="dropdown-item" href="https://themes.getbootstrap.com/store/webestica/" target="_blank">
									<i class="text-success fa-fw bi bi-cloud-download-fill me-2"></i>Buy Eduport!
								</a> 
							</li>
							<li> <hr class="dropdown-divider"></li>
							<li> 
								<a class="dropdown-item" href="docs/alerts" target="_blank">
									<i class="text-orange fa-fw bi bi-puzzle-fill me-2"></i>Components
								</a> 
							</li>
							<li> 
								<a class="dropdown-item" href="docs/snippets">
									<i class="text-purple fa-fw bi bi-stickies-fill me-2"></i>Snippets<span class="badge bg-success ms-2 smaller">New</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
				<!-- Nav Main menu END -->

			</div>
			<!-- Main navbar END -->
			<!-- Nav Search START -->
			<div class="nav my-3 my-xl-0 px-4 flex-nowrap align-items-center">
				<div class="nav-item w-100">
					<form class="position-relative">
						<input class="form-control pe-5 bg-transparent" type="search" placeholder="검색" aria-label="Search">
						<button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit">
							<i class="fas fa-search fs-6 "></i>
						</button>
					</form>
				</div>
			</div>
			<!-- Nav Search END -->
			
			<!-- Profile START -->
			<!-- Login -->
			<div id="logindiv" style="display: contents;">
				<div style="display: contents;">
					<a href="loginpage" class="px-2">
						Login
					</a>
				</div>
				/
				<!-- signup -->
				<div style="display: contents;">
					<a href="signuppage" class="px-2">
						Signup
					</a>
				</div>
			</div>

			<!-- Have User Data -->
			<div class="dropdown ms-1 ms-lg-0" id="userdiv" style="display: none;">
				<a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
					<img class="avatar-img rounded-circle" src="/CEMS/assets/images/avatar/01.jpg" alt="avatar">
				</a>
				<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
					<!-- Profile info -->
					<li class="px-3 mb-3">
						<div class="d-flex align-items-center">
							<!-- Avatar -->
							<div class="avatar me-3">
								<a href="javascript:changeIf('dashboard');"><img class="avatar-img rounded-circle shadow" src="/CEMS/assets/images/avatar/01.jpg" alt="avatar"></a>
							</div>
							<div>
								<a class="h6" href="javascript:changeIf('dashboard');">${user.user_name}</a>
								<p class="small m-0">${user.user_id}</p>
							</div>
						</div>
					</li>
					<li> <hr class="dropdown-divider"></li>
					<!-- Links -->
					<li><a class="dropdown-item" href="javascript:changeIf('editprofile');" ><i class="bi bi-person fa-fw me-2"></i>개인정보</a></li>
					<!-- <li><a class="dropdown-item" href="javascript:changeIf('setting');"><i class="bi bi-gear fa-fw me-2"></i>Account Settings</a></li> -->
					<!-- <li><a class="dropdown-item" href="#"><i class="bi bi-info-circle fa-fw me-2"></i>도움말</a></li> -->
					<li><a class="dropdown-item bg-danger-soft-hover" href="logout"><i class="bi bi-power fa-fw me-2"></i>로그아웃</a></li>
					<!-- Dark mode switch START -->
					<!-- <li>
						<div class="modeswitch-wrap" id="darkModeSwitch">
							<div class="modeswitch-item">
								<div class="modeswitch-icon"></div>
							</div>
							<span>다크 모드</span>
						</div>
					</li>  -->
					<!-- Dark mode switch END -->
				</ul>
			</div>
			<!-- Profile START -->
		</div>
	</nav>
	<!-- Logo Nav END -->
</header>
<!-- Header END -->
</body>
</html>