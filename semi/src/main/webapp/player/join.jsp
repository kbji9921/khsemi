<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입 화면</title>
    <!-- 구글 폰트 CDN -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <style>
    h2{
	   font-weight: 600;
	   color: #343b6a;
	   font-size: 20px;
	}
    html{
        background-color: #F5F6F7;
    }
        .pw-btn{
            height: 40px !important;
            border-radius:0.25em !important;
        }
    </style>
      <script type="text/javascript">
        $(function(){
            //정규표현식 검사를 합쳐서 구현
            $("input[name=playerId]").blur(regexCheckId);
            $("input[name=playerPw]").blur(regexCheckPw);
            $("input[name=playerName]").blur(regexCheckName);
            $("input[name=playerPhone]").blur(regexCheckPhone);
            $("input[name=playerEmail]").blur(regexCheckEmail);
            $("#password-check").blur(passwordCheck);

        	var judgeObject = {
        			id:false,
        			pw1:false,
        			pw2:false,
        			name:false,
        			phone:false,
        			email:false
        	};
        	
        	$(".join-form").submit(function(){
                return judgeObject.id && judgeObject.pw1 && judgeObject.pw2 && judgeObject.name && judgeObject.phone && judgeObject.email;
			})

            function regexCheckId(){
            	var regex= /^[a-z][a-z0-9]{7,19}$/;
                var playerId = $(this).val();
                var span = $(this).next("span");
                var judge = regex.test(playerId);
                
                console.log("judge="+judge);

                if(!judge){
                	span.css("color","red");
                	span.text("아이디를 형식에 맞게 작성하세요");
                	judgeObject.id = false;
                	return;
                }
	            var that =this;
	
	            $.ajax({
	                url:"http://localhost:8080/semi/ajax/player.id",
	                type: "post",
	                data: {
	                    playerId : playerId
	                },
	                success:function(resp){
	                    if(resp==="Y"){
	                        span.css("color","green");
	                        span.text("사용 가능한 아이디입니다");
	                        judgeObject.id = true;
	                    }
	                    else if(resp==="N"){
	                    	 span.css("color","red");
	                    	 span.text("이미 사용중인 아이디입니다");
	                        judgeObject.id = false;
	                    }
	                }
	            });
            }
            //비밀번호 정규표현식
            function regexCheckPw(){
                //var regex = this.dataset.regex;
                var regex = /^[a-zA-Z][a-zA-z0-9]{7,15}$/;
                var playerPw = $(this).val();

                var judge = regex.test(playerPw);

                if(judge){
                    $(this).next().css("color", "green");
                    $(this).next("span").text("")
                    judgeObject.pw1 = true;
                }
                else {
                    $(this).next().css("color", "red");
                    $(this).next("span").text("8~16자 영문(대/소), 숫자를 사용하세요.");
                    judgeObject.pw1 = false;
                }
            }
            //이름 정규표현식
            function regexCheckName(){
                //this==이름 입력창
                var regex = /^[가-힣]{2,7}$/;
                var playerName =$(this).val();

                var judge = regex.test(playerName);
                if(judge){
                    $(this).next("span").css("color","green")
                    $(this).next("span").text("")
                    judgeObject.name = true;
                }else{
                    $(this).next("span").css("color","red")
                    $(this).next("span").text("한글 2-7자 이내만 가능합니다.");
                    judgeObject.name  = false;
                } 
            }; 
            
            //전화번호 정규표현식
            function regexCheckPhone(){
                //this==전화번호 입력창
                var regex = /^[0][1][0][1-9][0-9]{7}$/;
                var playerPhone =$(this).val();

                var judge = regex.test(playerPhone);
                if(judge){
                    $(this).next("span").css("color","green")
                    $(this).next("span").text("")
                    judgeObject.phone = true;
                }else{
                    $(this).next("span").css("color","red")
                    $(this).next("span").text("숫자 11자리를 입력하세요");
                    judgeObject.phone  =false;
                } 
            }; 
            //이메일 정규표현식
            function regexCheckEmail(){
                //this==이메일 입력창
                var regex = /^[a-zA-z][a-zA-Z0-9@]{9,49}$/;
                var playerEmail = $(this).val();

                var judge = regex.test(playerEmail);
                if(judge){
                    $(this).next("span").css("color","green")
                    $(this).next("span").text("")
                    judgeObject.email =true;
                }else{
                    $(this).next("span").css("color","red")
                    $(this).next("span").text("이메일주소를 다시 확인하세요");
                    judgeObject.email=false;
                } 
            }; 

            function passwordCheck(){
                //this == 비밀번호 확인창
                var judge1 = $("input[name=playerPw]").val().length > 0;
                var judge2 = $("input[name=playerPw]").val() == $(this).val();

                if(judge1){
                    if(judge2){
                        $(this).next().css("color", "green");
                        $(this).next().text("비밀번호가 일치합니다");
                        judgeObject.pw2 =true;
                    }
                    else {
                        $(this).next().css("color", "red");
                        $(this).next().text("비밀번호가 일치하지 않습니다");
                        judgeObject.pw2 =false;
                    }
                }
                else {
                    $(this).next().css("color", "red");
                    $(this).next().text("비밀번호를 입력하세요");
                    judgeObject.pw2 =false;
                }
            }

        });
    </script>
</head>
<body>
    <form action="insert.player" class="join-form" method="post" >
      <div class="row center">
      		<h2>일반 회원가입</h2>
      </div>
    <div class="container w450 m30">
        <div class="row">
            <label>아이디</label>
            <input type="text" name="playerId"  autocomplete="off" class="form-input fill input-round" >
            <span></span>
        </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="playerPw"  class="form-input fill input-round">
            <span></span>
        </div>
        <div class="row">
        <label>비밀번호 재확인</label>
            <input type="password" id="password-check"  class="form-input fill input-round">
            <span></span>
        </div>
        <div class="row">
        <label>이름</label>
            <input type="text" name="playerName"  autocomplete="off"class="form-input fill input-round">
            <span></span>
        </div>
        <div class="row">
            <label>생년월일</label><br>
            <input type="date" name="playerBirth"  class="form-input input-round fill" autocomplete="off" placeholder="YYYY-MM-DD">
            <span></span>
        </div>
        <div class="row">
            <label>성별</label>
                <select name="playerGender" class="form-input fill input-round">
                <option selected value="">선택</option>
                <option>남</option>
                <option>여</option>
                </select>
        </div>
        <div class="row">
            <label>이메일</label>
            <input type="email" name="playerEmail"  class="form-input fill input-round" autocomplete="off">
            <span></span>
        </div>
        <div class="row">
            <label>전화번호</label>
            <input type="text" name="playerPhone" class="form-input fill input-round" autocomplete="off" placeholder="-제외하고 입력">
            <span></span>
        </div>
        <div class="row m20">
            <button type="submit" class="btn btn-semi btn-round fill pw-btn">가입하기</button>
        </div>
        <div class="row center">
            <a href="#" class="link">이용약관</a>|
            <a href="#" class="link">개인정보 처리방침</a>|
            <a href="#" class="link">회원정보 고객센터</a>
            <p>Copyright 살빠짐 Corp. All Rights Reserved.</p>
            
        </div>
    </div>
</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>