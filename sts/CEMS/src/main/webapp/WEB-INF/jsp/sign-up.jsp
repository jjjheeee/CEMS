<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>CEMS-Topik : Sign-up</title>

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

	<!-- Theme CSS -->
	<link id="style-switch" rel="stylesheet" type="text/css" href="assets/css/style.css">
	
	<!-- JQuery -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

	<script>
		$(document).ready(function(){
			$("#submit").click(function(){
				alert("회원가입 완료!");
			});	
		});
	</script>
	
</head>

<body>

<!-- **************** MAIN CONTENT START **************** -->
<main>
	<section class="p-0 d-flex align-items-center position-relative overflow-hidden">
	
		<div class="container-fluid">
			<div class="row">
				<!-- left -->
				<div style="position: fixed; overflow: auto;" class="h-100 w-50 col-12 col-lg-6 d-md-flex align-items-center justify-content-center bg-primary bg-opacity-10 ">
					<div class="p-3 p-lg-5">
						<!-- Title -->
						<div class="text-center">
							<h2 class="fw-bold">Welcome to our largest community</h2>
							<p class="mb-0 h6 fw-light">Let's learn something new today!</p>
						</div>
						<!-- SVG Image -->
						<img src="assets/images/element/02.svg" class="mt-5" alt="">
						<!-- Info -->
						<div class="d-sm-flex mt-5 align-items-center justify-content-center">
							<ul class="avatar-group mb-2 mb-sm-0">
								<li class="avatar avatar-sm"><img class="avatar-img rounded-circle" src="assets/images/avatar/01.jpg" alt="avatar"></li>
								<li class="avatar avatar-sm"><img class="avatar-img rounded-circle" src="assets/images/avatar/02.jpg" alt="avatar"></li>
								<li class="avatar avatar-sm"><img class="avatar-img rounded-circle" src="assets/images/avatar/03.jpg" alt="avatar"></li>
								<li class="avatar avatar-sm"><img class="avatar-img rounded-circle" src="assets/images/avatar/04.jpg" alt="avatar"></li>
							</ul>
							<!-- Content -->
							<p class="mb-0 h6 fw-light ms-0 ms-sm-3">4k+ Students joined us, now it's your turn.</p>
						</div>
					</div>
				</div>

				<!-- Right -->
				<div style="margin-left:50%;" class="w-50 col-12 col-lg-6">
					<div class="row my-5">
						<div class="col-sm-10 col-xl-8 m-auto">
							<!-- Title -->
							<img src="assets/images/element/03.svg" class="h-40px mb-2" alt="">
							<h2>Sign up for your account!</h2>
							<p class="lead mb-4">Nice to see you! Please Sign up with your account.</p>
						
							<!-- Form START -->
							<form action="signup" method="post" >
																<!-- Name -->
								<div class="mb-4">
									<label for="Name" class="form-label">이름</label><span style="color: red !important; display: inline; float: none;"> *</span>      
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-person-fill"></i></span>
										<input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="세종" id="usernm" name="user_name" required autocomplete="off"> 
									</div>
								</div>

								<!-- 별명 -->
								<div class="mb-4">
									<label for="Name" class="form-label">별명</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-person-fill"></i></span>
										<input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="대왕" id="nickname" name="user_nickname" autocomplete="off">
									</div>
								</div>

								<!-- Email -->
								<div class="mb-3">
									<label for="Email" class="form-label">전자 우편 </label><span style="color: red !important; display: inline; float: none;"> *</span>      
									<div class="input-group input-group-lg" id="emaildiv">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill" id="idregex"></i><i class="bi bi-x-lg " id="idregexc" style="display: none;"></i></span>
										<input type="email" oninput = "checkId()" class="form-control border-0 bg-light rounded-end ps-1" placeholder="전자 우편" id="userid" name="user_id" autocomplete="off" required>
									</div>
									<label for="" style="color: red !important; display: none; float: none;" id="idregextext">이메일 형식에 맞게 작성해 주세요.</label>
									
								</div>
								<!-- Email Check DIV -->

								<div>
									<div class="id_ok alert alert-success align-items-center w-100"  style="display: none;" role="alert">
										<i class="bi bi-person-check-fill fa-fw me-1"></i>
										사용 가능한 아이디에요.
									</div>
									<div class="id_already alert alert-danger align-items-center w-100"  style="display: none;" role="alert">
										<i class="bi bi-person-x-fill fa-fw me-1"></i>
										누군가 이 아이디를 사용하고 있어요.
									</div>
								</div>

								<!-- country -->
								<div class="mb-4">
									<label for="country">국적</label><span style="color: red !important; display: inline; float: none;"> *</span>      
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-geo-alt-fill"></i></span>
										<select id="country" name="user_country" class="form-control border-0 bg-light rounded-end ps-1" required>
											<option value="">나라를 선택해주세요 !</option>
											<option value="Afghanistan">Afghanistan</option>
											<option value="Åland Islands">Åland Islands</option>
											<option value="Albania">Albania</option>
											<option value="Algeria">Algeria</option>
											<option value="American Samoa">American Samoa</option>
											<option value="Andorra">Andorra</option>
											<option value="Angola">Angola</option>
											<option value="Anguilla">Anguilla</option>
											<option value="Antarctica">Antarctica</option>
											<option value="Antigua and Barbuda">Antigua and Barbuda</option>
											<option value="Argentina">Argentina</option>
											<option value="Armenia">Armenia</option>
											<option value="Aruba">Aruba</option>
											<option value="Australia">Australia</option>
											<option value="Austria">Austria</option>
											<option value="Azerbaijan">Azerbaijan</option>
											<option value="Bahamas">Bahamas</option>
											<option value="Bahrain">Bahrain</option>
											<option value="Bangladesh">Bangladesh</option>
											<option value="Barbados">Barbados</option>
											<option value="Belarus">Belarus</option>
											<option value="Belgium">Belgium</option>
											<option value="Belize">Belize</option>
											<option value="Benin">Benin</option>
											<option value="Bermuda">Bermuda</option>
											<option value="Bhutan">Bhutan</option>
											<option value="Bolivia">Bolivia</option>
											<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
											<option value="Botswana">Botswana</option>
											<option value="Bouvet Island">Bouvet Island</option>
											<option value="Brazil">Brazil</option>
											<option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
											<option value="Brunei Darussalam">Brunei Darussalam</option>
											<option value="Bulgaria">Bulgaria</option>
											<option value="Burkina Faso">Burkina Faso</option>
											<option value="Burundi">Burundi</option>
											<option value="Cambodia">Cambodia</option>
											<option value="Cameroon">Cameroon</option>
											<option value="Canada">Canada</option>
											<option value="Cape Verde">Cape Verde</option>
											<option value="Cayman Islands">Cayman Islands</option>
											<option value="Central African Republic">Central African Republic</option>
											<option value="Chad">Chad</option>
											<option value="Chile">Chile</option>
											<option value="China">China</option>
											<option value="Christmas Island">Christmas Island</option>
											<option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
											<option value="Colombia">Colombia</option>
											<option value="Comoros">Comoros</option>
											<option value="Congo">Congo</option>
											<option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
											<option value="Cook Islands">Cook Islands</option>
											<option value="Costa Rica">Costa Rica</option>
											<option value="Cote D'ivoire">Cote D'ivoire</option>
											<option value="Croatia">Croatia</option>
											<option value="Cuba">Cuba</option>
											<option value="Cyprus">Cyprus</option>
											<option value="Czech Republic">Czech Republic</option>
											<option value="Denmark">Denmark</option>
											<option value="Djibouti">Djibouti</option>
											<option value="Dominica">Dominica</option>
											<option value="Dominican Republic">Dominican Republic</option>
											<option value="Ecuador">Ecuador</option>
											<option value="Egypt">Egypt</option>
											<option value="El Salvador">El Salvador</option>
											<option value="Equatorial Guinea">Equatorial Guinea</option>
											<option value="Eritrea">Eritrea</option>
											<option value="Estonia">Estonia</option>
											<option value="Ethiopia">Ethiopia</option>
											<option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
											<option value="Faroe Islands">Faroe Islands</option>
											<option value="Fiji">Fiji</option>
											<option value="Finland">Finland</option>
											<option value="France">France</option>
											<option value="French Guiana">French Guiana</option>
											<option value="French Polynesia">French Polynesia</option>
											<option value="French Southern Territories">French Southern Territories</option>
											<option value="Gabon">Gabon</option>
											<option value="Gambia">Gambia</option>
											<option value="Georgia">Georgia</option>
											<option value="Germany">Germany</option>
											<option value="Ghana">Ghana</option>
											<option value="Gibraltar">Gibraltar</option>
											<option value="Greece">Greece</option>
											<option value="Greenland">Greenland</option>
											<option value="Grenada">Grenada</option>
											<option value="Guadeloupe">Guadeloupe</option>
											<option value="Guam">Guam</option>
											<option value="Guatemala">Guatemala</option>
											<option value="Guernsey">Guernsey</option>
											<option value="Guinea">Guinea</option>
											<option value="Guinea-bissau">Guinea-bissau</option>
											<option value="Guyana">Guyana</option>
											<option value="Haiti">Haiti</option>
											<option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
											<option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
											<option value="Honduras">Honduras</option>
											<option value="Hong Kong">Hong Kong</option>
											<option value="Hungary">Hungary</option>
											<option value="Iceland">Iceland</option>
											<option value="India">India</option>
											<option value="Indonesia">Indonesia</option>
											<option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
											<option value="Iraq">Iraq</option>
											<option value="Ireland">Ireland</option>
											<option value="Isle of Man">Isle of Man</option>
											<option value="Israel">Israel</option>
											<option value="Italy">Italy</option>
											<option value="Jamaica">Jamaica</option>
											<option value="Japan">Japan</option>
											<option value="Jersey">Jersey</option>
											<option value="Jordan">Jordan</option>
											<option value="Kazakhstan">Kazakhstan</option>
											<option value="Kenya">Kenya</option>
											<option value="Kiribati">Kiribati</option>
											<option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
											<option value="Korea, Republic of">대한민국</option>
											<option value="Kuwait">Kuwait</option>
											<option value="Kyrgyzstan">Kyrgyzstan</option>
											<option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
											<option value="Latvia">Latvia</option>
											<option value="Lebanon">Lebanon</option>
											<option value="Lesotho">Lesotho</option>
											<option value="Liberia">Liberia</option>
											<option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya</option>
											<option value="Liechtenstein">Liechtenstein</option>
											<option value="Lithuania">Lithuania</option>
											<option value="Luxembourg">Luxembourg</option>
											<option value="Macao">Macao</option>
											<option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
											<option value="Madagascar">Madagascar</option>
											<option value="Malawi">Malawi</option>
											<option value="Malaysia">Malaysia</option>
											<option value="Maldives">Maldives</option>
											<option value="Mali">Mali</option>
											<option value="Malta">Malta</option>
											<option value="Marshall Islands">Marshall Islands</option>
											<option value="Martinique">Martinique</option>
											<option value="Mauritania">Mauritania</option>
											<option value="Mauritius">Mauritius</option>
											<option value="Mayotte">Mayotte</option>
											<option value="Mexico">Mexico</option>
											<option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
											<option value="Moldova, Republic of">Moldova, Republic of</option>
											<option value="Monaco">Monaco</option>
											<option value="Mongolia">Mongolia</option>
											<option value="Montenegro">Montenegro</option>
											<option value="Montserrat">Montserrat</option>
											<option value="Morocco">Morocco</option>
											<option value="Mozambique">Mozambique</option>
											<option value="Myanmar">Myanmar</option>
											<option value="Namibia">Namibia</option>
											<option value="Nauru">Nauru</option>
											<option value="Nepal">Nepal</option>
											<option value="Netherlands">Netherlands</option>
											<option value="Netherlands Antilles">Netherlands Antilles</option>
											<option value="New Caledonia">New Caledonia</option>
											<option value="New Zealand">New Zealand</option>
											<option value="Nicaragua">Nicaragua</option>
											<option value="Niger">Niger</option>
											<option value="Nigeria">Nigeria</option>
											<option value="Niue">Niue</option>
											<option value="Norfolk Island">Norfolk Island</option>
											<option value="Northern Mariana Islands">Northern Mariana Islands</option>
											<option value="Norway">Norway</option>
											<option value="Oman">Oman</option>
											<option value="Pakistan">Pakistan</option>
											<option value="Palau">Palau</option>
											<option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
											<option value="Panama">Panama</option>
											<option value="Papua New Guinea">Papua New Guinea</option>
											<option value="Paraguay">Paraguay</option>
											<option value="Peru">Peru</option>
											<option value="Philippines">Philippines</option>
											<option value="Pitcairn">Pitcairn</option>
											<option value="Poland">Poland</option>
											<option value="Portugal">Portugal</option>
											<option value="Puerto Rico">Puerto Rico</option>
											<option value="Qatar">Qatar</option>
											<option value="Reunion">Reunion</option>
											<option value="Romania">Romania</option>
											<option value="Russian Federation">Russian Federation</option>
											<option value="Rwanda">Rwanda</option>
											<option value="Saint Helena">Saint Helena</option>
											<option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
											<option value="Saint Lucia">Saint Lucia</option>
											<option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
											<option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
											<option value="Samoa">Samoa</option>
											<option value="San Marino">San Marino</option>
											<option value="Sao Tome and Principe">Sao Tome and Principe</option>
											<option value="Saudi Arabia">Saudi Arabia</option>
											<option value="Senegal">Senegal</option>
											<option value="Serbia">Serbia</option>
											<option value="Seychelles">Seychelles</option>
											<option value="Sierra Leone">Sierra Leone</option>
											<option value="Singapore">Singapore</option>
											<option value="Slovakia">Slovakia</option>
											<option value="Slovenia">Slovenia</option>
											<option value="Solomon Islands">Solomon Islands</option>
											<option value="Somalia">Somalia</option>
											<option value="South Africa">South Africa</option>
											<option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
											<option value="Spain">Spain</option>
											<option value="Sri Lanka">Sri Lanka</option>
											<option value="Sudan">Sudan</option>
											<option value="Suriname">Suriname</option>
											<option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
											<option value="Swaziland">Swaziland</option>
											<option value="Sweden">Sweden</option>
											<option value="Switzerland">Switzerland</option>
											<option value="Syrian Arab Republic">Syrian Arab Republic</option>
											<option value="Taiwan">Taiwan</option>
											<option value="Tajikistan">Tajikistan</option>
											<option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
											<option value="Thailand">Thailand</option>
											<option value="Timor-leste">Timor-leste</option>
											<option value="Togo">Togo</option>
											<option value="Tokelau">Tokelau</option>
											<option value="Tonga">Tonga</option>
											<option value="Trinidad and Tobago">Trinidad and Tobago</option>
											<option value="Tunisia">Tunisia</option>
											<option value="Turkey">Turkey</option>
											<option value="Turkmenistan">Turkmenistan</option>
											<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
											<option value="Tuvalu">Tuvalu</option>
											<option value="Uganda">Uganda</option>
											<option value="Ukraine">Ukraine</option>
											<option value="United Arab Emirates">United Arab Emirates</option>
											<option value="United Kingdom">United Kingdom</option>
											<option value="United States">United States</option>
											<option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
											<option value="Uruguay">Uruguay</option>
											<option value="Uzbekistan">Uzbekistan</option>
											<option value="Vanuatu">Vanuatu</option>
											<option value="Venezuela">Venezuela</option>
											<option value="Viet Nam">Viet Nam</option>
											<option value="Virgin Islands, British">Virgin Islands, British</option>
											<option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
											<option value="Wallis and Futuna">Wallis and Futuna</option>
											<option value="Western Sahara">Western Sahara</option>
											<option value="Yemen">Yemen</option>
											<option value="Zambia">Zambia</option>
											<option value="Zimbabwe">Zimbabwe</option>
										</select>
									</div>
								</div>
								<!-- Password -->
								<div class="mb-2">
									<label for="inputPassword5" class="form-label">암호 </label><span style="color: red !important; display: inline; float: none;"> *</span>      
									<div class="input-group input-group-lg" id="newpwdiv">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock" id="pwregex"></i><i class="bi bi-x-lg " id="pwregexc" style="display: none;"></i></span>
										<input type="password" class="form-control border-0 bg-light rounded-end ps-1" placeholder="*********" onchange="checkPW()" id="newpw" name="user_password" autocomplete="new-password" required>
									</div>
									<label for="" style="color: red !important; display: none; float: none;" id="pwregextext">8자이상  영문 대 소문자, 숫자, 특수문자를 사용하세요.</label>
								</div>
								<!-- Confirm Password -->
								<div class="mb-4" >
									<label for="checkpw" class="form-label">암호 확인 </label><span style="color: red !important; display: inline; float: none;"> *</span>      
									<div class="input-group input-group-lg" id="checkdiv">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i id="pwnotcorrect" class="fas fa-lock"></i><i class="bi bi-x-lg" id="pwuncorrect"></i><i class="bi bi-check-all" id="pwcorrect"></i></span>
										<input type="password" class="form-control border-0 bg-light rounded-end ps-1" placeholder="*********" onchange="checkPW()" id="checkpw" required>
									</div>
								</div>
								<!-- Check box -->
								<div class="mb-4">
									<!-- <div class="form-check">
										<input type="checkbox" class="form-check-input" id="checkbox-1">
										<label class="form-check-label" for="checkbox-1">By signing up, you agree to the<a href="#"> terms of service</a></label>
									</div> -->
									<label for="inputPassword6" class="form-label">코스 확인 </label>

									<div class="form-check">
										<input class="form-check-input" type="radio" name="user_type" value=1 id="course">
										<label class="form-check-label" for="course">
										  TOPIK I
										</label>
									  </div>
									  <div class="form-check">
										<input class="form-check-input" type="radio" name="user_type" id="course1" value=2>
										<label class="form-check-label" for="course1">
											TOPIK II
										</label>
									  </div>
								</div>
								<!-- Button -->
								<div class="align-items-center mt-0">
									<div class="d-grid">
										<button class="btn btn-primary mb-0" type="submit" id="submit">Sign Up</button>
									</div>
								</div>
							</form>
							<!-- Form END -->

							<!-- Sign up link -->
							<div class="mt-4 text-center">
								<span>이미 계정이 있나요 ? 여기서 <a href="login">로그인</a> 하세요</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>

<!-- idcheck ajax -->
<script src="assets/js/ajax.js"></script>

</body>
</html>