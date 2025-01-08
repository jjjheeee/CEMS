// 존재하는 ID Check 하는 ajax -> oninput attribute
function checkId(){
    var id = $('#userid').val(); //id값이 "id"인 입력란의 값을 저장
    
    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  	if (id.match(regex) != null) {
  	    $("#idregexc").hide();
	    $("#idregextext").hide(200);    
	    $("#idregex").show();
	    $.ajax({
	        url:'./idCheck', //Controller에서 요청 받을 주소
	        type:'post', //POST 방식으로 전달
	        data:{id:id},
	        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
	            if(id == ''){
	                $('.id_ok').hide(200);
	                $('.id_already').hide(200);
	                $('#pwbox').hide(200);
	                $('#conpwbox').hide(200);

	            }else{
	                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
	                    $('.id_ok').show(200);
	                    $('.id_already').hide(200);
	                	$('#pwbox').hide(200);
	 	                $('#conpwbox').hide(200);                

	                    $("#emaildiv").css({ //이렇게도 쓸 수 있으며 제일 낫다
						"border":"2px solid green",
						"border-radius":"5px"
						});
	                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                	    $("#idregexc").show();
					    $("#idregex").hide();    
	                    $('.id_already').show(200);
	                    $('.id_ok').hide(200);
	                    $('#id').val('');
	                	$('#pwbox').show(200);
	 	                $('#conpwbox').show(200); 

	                    $("#emaildiv").css({ //이렇게도 쓸 수 있으며 제일 낫다
						"border":"2px solid red",
						"border-radius":"5px"
						});
	
	                }
	            }
	        },
	        error:function(){
	            alert("에러입니다");
	        }
	    });
	}else{
	    $("#idregexc").show();
	    $("#idregextext").show(200);    
	    $("#idregex").hide();    
        $('.id_already').hide(200);
        $('.id_ok').hide(200);

	    $("#emaildiv").css({ //이렇게도 쓸 수 있으며 제일 낫다
			"border":"2px solid red",
			"border-radius":"5px"
		});

	}
    };
    
    
    
//======================================================================================

   
// 회원 탈퇴시 비밀번호 체크

function checkPw(){
	var pw = $('#userpw').val();	//id값이 "userpw"인 입력란의 값을 저장
	
	$.ajax({
		url:'/CEMS/pwCheck', //Controller에서 요청 받을 주소
        type:'post', //POST 방식으로 전달
        data:{pw:pw},
        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
        	if(pw == ''){
        		$('#pw-faile').hide();
        	}else{
		        if(cnt == 0){ //cnt가 0이면 DB에 없는 비밀번호
		        	$('#pw-faile').show();
		        	$('#deletediv').css({
		        		"border":"2px solid red",
		        		"border-radius":"5px"
		        	})   
		        } else { // cnt가 1일 경우 => DB에 존재하는 비밀번호
		        	 $('#pw-faile').hide();
		        	 $('#submit').removeAttr("disabled");
		        	 $('#deletediv').css({
		        		"border":"2px solid green",
		        		"border-radius":"5px"
		        	})  
		        }        	
        	}
	    },
        error:function(){
            alert("에러입니다");
        }
	});
}

// ======================================================================================

// 닉네임 변경시 중복 체크 

function nickCheck(){
	var user_nickname = $('#user_nickname').val();
	var regex = "^(?=.*[가-힣])[가-힣]{3,7}$"; //한글
	$.ajax({
		url:'/CEMS/nickname_check',
		type:'post',
		data:{'user_nickname' : user_nickname},
		success:function(cnt){
			if(cnt == 1){
				// 중복된 닉네임이 있는 경우 처리
				$('#nickcheckdiv h6').text('이미 존재하는 닉네임입니다.');
				$('#user_nickname').css({
						"border" : "2px solid red",
						"border-radius" : "5px"
					});
				$('#nickcheckdiv h6').css({
						"color" : 'red'
				})

				$('#nickcheckdiv').show();
				$('#submit1').attr("disabled", "disabled");


			}else{
				// 중복된 닉네임이 없는 경우 처리
				if(user_nickname.match(regex) != null){
					$('#submit1').removeAttr('disabled');
					$('#nickcheckdiv h6').text('사용 가능한 닉네임입니다 !');
					$('#nickcheckdiv h6').css({
						"color" : 'green'
					})
					$('#user_nickname').css({
						"border" : "2px solid green",
						"border-radius" : "5px"
					})				
					$('#nickcheckdiv').show();
				}else{
					$('#submit1').attr("disabled", "disabled");
					$('#nickcheckdiv h6').text('닉네임은 한글 3 ~ 7자로 변경하실 수 있습니다.');
					$('#nickcheckdiv h6').css({
						"color" : 'red'
					})

					$('#user_nickname').css({
						"border" : "2px solid red",
						"border-radius" : "5px"
					});
					$('#nickcheckdiv').show();
				}
				
			}
		},error:function(){
			alert('zz')
		}
	})	
} 

