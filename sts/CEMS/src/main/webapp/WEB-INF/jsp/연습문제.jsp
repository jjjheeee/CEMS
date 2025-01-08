<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>TOPIK I</title>

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
		var time = 0;
		var question_cnt = 0;
		var temp = 0;
		var last = 0;

		// start btn
		$(document).ready(function(){
			buttonEvt();
			$('#course-pills-tab-1').click();

			var submit_btn = $(".next_button").last();
			submit_btn.attr("id","submit");
			submit_btn.removeClass("btn-primary");
			submit_btn.addClass("btn-danger");
			submit_btn.html("제출");
			submit_btn.attr("type", "submit");
			submit_btn.removeAttr("onclick");

			$("#submit").click(function(){
				alert("문제 제출 완료.")
				sleep(500);
			});
		});

		function buttonEvt(){
			var hour = 0;
			var min = 0;
			var sec = 0;
			var timer;
			var result = 0;
			

			timer = setInterval(function(){
				time++;
				temp++;
				result = Number(time)-Number(last);


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
				$(".user_time:last").val(result);$(".user_time:last").val(result);
 				}, 1000);

		}

		function showNext(i){
			var a = parseInt(i);
			var b = String(a+1);
			var c = i-1;
			
			var question_time = 0;
			question_time = Number($("#"+c+"_user_question_time").val()) + Number(temp);
			$("#"+c+"_user_question_time").val(question_time);
			last = last + Number(temp);
			temp=0;
			$('#course-pills-tab-' + b).click();
		}


		function alertStatus(id, check){
			var btn_id = "course-pills-tab-" + id;
			
			if($("#"+btn_id).css("background-color") != "rgb(125, 206, 19)"){
				question_cnt++;
			}
			document.getElementById("question_cnt").innerHTML = question_cnt +" / "+ "${fn:length(Question)}";
			$("#"+btn_id).css({
				"background-color" : "#7DCE13",
				"color" : "white",
				"border" : "1px solid white"
			});

			correctCheck(id, check);	
		};


		function correctCheck(id, check){
			id = id-1;
			var answer = $("#"+id+"_question_answer_num").val();
			var user_secelt = check;

			if (parseInt(answer) == parseInt(user_secelt)){
				$("#"+id+"_correct").val("1");
			} else{
				$("#"+id+"_correct").val("0");			
			}
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
				<h5 class="mb-4 font-base bg-primary text-white py-2 px-4 rounded-2 d-inline-block">TOPIK I - 읽기</h5>
				<!-- Title -->
				<!-- <h2>빈칸 채우기</h2> -->
				<!-- <p>test</p> -->
				<!-- Content -->
				<ul class="list-inline mb-0">
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0""><i class="bi bi-stopwatch-fill"></i>
						<span id="time" class="time">00:00:00</span>
					</li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-star text-warning me-2 "></i><span id="question_cnt">0 / ${fn:length(Question)}</span></li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-user-graduate text-orange me-2"></i>${user.user_nickname}</li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><i class="fas fa-globe text-info me-2"></i>한국어능력검정시험</li>
					<li class="list-inline-item h6 me-3 mb-1 mb-sm-0"><a href="/CEMS/home"><i class="bi bi-door-open-fill text-danger me-2"></i>나가기</a></li>
				</ul>
			</div>
		</div>
	</div>
</section>
<!-- =======================
Page intro END -->
					
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

<script>
	

</script>

<!-- =======================
Page content START -->
<section class="pb-0 py-lg-5">
	<div class="container">
		<div class="row">
			<!-- Main content START -->
			<div class="col-lg-8">
				<div class="card shadow rounded-2 p-0">
					<!-- ==========  문제 나오는 영역 시작 ============== -->
					<!-- Tab contents START -->
					<div class="card-body p-4">
						<form action="/CEMS/제출" method="post">
						<c:forEach items="${Question}" var="Q" varStatus="status">
							<script>
								$(document).ready(function(){
									var listening_check = '${Q.listening_check}';

									if(listening_check == '1'){
										$("#replay"+'${status.count}').show();
										$("#paragraphshow${status.count}").show();
										$("#paragraph${status.count}").hide();
									}else{
										$("#replay"+'${status.count}').hide();
										$("#paragraphshow${status.count}").hide();
									}
									
								});


								function showparagraph(id){
									$("#paragraph"+id).show();
								}

							</script>
						<div class="tab-content " id="course-pills-tabContent">
							<!-- Content START -->
									<div class="active_button col-10 mx-auto tab-pane fade" id="course-pills-${status.count}" role="tabpanel" aria-labelledby="course-pills-tab-${status.count}">
										<!-- Course detail START -->
										<div class="my-5">
											<h5>${status.count}. ${Q.TOPIK1_question}</h5>
											<span style="float: right;">[ ${Q.TOPIK1_type_id} / ${Q.TOPIK1_subtype_id} ]</span>
										</div>
										<button type="button" class="btn btn-primary" id="replay${status.count}" style="display: none;"><i class="bi bi-megaphone-fill fa-fw me-1"></i> 듣기</button>
										<button type="button" class="btn btn-primary" id="paragraphshow${status.count}" style="display: none;" onclick="showparagraph('${status.count}')">지문보기</button>
										<div id="paragraph${status.count}" class="p-4" style="border:1px solid grey; border-radius: 5px;">
											<c:forTokens  var="paragraph" items="${Q.paragraph}" delims="/" varStatus="num">
												
												<div style="white-space: pre-wrap;"><strong>${paragraph}</strong></div>
												<input id="text${status.count}${num.count}" style="display: none;" type="text" value="${paragraph}">
											</c:forTokens>
											<script>
												function sleep(ms){
													const wakeUpTime = Date.now() + ms;
													while(Date.now() < wakeUpTime){}
												};

												$("#replay${status.count}").click(function (){
													var paragraph = '${Q.paragraph}'.split("/");
													for(var i=0; i < paragraph.length; i++){
													
													speak(paragraph[i]);
													if(i+1 == paragraph.length){
														break;
													}
													sleep(5000);
													}
												});

											</script>

										</div>
											
										<!-- List content -->
										<div class="my-5" > 
											<!-- style="border-top: 1px solid gray; margin: 0; padding: 0;" -->
											<h5 class="mt-5 my-1">보기</h5>
												<c:forTokens  var="bogi" items="${Q.question_wrong}" delims="/" varStatus="num">
													<ul class="list-group list-group-borderless mb-3">
														<li class="list-group-item h6 fw-light d-flex mb-0 pb-0">
															<input type="radio" onclick="alertStatus('${status.count}', '${num.count}')" class="checked_radio" name="resultList[${status.index}].choice" id="A${status.count}${num.count}" value="${bogi}">
															<label class="Qlabel" for="A${status.count}${num.count}">${bogi}
															</label>
														</li>
													</ul>
													
												</c:forTokens>
											</div>
											<!-- Fake input -->
											<input type="text" style="display: none;" name="resultList[${status.index}].paragraph_id" value="<c:out value='${Q.paragraph_id}'/>">
											<input type="text" style="display: none;" name="resultList[${status.index}].TOPIK1_type_id" value="<c:out value='${Q.TOPIK1_type_id}'/>">
											<input type="text" style="display: none;" name="resultList[${status.index}].TOPIK1_subtype_id" value="<c:out value='${Q.TOPIK1_subtype_id}'/>">
											<input type="text" style="display: none;" class="user_time" id="${status.index}_user_question_time" name="resultList[${status.index}].user_question_time" value="0">
											<input type="text" style="display: none;" name="resultList[${status.index}].division_exercise_mock" value="0">
											<input type="text" style="display: none;" name="resultList[${status.index}].answer" value="<c:out value='${Q.question_answer}'/>">
											<input type="text" style="display: none;" name="resultList[${status.index}].user_id" value="<c:out value='${user.user_id}'/>">
											

											<div class="text-end">
												<button type="button"  class="next_button btn btn-primary" onclick="showNext('${status.count}')">다음</button>
											</div>
											<!-- Course detail END -->
										</div>
										<!-- Content END -->
									</div>
								</c:forEach>
							</form>
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
							<h5 class="mt-2 ps-4">문제 번호</h5>

							<ul class="list-inline mb-0">
								<li class="list-inline-item">
									<div class="card-header">
										<ul class="nav nav-pills" id="course-pills-tab">
											<!-- Tab item -->
											<c:forEach items="${Question}" var="Q" varStatus="status">
												<li class="">
													<button class="omr_button border nav-link m-0 avtive d-flex justify-content-center align-items-center" style="width: 45px; height: 45px; border-radius: 0;" id="course-pills-tab-${status.count}" data-bs-toggle="pill" data-bs-target="#course-pills-${status.count}" type="button" role="tab" aria-controls="course-pills-${status.count}" aria-selected="true">${status.count}</button>
												</li>
											</c:forEach>
											</ul>
										</div>
									</li>
							</ul>
						</div>	
						<!-- Tags END -->


					</div>
				</div><!-- Row End -->
			</div>
			<!-- Right sidebar END -->

		</div><!-- Row END -->
	</div>
</section>
<!-- =======================
Page content END -->


<script>
	function speak(text) {
		if (typeof SpeechSynthesisUtterance === "undefined" || typeof window.speechSynthesis === "undefined") {
			alert("이 브라우저는 음성 합성을 지원하지 않습니다.")
			return
		}
		
		window.speechSynthesis.cancel() // 현재 읽고있다면 초기화

		const speechMsg = new SpeechSynthesisUtterance()
		speechMsg.rate = 0.5 // 속도: 0.1 ~ 10      
		speechMsg.pitch = 1.1 // 음높이: 0 ~ 2
		speechMsg.lang = "ko-KR"
		speechMsg.text = text
		
		// SpeechSynthesisUtterance에 저장된 내용을 바탕으로 음성합성 실행
		window.speechSynthesis.speak(speechMsg)
	}


	// 이벤트 영역
	
</script>


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