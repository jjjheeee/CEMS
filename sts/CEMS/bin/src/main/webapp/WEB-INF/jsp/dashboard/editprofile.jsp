<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">

	<!-- Favicon -->
	<link rel="shortcut icon" href="/CEMS/images/favicon.ico">

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
	<script>
		function checkOGPW(){
			var oldpw = $("#oldpw").val();
			var userpw = '<c:out value="${user.user_password}"/>';

			if (oldpw == userpw){
				$("#oldpwdiv").css({ //이렇게도 쓸 수 있으며 제일 낫다
					"border":"2px solid green",
					"border-radius":"5px"
				});
				$("#pwchecktext").hide()
				$("#newpw").removeAttr("disabled")
				$("#submit").removeAttr("disabled")

				
			}else{
				$("#newpw").attr("disabled", "disabled")
				$("#oldpwdiv").css({ //이렇게도 쓸 수 있으며 제일 낫다
					"border":"2px solid red",
					"border-radius":"5px"
				});
				$("#pwchecktext").show()
				$("#submit").attr("disabled", "disabled")
			}
		}
	</script>

<!-- Main content START -->
			<div class="col-xl-12">
				<!-- Edit profile START -->
				<div class="card bg-transparent border rounded-3">
					<!-- Card header -->
					<div class="card-header bg-transparent border-bottom">
						<h3 class="card-header-title mb-0">개인정보 변경</h3>
					</div>
					<!-- Card body START -->
					<div class="card-body">
						<!-- Form -->
						<form class="row g-4">

							<!-- Profile picture -->
							<div class="col-12 justify-content-center align-items-center">
								<label class="form-label">프로필 사진</label>
								<div class="d-flex align-items-center">
									<label class="position-relative me-4" for="uploadfile-1" title="Replace this pic">
										<!-- Avatar place holder -->
										<span class="avatar avatar-xl">
											<img id="uploadfile-1-preview" class="avatar-img rounded-circle border border-white border-3 shadow" src="/CEMS/assets/images/avatar/07.jpg" alt="">
										</span>
										<!-- Remove btn -->
										<button type="button" class="uploadremove"><i class="bi bi-x text-white"></i></button>
									</label>
									<!-- Upload button -->
									<label class="btn btn-primary-soft mb-0" for="uploadfile-1">변경</label>
									<input id="uploadfile-1" class="form-control d-none" type="file">
								</div>
							</div>
							<!-- Email id -->
							<div class="col-md-6">
								<label class="form-label">이메일</label>
								<input class="form-control" type="email" value="<c:out value='${user.user_id}'/>"  placeholder="Email" disabled="disabled">
							</div>
							
							<!-- user name -->
							<div class="col-6">
								<label class="form-label">이름</label>
								<div class="input-group">
									<input type="text" class="form-control" value="<c:out value='${user.user_name}'/>" placeholder="이름">
								</div>
							</div>

							<!-- Username -->
							<div class="col-md-6">
								<label class="form-label">별명</label>
								<div class="input-group">
									<input type="text" class="form-control" value="<c:out value='${user.user_nickname}'/>"/>
								</div>
							</div>

							<!-- Location -->
							<div class="col-md-6">
								<label class="form-label">국적</label>
								<input class="form-control" type="text" value="<c:out value='${user.user_country}'/>" disabled="disabled">
							</div>
							
							<!-- About me -->
							<!-- <div class="col-12">
								<label class="form-label">About me</label>
								<textarea class="form-control" rows="3">I’ve found a way to get paid for my favorite hobby, and do so while following my dream of traveling the world.</textarea>
								<div class="form-text">Brief description for your profile.</div> 
							</div> -->

							<!-- Education -->
							<!-- <div class="col-12">
								<label class="form-label">Education</label>
								<input class="form-control mb-2" type="text" value="Bachelor in Computer Graphics">
								<input class="form-control mb-2" type="text" value="Masters in Computer Graphics">
								<button class="btn btn-sm btn-light mb-0"><i class="bi bi-plus me-1"></i>Add more</button>
							</div> -->

							<!-- Save button -->
							<div class="d-sm-flex justify-content-end">
								<button type="button" class="btn btn-primary mb-0">변경</button>
							</div>
						</form>
					</div>
					<!-- Card body END -->
				</div>
				<!-- Edit profile END -->
				
					<!-- Password change START -->
					<div class="col-lg-12 mt-4 mx-auto pe-3">
						<div class="card border bg-transparent rounded-3">
							<!-- Card header -->
							<div class="card-header bg-transparent border-bottom">
								<h5 class="card-header-title mb-0">비밀번호 변경</h5>
							</div>
							<!-- Card body START -->
							<div class="card-body">

								<!-- Current password -->
								<!-- Form Start -->
								<form action="/CEMS/update/updatepw" target="_parent" method="post">
									<div class="mb-3">
										<label class="form-label">현재 비밀번호</label>
										<div class="input-group" id="oldpwdiv">
											<input class="form-control" type="password" id="oldpw" name="user_password" onchange="checkOGPW()" autocomplete="new-password">
											<span class="input-group-text p-0 bg-transparent" >
												<i class="far fa-eye cursor-pointer p-2 w-40px"></i>
											</span>
										</div>
										<label for="" style="color: red !important; display: none; float: none;" id="pwchecktext" >기존 비밀번호와 같지 않습니다.</label>
									</div>
									<!-- New password -->
									<div class="mb-3" >
										<label class="form-label">새로운 비밀번호</label>
										<div class="input-group" id="newpwdiv">
											<input class="form-control" type="password" onchange="checkPW()" id='newpw' name="newpw" disabled>
											<span class="input-group-text p-0 bg-transparent" >
												<i class="far fa-eye cursor-pointer p-2 w-40px"></i>
											</span>
										</div>
										<label for="" style="color: red !important; display: none; float: none;" id="pwregextext">8자이상  영문 대 소문자, 숫자, 특수문자를 사용하세요.</label>
									</div>
									<!-- Confirm password -->
									<div>
										<label class="form-label">새로운 비밀번호 확인</label>
										<div class="input-group" id="checkdiv">
											<input class="form-control" type="password" id="checkpw" disabled onchange="checkPW()">
											<span class="input-group-text p-0 bg-transparent" >
												<i class="far fa-eye cursor-pointer p-2 w-40px"></i>
											</span>
										</div>
									</div>
									<input type="text" style="display: none;" name="user_id" value="<c:out value='${user.user_id}'/>"/>
									<!-- Button -->
									<div class="d-flex justify-content-end mt-4">
										<button type="submit" id="submit" class="btn btn-primary mb-0" disabled>비밀번호 변경</button>
									</div>
								</form>
								<!-- Form End -->
							</div>
							<!-- Card body END -->
						</div>
					</div>
					<!-- Password change end -->
				</div>
			</div>
		</div>
			<!-- Main content END -->
			

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/CEMS/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="/CEMS/assets/vendor/choices/js/choices.min.js"></script>
<script src="/CEMS/assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>
<script src="/CEMS/assets/vendor/aos/aos.js"></script>
<script src="/CEMS/assets/js/passwordC.js"></script>
<script src="/CEMS/assets/js/functions.js"></script>