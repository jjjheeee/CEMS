<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!-- Main content START -->
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
<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/choices/css/choices.min.css">
<link rel="stylesheet" type="text/css" href="/CEMS/assets/vendor/aos/aos.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">

<!-- Theme CSS -->
<link id="style-switch" rel="styleshexet" type="text/css" href="/CEMS/assets/css/style.css">

<!-- jquery -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- Radar chart START -->
<div class="col-xl-12">
	<div class="card border bg-transparent rounded-3 mb-0">
		<div class="card-header bg-transparent border-bottom">
			<h3 class="card-header-title mb-0">학습 통계</h3>
		</div>
		<div class="card-body container">
			<div class="row justify-content-center">
				<div class="col-5 p-4" style="display: none;">
					<canvas id="marksChart"></canvas>
				</div>
				<div class="col-5 p-4">
					<canvas id="marksChart1"></canvas>
				</div>
			</div>
			<!-- Radar chart END -->
		</div>
	</div>
</div>
<!-- Back to top -->

<script language="javaScript" >
	
	var marksCanvas = document.getElementById("marksChart");
	var marksCanvas1 = document.getElementById("marksChart1");


	const radarData = {
		labels: [
			'듣기듣기',
			'읽기듣기',
			'듣기듣기',
			'읽기듣기',
			'읽기듣기',
		],
		datasets: [{
			label: 'TOPIK I',
			data: [31, 5, 10, 10, 10],
			backgroundColor: 'rgb(235, 69, 95, 0.2)',
			borderColor: '#EB455F',
			pointBackgroundColor: '#EB455F',
			pointBorderColor: '#EB455F',
			pointHoverBackgroundColor: 'rgb(235, 69, 95, 0.2)',
			pointHoverBorderColor: '#EB455F'
		}
		
		]
	};
	
	const radarData2 = {
		labels: [
			<c:forEach items="${Ratio}" var="R" varStatus="status">
				'${R.TOPIK1_question_subtype}',
			</c:forEach>
		],
		datasets: [{
			label: '빈칸 정답률 (단위 : %)',
			data: [
				<c:forEach items="${Ratio}" var="R" varStatus="status">
					'${R.correctRatio}',
				</c:forEach>
			],
			backgroundColor: 'rgb(43, 52, 103, 0.2)',
			borderColor: 'rgb(43, 52, 103)',
			pointBackgroundColor: 'rgb(43, 52, 103)',
			pointBorderColor: 'rgb(43, 52, 103)',
			pointHoverBackgroundColor: 'rgb(43, 52, 103, 0.2)',
			pointHoverBorderColor: 'rgb(43, 52, 103)'
		}]
	};

	

	
	  new Chart(marksCanvas, {
		type: 'radar',
		data: radarData,
		options: {
			scale: {
				ticks: {
					  min: 0,
					  max: 100,
					stepSize: 20,
					grid: {
						color: 'white' // 거미줄 중간 중간 선 색상
					},
					ticks: {
						beginAtZero: true,
						color: 'white',
						showLabelBackdrop: false // hide square behind text // 이부분이 숫자 label의 배경 부분.
					},
					angleLines: {
						color: 'white' // 중심에서 라벨까지 줄 색상
					},
					pointLabels: {
						color: 'white', // 라벨의 글씨 색상
					}
				},
			},
		  plugins:{
			  legend:{
				  display:false // 최상단 라벨의 카테고리 안보이기.
			  },
			  
		  }
	  }
	  });

	

	  new Chart(marksCanvas1, {
		type: 'radar',
		data: radarData2,
		options: {
		  scale: {
			  ticks: {
					min: 0,
					max: 100,
				  stepSize: 20,
				  grid: {
					  color: 'white' // 거미줄 중간 중간 선 색상
				  },
				  ticks: {
					  beginAtZero: true,
					  color: 'white',
					  showLabelBackdrop: false // hide square behind text // 이부분이 숫자 label의 배경 부분.
				  },
				  angleLines: {
					  color: 'white' // 중심에서 라벨까지 줄 색상
				  },
				  pointLabels: {
					  color: 'white', // 라벨의 글씨 색상
				  }
			  },
		  },
		  plugins:{
			  legend:{
				  display:false // 최상단 라벨의 카테고리 안보이기.
			  }
		  }
	  }
	  });


</script>
<!-- Bootstrap JS -->
<script src="/CEMS/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>



<!-- Vendors -->
<script src="/CEMS/assets/vendor/choices/js/choices.min.js"></script>
<script src="/CEMS/assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>
<script src="/CEMS/assets/vendor/aos/aos.js"></script>

<script src="/CEMS/assets/js/functions.js"></script>


