<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CEMS-Topik : ${detail.board.title}</title>

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
	<link rel="stylesheet" type="text/css" href="assets/vendor/plyr/plyr.css" />

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="assets/css/style.css">

</head>

<body>

<%@ include file="./header.jsp" %>

<!-- **************** MAIN CONTENT START **************** -->
<main>

	<script type="text/javascript">
		function insert_Comment(){
			if ($("#content").val() == ''){
				alert('내용을 입력해주세요!');
				$("#content").focus();
			}else{
				$.ajax({
					url:'./insert_Comment', //Controller에서 요청 받을 주소
					type:'POST', //POST 방식으로 전달
					data: $("#insertComment").serialize(),
					success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
						location.reload();
					}
				});
			}
		};

		function insert_Recomment(id){
			if ($("#"+id+"text").val() == ''){
				alert('내용을 입력해주세요!');
				$("#"+id+"text").focus();
			}else{
				$.ajax({
					url:'./insert_Recomment', //Controller에서 요청 받을 주소
					type:'POST', //POST 방식으로 전달
					data: $("#insertRecomment"+id).serialize(),
					success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
						location.reload();
					}
				});
			}
		};

		function showReply(param_id){
			$("#"+param_id+"form").show();
		};

		function deleteBoard(){
			$.ajax({
				url:'./board_delete${detail.board.board_id}', 
				type:'POST', 
				data: {
					writer : $("#writer").val(),
					board_id : $("#board_id").val()
				},
				success:function(cnt){
					if(cnt == 0){
						alert('삭제할 수 없습니다.');
						location.reload();
					}
					alert('정상적으로 삭제되었습니다.');
					location.href = "redirect:/CEMS/게시판";
				}
			});
		};

		function deleteComment(id){
			var comment_id = id;
			$.ajax({
				url : './delete_Comment'+id,
				method : 'POST',
				data : {
					comment_id : id
				},
				success:function(cnt){
					if(cnt == 1){
						alert('댓글이 삭제되었습니다.');
						location.reload();
					}else{
						alert('삭제할 수 없습니다.');
						location.reload();
					}
				}
			})
		};

		function deleteRecomment(id){
			var recomment_id = id;
			$.ajax({
				url : './delete_Recomment'+id,
				method : 'POST',
				data : {
					recomment_id : id
				},
				success:function(cnt){
					if(cnt == 1){
						alert('댓글이 삭제되었습니다.');
						location.reload();
					}else{
						alert('삭제할 수 없습니다.');
						location.reload();
					}
				}
			});
		};

	</script>

	


<!-- =======================
Page content START -->
<section class="bg-dark align-items-center d-flex" style="background:url(/CEMS/assets/images/pattern/04.png) no-repeat center center; background-size:cover;">
	<div class="container" data-sticky-container>
		<!-- <div class="row g-4"> -->
			<!-- Main content START -->
			<div>
				<div class="row g-4 ml-3">
					<!-- Title START -->
					<div class="col-12">
						<!-- Main banner background image -->
						<div class="container">
							<div class="row">
								<div class="col-12">
									<!-- Title -->
									<h1 class="text-white"><strong>${detail.board.title}</strong></h1>
									<!-- Breadcrumb -->
									<div class="d-flex">
										<nav aria-label="breadcrumb">
											<ul class="breadcrumb list-inline mb-0">
												<li class="list-inline-item text-white fw-light h6 me-3 mb-1 mb-sm-0"><i class="far fa-clock text-danger me-2"></i>등록일 : ${detail.board.write_date}</li>
												<li class="list-inline-item text-white fw-light h6"><i class="fas fa-fw fa-edit me-1"></i>작성자 : ${detail.board.writer}</li>
											</ul>
					
										</nav>
									</div>
								</div>
							</div>
					</div>
						<!-- Title -->
						
						<!-- Content -->
					</div>
					<!-- Title END -->


				</div>
			</div>
			<!-- Main content END -->
		<!-- </div> --><!-- Row END -->
	</div>
</section>


<section class="pt-3 pt-xl-5">

	
	<div class="container" data-sticky-container>
		<!-- Main content START -->
		<div>
			<div class="row g-4 ml-3">
				<!-- FAQs START -->
				<div class="col-12 mx-auto">
					<div class="card border rounded-3">		
						<!-- Card body START -->
						<div class="card-body">
							<!-- FAQ item -->
							<div>
								<pre>${detail.board.content}</pre>
							</div>
						</div>
						<!-- Card body START -->
					</div>
				</div>
				
				<!-- FAQs END -->
				<div class="col-12 mt-2 mx-auto">
					<div class="row">	
						<div class="col-4">
						</div>
						<script>
							$(document).ready(function ready2(){
								var usernm = "<c:out value='${user.user_nickname}'/>";
								var writer = "<c:out value='${detail.board.writer}'/>";
								var admin = "admin";

								if(usernm == admin){
									$("#updatebtn").show();
									$("#deletebtn").show();
								} else if(usernm == writer){
									$("#updatebtn").show();
									$("#deletebtn").show();
								}else{
									$("#updatebtn").hide();
									$("#deletebtn").hide();
								}
							});
						</script>
						<div class="col-8 text-end">
							<a href="/CEMS/board_update${detail.board.board_id}" id="updatebtn" class="btn btn-outline-primary mt-4 ms-2">수정</a>
							<a onclick="deleteBoard();" id="deletebtn" class="btn btn-outline-danger mt-4 ms-2">삭제</a>
						</div>
					</div>
				</div>
				
				<div class="col-12 mx-auto comment">
					<div class="col-11 mx-auto">
						<h3>댓글</h3>
						<hr>
					</div>

					<!-- Comment Insert Box -->
					<div class="d-flex mb-4 col-11 mx-auto">
						<!-- Avatar -->
						<div class="avatar avatar-sm flex-shrink-0 me-2">
							<a href="#"> <img class="avatar-img rounded-circle" src="assets/images/avatar/09.jpg" alt=""> </a>
						</div>

						<form class="w-100 d-flex" id="insertComment" onclick="return false;" method="post">
							<input type="textarea" class="one form-control pe-4 bg-light" id="content" name="content" rows="1" placeholder="Add a comment..."></ㅑㅜ>
							<input type="text" id="board_id" name="board_id" style="display : none;" value="<c:out value='${detail.board.board_id}'/>" >
							<input type="text" name="user_id" style="display:none;" value="${user.user_id}">
							<button class="btn btn-primary ms-2 mb-0" type="button" id="btn_insert_comment" onclick="insert_Comment()">Post</button>
						</form>
					</div>

					<!-- Comment item START -->
					<c:forEach items="${detail.comments}" var="comment" varStatus="status">
					<div class="border p-2 p-sm-4 rounded-3 mb-4 col-10 mx-auto comment-div">
						<ul class="list-unstyled mb-0">
								<li class="comment-item">
									<div class="d-flex">
										<!-- Avatar -->
										<!-- <div class="avatar avatar-sm flex-shrink-0">
											<a href="#"><img class="avatar-img rounded-circle" src="assets/images/avatar/05.jpg" alt=""></a>
										</div> -->
										<div class="ms-2">
											<!-- Comment by -->
											<div class="bg-light p-3 rounded">
												<div class="d-flex justify-content-center">
													<div class="me-2">
														<h6 class="mb-1 lead fw-bold"> <a href="#">${comment.writer}</a></h6>
														<p class="h6 mb-0">${comment.content}</p>
													</div>
													<small>${comment.write_date}</small>
												</div>
											</div>

											<script>
												$(document).ready(function(){
													var usernm = "<c:out value='${user.user_nickname}'/>";
													var check = "<c:out value='${comment.writer}'/>";
													if(usernm == check){
														$("#delete${status.count}").show();
													}else{
														$("#delete${status.count}").hide();
													}

												});
											</script>
											
											<!-- Comment react -->
											<ul class="nav nav-divider py-2 small">
												<li class="nav-item"> <a class="text-primary-hover" href="#"> Like ()</a> </li>
												<li class="nav-item reply${comment.comment_id}" > <a class="text-primary-hover reply${comment.comment_id}" id="c${comment.comment_id}" href="javascript:void(0);" onclick="showReply(this.id)"> Reply</a> </li>
												<li class="nav-item" onclick="deleteComment('${comment.comment_id}')" id="delete${status.count}" style="display: none;"> <a class="text-primary-hover" href="#"> Delete</a> </li>
											</ul>
										</div>
									</div>
									<div class=" mb-3" style="display: none;" id="c${comment.comment_id}form"> 
										<form class="w-100 d-flex reply${comment.comment_id}" id="insertRecommentrec${comment.comment_id}" onclick="return false;" method="post" >
											<i class="bi bi-arrow-return-right icon-md text-black ms-5"></i>
											<input type="textarea" class="one form-control pe-4 bg-light" id="rec${comment.comment_id}text" name="content" rows="1" placeholder="Add a comment...">
											<input type="text" id="comment_id" name="comment_id" style="display : none;" value="<c:out value='${comment.comment_id}'/>" >
											<input type="text" name="user_id" style="display:none;" value="${user.user_id}">
											<button class="btn btn-primary ms-2 mb-0 text-center " type="button" id="rec${comment.comment_id}" onclick="insert_Recomment(this.id)">Reply</button>
										</form>
									</div>

									<c:forEach items="${detail.recomments}" var="recomment" varStatus="status"> 
										<c:set var="id" value="${comment.comment_id}" />
										<c:set var="rid" value="${recomment.comment_id}" />
										<c:if test="${id eq rid}">
										<!-- Comment item nested START -->
										<ul class="list-unstyled ms-4">
											<!-- Comment item START -->
											<li class="comment-item">
												<div class="d-flex mt-4">
													<!-- Avatar -->
													<!-- Comment by -->
													<div class="ms-2">
														<div class="bg-light p-3 rounded">
															<div class="d-flex justify-content-center">
																<div class="me-2">
																	<h6 class="mb-1  lead fw-bold"> <a href="#"> ${recomment.writer} </a> </h6>
																	<p class=" mb-0">${recomment.content}</p>
																</div>
																<small>${recomment.write_date}</small>
															</div>
														</div>
														<!-- Comment react -->
														<ul class="nav nav-divider py-2 small">
															<li class="nav-item"><a class="text-primary-hover" href="#!"> Like ()</a></li>
															<li class="nav-item" style="display: none;" onclick="deleteRecomment('${recomment.recomment_id}')" id="delete${status.count}" > <a class="text-primary-hover" href="#"> Delete</a> </li>
														</ul>
													</div>
												</div>
											</li>
											<!-- Comment item END -->
										</ul>
										<!-- <hr> -->
										<!-- Comment item nested END -->
									</c:if>
								</c:forEach>
								</li>
							</ul>
						</div>
					</c:forEach>
						<!-- Comment Item End -->
				</div>
			</div>
			<a href="javascript:history.back();" class="btn btn-outline-success mt-4 ms-2">목록으로</a>
		</div>
	</div>
</section>

<!-- =======================
Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- =======================
<%@ include file="./footer.jsp" %>

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="assets/vendor/sticky-js/sticky.min.js"></script>
<script src="assets/vendor/plyr/plyr.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>
<script src="assets/js/ajax.js"></script>

</body>
</html>