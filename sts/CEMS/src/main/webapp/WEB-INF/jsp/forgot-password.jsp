<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CEMS-Topik : 비밀번호 찾기</title>

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

	<!-- JQuery -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>


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
						<!-- SVG Image -->
						<img src="/CEMS/assets/images/element/02.svg" class="mt-5" alt="">
					</div>
				</div>
				<!-- Right -->
				<div class="col-12 col-lg-6 m-auto">
					<div class="row my-5">
						<div class="col-sm-10 col-xl-9 m-auto">
              <!-- Title -->
							<span class="mb-0 fs-1">🤔</span>
							<h1 class="fs-3 my-3">비밀번호를 잊어버리셨나요?</h1>
							<h6 class="fw-light mb-4">찾으시려는 비밀번호의 전자우편을 입력하세요.</h6>
							<!-- Form START -->
							<form action="/CEMS/forgotpw" method="post">
								<!-- Email -->
								<div class="mb-4">
									<label for="exampleInputEmail1" class="form-label">전자우편 주소 <span style="color: red !important; display: inline; float: none;"> *</span></label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill"></i></span>
										<input type="email" class="form-control border-0 bg-light rounded-end ps-1" placeholder="전자우편" name="user_id" id="userid">
										<button class="btn btn-primary mb-0" type="button" onclick="checkId();"><i class="bi bi-send-check-fill"></i></button>
									</div>
								</div>	
								
								<div >
									<div class="id_ok alert alert-danger align-items-center w-100"  style="display: none;" role="alert">
										<i class="bi bi-person-x-fill fa-fw me-1"></i>
										존재하지 않는 아이디입니다.
									</div>
									<div class="id_already alert alert-success align-items-center w-100"  style="display: none;" role="alert">
										<i class="bi bi-person-check-fill fa-fw me-1"></i>
										변경하실 비밀번호를 입력하세요.
									</div>
								</div>

								<!-- check -->
								<div class="mb-4" style="display: none ;">
									<label for="exampleInputEmail1" class="form-label">Check Code *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-check-fill"></i></span>
										<input type="email" class="form-control border-0 bg-light rounded-end ps-1" placeholder="Code" id="exampleInputEmail1">
									</div>
								</div>
								
								<!-- Password -->
								<div class="mb-2" style="display:none" id="pwbox">
									<label for="inputPassword5" class="form-label">새로운 비밀번호 </label><span style="color: red !important; display: inline; float: none;"> *</span>      
									<div class="input-group input-group-lg" id="pwdiv">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock" id="pwregex"></i><i class="bi bi-x-lg " id="pwregexc" style="display: none;"></i></span>
										<input type="password" class="form-control border-0 bg-light rounded-end ps-1" placeholder="*********" oninput="checkPW()" id="userpw" name="newpw" required>
									</div>
									<label for="" style="color: red !important; display: none; float: none;" id="pwregextext">8자이상  영문 대 소문자, 숫자, 특수문자를 사용하세요.</label>
								</div>
								<!-- Confirm Password -->
								<div class="mt-4 mb-4" style="display:none" id="conpwbox">
									<label for="checkpw" class="form-label">새로운 비밀번호 확인</label><span style="color: red !important; display: inline; float: none;"> *</span>      
									<div class="input-group input-group-lg" id="correctdiv">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i id="pwnotcorrect" class="fas fa-lock"></i><i class="bi bi-x-lg" id="pwuncorrect"></i><i class="bi bi-check-all" id="pwcorrect"></i></span>
										<input type="password" class="form-control border-0 bg-light rounded-end ps-1" placeholder="*********" id="checkpw" required>
									</div>
								</div>
								
								<!-- Button -->
								<div class="align-items-center">
									<div class="d-grid">
										<button class="btn btn-primary mb-0" type="submit" id="submit" disabled="disabled">비밀번호 변경</button>
									</div>
								</div>	
							</form>
							<!-- Form END -->
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

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>

<!-- idcheck ajax -->
<script src="assets/js/ajax.js"></script>

</body>
</html>