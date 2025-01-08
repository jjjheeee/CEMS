<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>
		CEMS-Topik : 로그인
	</title>

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

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="/CEMS/assets/css/style.css">

	<!-- Template Functions -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="assets/js/functions.js"></script>

	
</head>

<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
	<section class="p-0 d-flex align-items-center position-relative overflow-hidden">
	
		<div class="container-fluid">
			<div class="row">
				<!-- left -->
				<div class="col-12 col-lg-6 d-md-flex align-items-center justify-content-center bg-primary bg-opacity-10 vh-lg-100">
					<div class="p-3 p-lg-5">
						<!-- Title -->
						<div class="text-center">
							<h2 class="fw-bold">환영합니다. CEMS-Topik입니다.</h2>
							<p class="mb-0 h6 fw-light">오늘은 어떤 것을 공부해 볼까요?</p>
						</div>
						<img src="/CEMS/assets/images/element/02.svg" class="mt-5" alt="">
					</div>
				</div>

				<!-- Right -->
				<div class="col-12 col-lg-6 m-auto">
					<div class="row my-5">
						<div class="col-sm-10 col-xl-9 m-auto">
							<!-- Title -->
							<span class="mb-0 fs-1">👋</span>
							<h1 class="fs-3 my-3">로그인</h1>

							<!-- Form START -->
							<form class="p-5" action="login" method="post" style="border: 1px solid #dde0e3; border-radius: 5px;">
								<!-- Email -->
								<div class="mb-4">
									<label for="userid" class="form-label">전자우편 </label><span style="color: red !important; display: inline; float: none;"> *</span>  
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill"></i></span>
										<input type="email" class="form-control border-0 bg-light rounded-end ps-1" placeholder="전자우편" id="userid" name="user_id">
									</div>
								</div>
								<!-- Password -->
								<div class="mb-4">
									<label for="userpw" class="form-label">비밀번호 </label><span style="color: red !important; display: inline; float: none;"> *</span>  
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="password" class="form-control border-0 bg-light rounded-end ps-1" placeholder="비밀번호" id="userpw" name="user_password">
									</div>
									<div id="passwordHelpBlock" class="form-text">
										8자이상  영문 대 소문자, 숫자, 특수문자를 사용하세요.
										<span style="color: red !important; display: inline; float: none;"> *</span>  
									</div>
								</div>
								<!-- Check box -->
								<div class="mb-4 d-flex justify-content-between mb-4">
									<div class="form-text" id="loginCheckdiv" style="color: red;">
										<!-- <input type="checkbox" class="form-check-input" id="exampleCheck1">
										<label class="form-check-label" for="exampleCheck1">Remember me</label> -->
										<c:forTokens  var="e" items="${error}" delims="/" varStatus="num">
											<div>
												${e}
											</div>
										</c:forTokens>
									</div>
									<div class="text-primary-hover">
										<a href="find" class="text-secondary">
											<u>비밀번호를 잊어버리셨나요?</u>
										</a>
									</div>
								</div>
								<!-- Button -->
								<div class="align-items-center mt-0">
									<div class="d-grid">
										<button class="btn btn-primary mb-0" type="submit" id="submit">들어가기</button>
									</div>
								</div>
							</form>
							<!-- Form END -->

							<!-- Sign up link -->
							<div class="mt-4 text-center">
								<span>아직 계정이 없으신가요? 여기서 <a href="signup">회원가입</a> 해주세요.</span>
							</div>
							
							<!-- Social buttons and divider -->
							<!-- <div class="row">
								<div class="position-relative my-4">
									<hr>
									<p class="small position-absolute top-50 start-50 translate-middle bg-body px-5">Or</p>
								</div>

								<div class="col-xxl-6 d-grid">
									<a href="#" class="btn bg-google mb-2 mb-xxl-0"><i class="fab fa-fw fa-google text-white me-2"></i>Login with Google</a>
								</div>
								<div class="col-xxl-6 d-grid">
									<a href="#" class="btn bg-facebook mb-0"><i class="fab fa-fw fa-facebook-f me-2"></i>Login with Facebook</a>
								</div>
							</div> -->
						</div>
					</div> <!-- Row END -->
				</div>
			</div> <!-- Row END -->
		</div>
	</section>
</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/CEMS/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>