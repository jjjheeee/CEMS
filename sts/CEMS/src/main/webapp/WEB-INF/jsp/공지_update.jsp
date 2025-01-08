<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Eduport - LMS, Education and Course Theme</title>

	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">

	<!-- Favicon -->
	<link rel="shortcut icon" href="assets/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="assets/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/choices/css/choices.min.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/aos/aos.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/glightbox/css/glightbox.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/quill/css/quill.snow.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/stepper/css/bs-stepper.min.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="assets/css/style.css">


	<script>
		function updateBoard(){
			$.ajax({
				url : './update${modify.board_id}',
				type : 'POST',
				data : {
					board_id : $("#board_id").val(),
					title : $("#title").val(),
					content : $("#content").val()

				},
				success:function(cnt){
					if(cnt == 0 ){
						alert('잘못된 접근입니다.');
						location.reload();
					}
					alert('수정이 완료되었습니다.');
					history.back();
					location.href = document.referrer;
					location.href(); 
				}
			})
		};


	</script>
</head>

<body>

<%@ include file="./header.jsp" %>

<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- =======================
Page Banner START -->
<section class="py-0 bg-blue h-100px align-items-center d-flex h-200px rounded-0" style="background:url(assets/images/pattern/04.png) no-repeat center center; background-size:cover;">
	<!-- Main banner background image -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Title -->
				<h1 class="text-white ms-2">게시물 수정</h1>
			</div>
		</div>
	</div>
</section>
<!-- =======================
Page Banner END -->

<!-- =======================
Steps START -->
<section>
	<div class="container">
		<div class="row g-4">
			<!-- title -->
			<!-- <form action="/CEMS/update${modify.board_id}" method="post"> -->
				<div class="col-12 mb-5">
					<label class="form-label"><h5>제목</h5></label>
					<input class="form-control" type="text" id="title" name="title" value="${modify.title}">
				</div>
				<label class="form-label"><h5>내용</h5></label>
				<textarea class="form-control" rows="20" id="content" name="content">${modify.content}</textarea>
				<div class="mt-3 text-end">
					<a href="javascript:history.back();" class="btn btn-danger">취소</a>
					<a onclick="updateBoard()" class="btn btn-primary">수정</a>
				</div>
			<!-- </form> -->
		</div>
	</div>
</section>
<!-- =======================
Steps END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- =======================
Footer START -->
<!-- Footer Include -->
<%@ include file="./footer.jsp" %>
<!-- =======================
Footer END -->


<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!— Vendors —>
<script src="assets/vendor/choices/js/choices.min.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.js"></script>
<script src="assets/vendor/quill/js/quill.min.js"></script>
<script src="assets/vendor/stepper/js/bs-stepper.min.js"></script>

<!— Template Functions —>
<script src="assets/js/functions.js"></script>

</body>
</html>