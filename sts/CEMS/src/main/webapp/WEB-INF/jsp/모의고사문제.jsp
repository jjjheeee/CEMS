<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>${mockboard.title}</title>

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
	<link rel="stylesheet" type="text/css" href="assets/vendor/tiny-slider/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/glightbox/css/glightbox.css">
	<link rel="stylesheet" type="text/css" href="assets/vendor/choices/css/choices.min.css">

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="assets/css/style.css">

	<!-- jquery -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<script>	
		$(document).ready(function(){
			var submit_btn = $(".next_button").last();
			submit_btn.removeClass("btn-primary");
			submit_btn.addClass("btn-danger");
			submit_btn.html("제출");
			submit_btn.attr("type", "submit");
			submit_btn.removeAttr("onclick");

		});


		var course = <c:out value="${mockboard.course}"/>
		var time = 0 ;
		if (course == '1'){
			time = 6000;
		}else{
			time = 10800;
		}
		var question_cnt = 0;
		// start btn

		function buttonEvt(){
			var hour = 0;
			var min = 0;
			var sec = 0;
			var timer;
	


			timer = setInterval(function(){
				time--;

				min = Math.floor(time/60);
				hour = Math.floor(min/60);
				sec = time%60;
				min = min%60;

				var th = hour;
				var tm = min;
				var ts = sec;

				if(th < 10){
				th = "0" + hour;
				}
				if(tm < 10){
				tm = "0" + min;
				}
				if(ts < 10){
				ts = "0" + sec;
				}

				document.getElementById("time").innerHTML = th + ":" + tm + ":" + ts;

				}, 1000);

		}
	
		function mocktestStart(){
			$(".omr_button").removeAttr("disabled");
			$("#mocktestInfo").hide();
			$("#infoside").show();
			$('#course-pills-tab-1').click();
			buttonEvt();
		}


	</script>



</head>

<body>
<!-- **************** MAIN CONTENT START **************** -->
<main>
	
	<!-- call systime - live systime -->
<!-- =======================
Page intro START -->
<section class="bg-light py-0 py-sm-5">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<!-- Badge -->
				<h5 class="mb-4 font-base bg-primary text-white py-2 px-4 rounded-2 d-inline-block">${mockboard.coursenm} - ${mockboard.title}</h5>
				<!-- Title -->
				<!-- <h2>빈칸 채우기</h2> -->
				<!-- <p>test</p> -->
				<!-- Content -->
				<ul class="list-inline mb-0">
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0""><i class="bi bi-stopwatch-fill"></i>
						<span id="time" class="time">00:00:00</span>
					</li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-star text-warning me-2 "></i><span id="question_cnt">0 / ${fn:length(Question)}</span></li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-user-graduate text-orange me-2"></i>${nickname}</li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-globe text-info me-2"></i>한국어능력검정시험</li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><a href="/CEMS/home"><i class="bi bi-door-open-fill text-danger me-2"></i>나가기</a></li>
				</ul>
			</div>
		</div>
	</div>
</section>
<!-- =======================
Page intro END -->

<!-- =======================
Page content START -->
<section class="pb-0 py-lg-5">
	<div class="container">
		<div class="row">
			<!-- Main content START -->
			<div class="col-lg-8">
				<div class="card shadow rounded-2 p-0">


					<!-- 
						다음 페이지가 나오는 조건

						course-pills-tab-1 버튼이 active가 되어야 한다.

						data-bs-target="#course-pills-1"에 해당하는 div가 있어야한다 밑에


						<div class="col-10 mx-auto tab-pane fade show active" id="course-pills-${status.count}" role="tabpanel" aria-labelledby="course-pills-tab-${status.count}">
						<button class="nav-link mb-2 mb-md-0 avtive" id="course-pills-tab-1" data-bs-toggle="pill" data-bs-target="#course-pills-1" type="button" role="tab" aria-controls="course-pills-1" aria-selected="true">Q</button>
							
						이 조건들이 
						div의 id="course-pills-${status.count}" = 버튼의 data-bs-target="#course-pills-1"
						div의 id="course-pills-${status.count}" = 버튼의 aria-controls="course-pills-1"
						div의 aria-labelledby="course-pills-tab-${status.count}" =  버튼의 id="course-pills-tab-1"

						결국 Next버튼을 누르면 위에 있는 숫자만 바뀌면됨
					-->




					<!-- ==========  문제 나오는 영역 시작 ============== -->
					<!-- Tab contents START -->
					<div class="card-body p-4">
						<div id="mocktestInfo">
							<div class="card card-body col-6 mx-auto shadow p-4 my-4">
								<!-- Title -->
								<h4 class="mb-3 mx-auto">시험 정보</h4>
								<ul class="list-group list-group-borderless">
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-book-open text-primary"></i>문제 수</span>
										<span>${fn:length(Question)}</span>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-clock text-primary"></i>시험 시간</span>
										<span>4h 50m</span>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-signal text-primary"></i>응시 단계</span>
										<span>${mockboard.coursenm}</span>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-globe text-primary"></i>시험</span>
										<span>한국어능력검정시험</span>
									</li>
									<li class="list-group-item d-flex justify-content-between align-items-center">
										<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-user-clock text-primary"></i>응시일</span>
										<span><fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /></span>
									</li>
								</ul>
							</div>

							<div class="text-center mx-auto">
								시험을 시작하려면 시작하기를 눌러주세요
							</div>
							<div class="text-center mx-auto mt-3">
								<button class="btn btn-primary" onclick="mocktestStart();">시작하기</button>
							</div>
						</div>
						<div class="tab-content pt-2" id="course-pills-tabContent">
							<!-- Content START -->
							<c:forEach items="${Question}" var="Q" varStatus="status">

							<script>
								function showNext(i){
									var a = parseInt(i);
									var b = String(a+1);
									$('#course-pills-tab-' + b).click();
								}
							</script>


							<div class="active_button col-10 mx-auto tab-pane fade show" id="course-pills-${status.count}" role="tabpanel" aria-labelledby="course-pills-tab-${status.count}">
								<!-- Course detail START -->
								<div class="my-5">
									<h5>${status.count}. ${Q.TOPIK1_question}</h5>
								</div>
								<div class="p-4" style="border:1px solid grey; border-radius: 5px;">
									<span><strong>${Q.paragraph}</strong></span>
								</div>
									
								<!-- List content -->
								<div class="my-5" > 
									<!-- style="border-top: 1px solid gray; margin: 0; padding: 0;" -->
									<h6 class="mt-5 my-1">보기</h6>
									<form action="">
										<script>
											
											function radioChecked(id, bogi){
												var btn_id = "course-pills-tab-" + id;
												
												if($("#"+btn_id).css("background-color") != "rgb(125, 206, 19)"){
													question_cnt++;
												}
												document.getElementById("question_cnt").innerHTML = question_cnt +" / "+ "${fn:length(Question)}";
												$("#"+btn_id).css({
													"border" : "3px solid green",
												});
												document.getElementById(btn_id).innerHTML = bogi;
												
											};

										</script>
										<c:forTokens  var="choice" items="${Q.choice}" delims="," varStatus="num">
											<ul class="list-group list-group-borderless mb-3">
												<li class="list-group-item h6 fw-light d-flex mb-0 pb-0">
													<input type="radio" onclick="radioChecked('${status.count}', '${num.count}')" class="checked_radio" id="A${status.count}${num.count}" name="bogi${status.count}" value="${num.count}">
													<label class="Qlabel" for="A${status.count}${num.count}">${choice}
													</label>
												</li>
											</ul>
										</c:forTokens>
									</form>
								</div>
								<div class="text-end  pb-4">
									<button class="next_button btn btn-primary" onclick="showNext('${status.count}')">다음</button>
								</div>
								<!-- Course detail END -->
							</div>
							<!-- Content END -->
						</c:forEach>
						</div>
					</div>
					<!-- Tab contents END -->
					<!-- ==========  문제 나오는 영역 끝 ============== -->



				


				</div>
			</div>
			<!-- Main content END -->

			<!-- Right sidebar START -->
			<div class="col-lg-4 pt-5 pt-lg-0">
				<div class="row mb-5 mb-lg-0">
					<div class="col-md-6 col-lg-12">
						<!-- Tags START -->
						<div class="card card-body shadow p-4 mb-4">
							<h5 class="mt-2 ps-4">OMR</h5>

							<ul class="list-inline mb-0 border" style="border-radius: 10px;"> 
								<li class="list-inline-item">
									<div class="card-header d-flex">
										<ul class="nav nav-pills ps-3 pb-3" id="course-pills-tab">
											<!-- Tab item -->
											<c:forEach items="${Question}" var="Q" varStatus="status">
												<li class="mt-3 me-2">
													<div class="mx-auto">
														<div class="text-center mx-auto pb-0">${status.count}</div>
														<button class="omr_button nav-link m-0 avtive d-flex justify-content-center align-items-center" disabled style="border-radius: 20px; width: 40px; height: 40px; border:2px solid #ced4da;" id="course-pills-tab-${status.count}" data-bs-toggle="pill" data-bs-target="#course-pills-${status.count}" type="button" role="tab" aria-controls="course-pills-${status.count}" aria-selected="true">
														</button>
													</div>
												</li>
											</c:forEach>
											</ul>
										</div>
									</li>
							</ul>
						</div>	
						<!-- Tags END -->

						<!-- Course info START -->
						<div id="infoside" class="card card-body shadow p-4 my-4" style="display: none;">
							<!-- Title -->
							<h4 class="mb-3 mx-auto">시험 정보</h4>
							<ul class="list-group list-group-borderless">
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-book-open text-primary"></i>문제 수</span>
									<span>${fn:length(Question)}</span>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-clock text-primary"></i>시험 시간</span>
									<span>4h 50m</span>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-signal text-primary"></i>응시 단계</span>
									<span>${mockboard.coursenm}</span>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-globe text-primary"></i>시험</span>
									<span>한국어능력검정시험</span>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0"><i class="fas fa-fw fa-user-clock text-primary"></i>응시일</span>
									<span><fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /></span>
								</li>
							</ul>
						</div>
					</div>
				</div><!-- Row End -->
			</div>
			<!-- Right sidebar END -->

		</div><!-- Row END -->
	</div>
</section>
<!-- =======================
Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!— Back to top —>
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!— Bootstrap JS —>
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!— Vendors —>
<script src="assets/vendor/tiny-slider/tiny-slider.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.js"></script>
<script src="assets/vendor/choices/js/choices.min.js"></script>

<!— Template Functions —>
<script src="assets/js/functions.js"></script>

</body>
</html>