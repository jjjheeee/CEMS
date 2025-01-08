<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
				$("#submit").removeAttr("disabled")

				
			}else{
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
				<!-- Title and select START -->
				<div class="card border bg-transparent rounded-3 mb-0">
					<!-- Card header -->
					<div class="card-header bg-transparent border-bottom">
						<h3 class="card-header-title mb-0">회원 탈퇴</h3>
					</div>
					<!-- Card body -->
					<div class="card-body col-12">
						<h6>탈퇴 할꺼야 ,,?</h6>
						<ul>
							<li>회원 탈퇴시 저장된 학습데이터는 모두 삭제됩니다</li>
							<li>회원 탈퇴시 <span style="color: red;"><strong>서비스를 더 이상 이용하실 수 없습니다.</strong></span></li>
							<li>회원 탈퇴시 <span style="color: red;"><strong>사용하셨던 전자우편으로 재가입이 불가능</strong></span> 합니다.</li>
						</ul>
						<form action="/CEMS/deleteuser" target="_parent" method="post">
							<div class="form-check form-check-md my-4">
								<input class="form-check-input" type="checkbox" onclick="showhide()" value="" id="deleteaccountCheck" required/>
								<label class="form-check-label" for="deleteaccountCheck" >동의합니다</label>
								<script>
									function showhide(){
										if ($('#deletebox').css('display')=='none'){
											$('#deletebox').show();
										}else{
											$('#deletebox').hide();
										}
									}
								</script>
							</div>
							<div id="deletebox" style="display:none;">
								<h6>회원 탈퇴를 원하시면 비밀번호를 입력하세요</h6>
								<div id="oldpwdiv" class="col-10">
									<input type="password" oninput="checkOGPW()" class="form-control border-0 bg-light ps-1 ps-3" placeholder="*********" id="oldpw" name="userpw" required>
								</div>
								<label for="" style="color: red !important; display: none; float: none;" id="pwchecktext" >기존 비밀번호와 같지 않습니다.</label>
								<div class="mt-3">
									<button type="submit" id="submit" class="btn btn-danger mb-0" disabled="disabled">응 할꺼야!</button>
								</div>
							</div>
						</form>
						<div id="pw-faile" class="pw-faile alert alert-danger align-items-center w-100" style="display:none;" role="alert">
							<i class="bi bi-person-x-fill fa-fw me-1"></i>
							잘못된 비밀번호입니다.
						</div>
					</div>
				</div>
				<!-- Title and select END -->
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
<script src="/CEMS/assets/js/ajax.js"></script>