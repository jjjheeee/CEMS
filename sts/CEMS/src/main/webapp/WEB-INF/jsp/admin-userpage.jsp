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

			function ban_toggle(id, nickname){
				const arr = id.split("_");
				var type = arr[0];
				var user_id = $("#user_id_"+arr[3]).html();

				$.ajax({
					url:'/CEMS/userBan', //Controller에서 요청 받을 주소
					type:'post', //POST 방식으로 전달
					data: {"user_ban" : type, "user_id" : user_id},
					success:function(cnt){
						if(cnt == 1){
							alert(nickname+"님이 "+type+"벤 되셨습니다.")
						}else if (cnt == 0){
							alert("어? 너 벤 안되네?")
						}
						location.reload();
					},
					error:function(){
						alert("에러입니다");
					}
				});
			}
		</script>
	</head>

<body>


<!-- **************** MAIN CONTENT START **************** -->
<main>
		
<!-- Sidebar START -->
<nav class="navbar sidebar navbar-expand-xl navbar-dark bg-dark">

	<!-- Navbar brand for xl START -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand" href="/CEMS/home">
			<!-- <img class="navbar-brand-item" src="/CEMS/assets/images/logo-light.svg" alt=""> -->
			CEMS - Topik
		</a>
	</div>
	<!-- Navbar brand for xl END -->
	
	<div class="offcanvas offcanvas-start flex-row custFom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column bg-dark">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				
				<!-- Menu item 1 -->
				<li class="nav-item"><a href="/CEMS/admin" class="nav-link"><i class="bi bi-house fa-fw me-2"></i>관리자 페이지</a></li>
				
				<!-- Title -->
				<li class="nav-item ms-2 my-2">Pages</li>

				<!-- Menu item 3 -->
				<li class="nav-item"> <a class="nav-link active" href="/CEMS/admin/admin-userpage"><i class="fas fa-user-graduate fa-fw me-2"></i>회원 관리</a></li>

				<!-- Menu item 5 -->
				<!-- <li class="nav-item"> <a class="nav-link" href="#"><i class="far fa-comment-dots fa-fw me-2"></i>Reviews</a></li> -->

				<!-- Menu item 7 -->
				<!-- <li class="nav-item"> <a class="nav-link" href="#"><i class="fas fa-user-cog fa-fw me-2"></i>Admin Settings</a></li> -->

		</div>
	</div>
</nav>

<!-- Page content START -->
<div class="page-content">
	
	<!-- Top bar START -->
	<nav class="navbar top-bar navbar-light border-bottom py-0 py-xl-3">
		<div class="container-fluid p-0">
			<div class="d-flex align-items-center w-100">

				<!-- Logo START -->
				<div class="d-flex align-items-center d-xl-none">
					<a class="navbar-brand" href="/CEMS/home">
						<img class="light-mode-item navbar-brand-item h-1.875rem" src="assets/images/logo-mobile.svg" alt="">
						<img class="dark-mode-item navbar-brand-item h-1.875rem" src="assets/images/logo-mobile-light.svg" alt="">
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
							</a>

							<!-- Profile dropdown START -->
							<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
								<!-- Profile info -->
								<li class="px-3">
									<div class="d-flex align-items-center">
										<!-- Avatar -->
										<div class="avatar me-3 mb-3">
										</div>
										<div>
											<a class="h6 mt-2 mt-sm-0" href="#">Lori Ferguson</a>
											<p class="small m-0">example@gmail.com</p>
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
		<div class="row mb-3">
			<div class="col-12">
				<h1 class="h3 mb-2 mb-sm-0">회원 관리</h1>
			</div>
		</div>

		<!-- Main card START -->
		<div class="card bg-transparent border">

			<!-- Card header START -->
			<div class="card-header bg-light border-bottom">
				<!-- Search and select START -->
				<div class="row g-3 align-items-center justify-content-between">

					<!-- Search bar -->
					<div class="col-md-8">
						<form class="rounded position-relative">
							<input class="form-control bg-body" type="search" placeholder="검색" aria-label="Search">
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
								<option>이름순</option>
							</select>
						</form>
					</div>
				</div>
				<!-- Search and select END -->
			</div>
			<!-- Card header END -->

			<!-- Card body START -->
			<div class="card-body">
				<!-- Instructor request table START -->
				<div class="table-responsive border-0">
					<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">

						<!-- Table head -->
						<thead>
							<tr class="text-center">
								<th scope="col" class="border-0 rounded-start">아이디</th>
								<th scope="col" class="border-0">닉네임</th>
								<th scope="col" class="border-0">이름</th>
								<th scope="col" class="border-0">코스</th>
								<th scope="col" class="border-0">문제수</th>
								<th scope="col" class="border-0">기간 (가입일)</th>
								<th scope="col" class="border-0 rounded-end"></th>
							</tr>
						</thead>

						<!-- Table body START -->
						<c:forEach items="${userlist}" var="U" varStatus="status">
						<tbody>
							<!-- Table row -->
								<script>
									$(document).ready(function(){
										var ban_check ="${U.user_ban}_ban_btn_${status.index}";
										
										$("#"+ban_check).addClass('btn-danger');
									})

								</script>


								<tr class="text-center">
									<!-- Table data -->
									<td>
										<h6 class="mb-0" id="user_id_${status.index}">${U.user_id}</h6>
									</td>	
									
									<!-- Table data -->
									<td class="text-center text-sm-start">
										<h6 class="mb-0">${U.user_nickname}</h6>
									</td>
									
									<!-- Table data -->
									<td>${U.user_name}</td>
									
									<!-- Table data -->
									<td>${U.user_type}</td>
									<td>${U.user_cnt}</td>
									<td>D+${U.day} (${U.user_in_date})</td>
									<td>
										
										<button type="button" onclick="ban_toggle(this.id,'${U.user_nickname}');" id="B_ban_btn_${status.index}" class="btn border me-1 mb-0" data-bs-toggle="button">B</button>
										<button type="button" onclick="ban_toggle(this.id,'${U.user_nickname}');" id="C_ban_btn_${status.index}" class="btn border me-1 mb-0" data-bs-toggle="button">C</button>
										<!-- <button type="button" onclick="ban_toggle(this.id);" id="Q_ban_btn_${status.index}" class="btn border me-1 mb-0" data-bs-toggle="button">Q</button> -->
										<!-- <button type="button" onclick="ban_toggle(this.id);" id="BC_ban_btn_${status.index}" class="btn border me-1 mb-0" data-bs-toggle="button">BC</button> -->
										<button type="button" onclick="ban_toggle(this.id,'${U.user_nickname}');" id="A_ban_btn_${status.index}" class="btn border me-1 mb-0" data-bs-toggle="button">A</button>

										<button type="button" onclick="ban_toggle(this.id,'${U.user_nickname}');" id="0_ban_btn_${status.index}" class="btn btn-success me-1 mb-0" data-bs-toggle="button">X</button>
										
										<a class="btn btn-primary-soft me-1 mb-0" data-bs-toggle="modal" data-bs-target="#appDetail${status.count}">View</a>
									</td>
								</tr>
							</tbody>
							<!-- Table body END -->
						</c:forEach>
						</table>
				</div>
				<!-- Instructor request table END -->
			</div>
			<!-- Card body END -->

			<!-- Card footer START -->
			<div class="card-footer bg-transparent pt-0">
				<!-- Pagination START -->
				<div class="d-sm-flex justify-content-center align-items-sm-center">
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
		<!-- Main card END -->
	</div>
	<!-- Page main content END -->

</div>
<!-- Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->
<c:forEach items="${userlist}" var="U" varStatus="status">

	<!-- Modal START -->
	<div class="modal fade" id="appDetail${status.count}" tabindex="-1" aria-labelledby="appDetaillabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				
				<!-- Modal header -->
				<div class="modal-header bg-dark">
					<h5 class="modal-title text-white" id="appDetaillabel">유저 상세보기</h5>
					<button type="button" class="btn btn-sm btn-light mb-0" data-bs-dismiss="modal" aria-label="Close"><i class="bi bi-x-lg"></i></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body p-5">
					<!-- Name -->
					<h6 class="small">User DTO: </h6>
					<h6 class="mb-3">${U}</h6>
					<table class="table table-dark-gray align-middle table-hover">
						<h4>게시물</h4>

						<thead>
							<tr class="text-center">
								<th scope="col" class="border-0 rounded-start">게시물</th>
								<th scope="col" class="border-0">작성일</th>
								<th scope="col" class="border-0">조회수</th>
								<th scope="col" class="border-0 rounded-end"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardlist}" var="B" varStatus="num">
								<c:if test="${B.user_id eq U.user_id}"> 
								<tr class="text-center">
									<td><a href="/CEMS/board_${B.board_id}">${B.title}</a></td>
									<td>${B.write_date}</td>
									<td>${B.viewcnt}</td>
									<td><a href="/CEMS/board_delete${B.board_id}" class="btn btn-danger">X</a></td>
								</tr>	
								</c:if>
							</c:forEach>
						</tbody>
					</table>

					<!-- <table class="table table-dark-gray align-middle p-4 mb-0 table-hover mb-3">
						<h5>댓글</h5>
						<thead>
							<tr class="text-center">
								<th scope="col" class="col-1 border-0 rounded-start">#</th>
								<th scope="col" class="border-0">댓글</th>
								<th scope="col" class="border-0 rounded-end"></th>
							</tr>
						</thead>
					</table> -->
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn my-0" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>   
	<!-- Modal END -->
</c:forEach>
<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/CEMS/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="/CEMS/assets/vendor/overlay-scrollbar/js/overlayscrollbars.min.js"></script>

<!-- Template Functions -->
<script src="/CEMS/assets/js/functions.js"></script>

</body>
</html>
