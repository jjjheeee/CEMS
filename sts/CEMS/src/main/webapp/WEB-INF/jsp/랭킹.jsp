<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Leaderboard UI Design</title>
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

	<link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" ></script>

	<script>
		$(document).ready(function(){
			var user_ranking = $("#ranking tr").first()
			user_ranking.css({
				'background-color' : '#91D8E4'
			});
			
		})
		</script>

</head>
<body>
	
	<%@ include file="./header.jsp" %>
	
	<section class="main-content">
		<div class="container">
			<h1>유저 랭킹</h1>
			<div class="row align-items-end mb-5">
				<div class="col-sm-4">
					<div class="leaderboard-card">
						<div class="leaderboard-card__top">
							<div class="text-center">
								<h3>TOP 2</h3>
							</div>
							<h3 class="text-center"><i class="bi bi-check2-all me-1 fa-fw"></i> ${leaderlist[2].question_cnt}</h3>
						</div>
						<div class="leaderboard-card__body">
							<div class="text-center">
								<img src="/CEMS/assets/images/avatar/01.jpg" class="circle-img mb-2" alt="User Img">
								<h5 class="mb-0">${leaderlist[2].user_name}</h5>
								<p class="mb-0">@${leaderlist[2].user_nickname}</p>
								<hr>
								<div class="d-flex justify-content-between align-items-center">
									<span><i class="fa fa-map-marker"></i> ${leaderlist[2].user_country}</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-4">
					<div class="leaderboard-card leaderboard-card--first">
						<div class="leaderboard-card__top">
							<div class="text-center">
								<h2 class="text-white">
									TOP 1
								</h2>
								<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="gold" class="bi bi-trophy-fill" viewBox="0 0 16 16">
									<path d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935z"/>
								</svg>
							</div>
							
							<h3 class="mt-3 text-center text-white"><i class="bi bi-check2-all me-1 fa-fw"></i> ${leaderlist[1].question_cnt}</h3>
						</div>
						<div class="leaderboard-card__body">
							<div class="text-center">
								<img src="/CEMS/assets/images/avatar/02.jpg" class="circle-img mb-2" alt="User Img">
								<h5 class="mb-0">${leaderlist[1].user_name}</h5>
								<p class="mb-0">@${leaderlist[1].user_nickname}</p>
								<hr>
								<div class="d-flex justify-content-between align-items-center">
									<span><i class="fa fa-map-marker"></i> ${leaderlist[1].user_country}</span>
								</div>
							</div>
						</div>
					</div>
				</div>


				

				<div class="col-sm-4">
					<div class="leaderboard-card ">
						<div class="leaderboard-card__top">
							<div class="text-center">
								<h3>TOP 3</h3>
							</div>
							<h3 class="text-center"><i class="bi bi-check2-all me-1 fa-fw"></i> ${leaderlist[3].question_cnt}</h3>
						</div>
						<div class="leaderboard-card__body">
							<div class="text-center">
								<img src="/CEMS/assets/images/avatar/03.jpg" class="circle-img mb-2" alt="User Img">
								<h5 class="mb-0">${leaderlist[3].user_name}</h5>
								<p class="mb-0">@${leaderlist[3].user_nickname}</p>
								<hr>
								<div class="d-flex justify-content-between align-items-center">
									<span><i class="fa fa-map-marker"></i> ${leaderlist[3].user_country}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-10">
					<h4 >모든 유저</h4>
				</div>

				<!-- <script>
					$(document).ready(function(){
						var id = '${user.user_id}';
				
						$('#btn1').click(function(){
							var s = $('#test1')
							var offset = s.offset(); //선택한 태그의 위치를 반환
				
								//animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
				
							$('html').animate({scrollTop : offset.top}, 400);
				
						});
				
					});
				
				</script>
				
				
				
				<div class="col-2 text-end">
					<a  class="btn btn-secondary" id="test">내 순위 보기</a>
					<button id="btn1">test</button>
				</div> -->

			</div>

			<table class="table">
				<thead>
					<tr>
						<th class="text-center">순위</th>
						<th>회원</th>
						<th>맞은 개수</th>
						<th>나라</th>
					</tr>
				</thead>

				<tbody id="ranking">
					<c:forEach items="${leaderlist}" var="L" varStatus="status">
						<tr class="text-center">
							<td>
								${L.ranking}
							</td>
							<td>
								<div class="d-flex align-items-center" id="${L.user_id}">
									<img src="/CEMS/assets/images/avatar/04.jpg" class="circle-img mb-2" alt="User Img">
									<div class="user-info__basic ms-4">
										<h5 class="mb-0">${L.user_name}</h5>
										<p class="mb-0">${L.user_nickname}</p>
									</div>
								</div>
							</td>
							<td>
								<div class="d-flex align-items-baseline">
									<h4 class="mr-1">${L.question_cnt}</h4><small class="text-success"><i class="fa fa-arrow-up"></i> today+</small>
								</div>
							</td>
							<td class="text-start">${L.user_country}</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<%@ include file="./footer.jsp" %>
	<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>
	


<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="assets/vendor/sticky-js/sticky.min.js"></script>
<script src="assets/vendor/plyr/plyr.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>
<script src="assets/js/ajax.js"></script>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


</body>
</html>