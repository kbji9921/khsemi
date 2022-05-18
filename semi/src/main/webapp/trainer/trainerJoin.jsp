<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
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
<script>
	var context = <%=request.getContextPath()%>;
</script>
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
        	var context = <%=request.getContextPath()%>;
            //정규표현식 검사를 합쳐서 구현
            $("input[name=trainerId]").blur(regexCheckId);
            $("input[name=trainerPw]").blur(regexCheckPw);
            $("input[name=trainerName]").blur(regexCheckName);
            $("input[name=trainerPhone]").blur(regexCheckPhone);
            $("input[name=trainerEmail]").blur(regexCheckEmail);
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
                var trainerId = $(this).val();
                var span = $(this).next("span");
                var judge = regex.test(trainerId);
                
                console.log("judge="+judge);

                if(!judge){
                	span.css("color","red");
                	span.text("아이디를 형식에 맞게 작성하세요");
                	judgeObject.id = false;
                	return;
                }
	            var that =this;
	
	            $.ajax({
	                url: context+"/ajax/trainerId.check",
	                type: "post",
	                data: {
	                    trainerId : trainerId
	                },
	                success:function(resp){
	                    if(resp==="YY"){
	                        span.css("color","green");
	                        span.text("사용 가능한 아이디입니다");
	                        judgeObject.id = true;
	                    }
	                    else if(resp==="NN"){
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
                var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$])[A-Za-z\d!@#$]{8,16}$/;
                var trainerPw = $(this).val();

                var judge = regex.test(trainerPw);

                if(judge){
                    $(this).next().css("color", "green");
                    $(this).next("span").text("")
                    judgeObject.pw1 = true;
                }
                else {
                    $(this).next().css("color", "red");
                    $(this).next("span").text("8~16자 영문,소문,숫자,특수문자를 사용하세요.");
                    judgeObject.pw1 = false;
                }
            }
            //이름 정규표현식
            function regexCheckName(){
                //this==이름 입력창
                var regex = /^[가-힣]{2,7}$/;
                var trainerName =$(this).val();

                var judge = regex.test(trainerName);
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
                var trainerPhone =$(this).val();

                var judge = regex.test(trainerPhone);
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
                var regex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                var trainerEmail = $(this).val();

                var judge = regex.test(trainerEmail);
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
                var judge1 = $("input[name=trainerPw]").val().length > 0;
                var judge2 = $("input[name=trainerPw]").val() == $(this).val();

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
    <form action="<%=request.getContextPath()%>/trainer/profile.trainer" class="join-form" method="post" enctype="multipart/form-data">
    <div class="container w450 m30">
    	<div class="row center">
      		<h2>강사 회원가입</h2>
      	</div>
        <div class="row">
            <label>아이디</label>
            <input type="text" name="trainerId"  autocomplete="off" class="form-input fill input-round" >
            <span></span>
        </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="trainerPw"  class="form-input fill input-round">
            <span></span>
        </div>
        <div class="row">
        <label>비밀번호 재확인</label>
            <input type="password" id="password-check"  class="form-input fill input-round">
            <span></span>
        </div>
        <div class="row">
        <label>이름</label>
            <input type="text" name="trainerName"  autocomplete="off"class="form-input fill input-round">
            <span></span>
        </div>
        <div class="row">
            <label>생년월일</label><br>
            <input type="date" name="trainerBirth"  class="form-input input-round fill" autocomplete="off" placeholder="YYYY-MM-DD">
            <span></span>
        </div>
        <div class="row">
            <label>성별</label>
                <select name="trainerGender" class="form-input fill input-round">
                <option selected value="">선택</option>
                <option>남</option>
                <option>여</option>
                </select>
        </div>
        <div class="row">
            <label>이메일</label>
            <input type="email" name="trainerEmail"  class="form-input fill input-round" autocomplete="off">
            <span></span>
        </div>
        <div class="row">
            <label>전화번호</label>
            <input type="tel" name="trainerPhone" class="form-input fill input-round" autocomplete="off" placeholder="-제외하고 입력">
            <span></span>
        </div>
        <div class="row">
            <labe>운동종목</labe>
            <select name="trainerSports" class="form-input fill input-round">
                <option selected value="">선택</option>
                <option>헬스</option>
                <option>필라테스</option>
                <option>요가</option>
                <option>수영</option>
                <option>테니스</option>
            </select>
            <span></span>
        </div>
        <div class="row">
        	<input type="file" accept="jpg,png" placeholder="프로필 사진 선택" name="trainerAttachment">
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
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>