<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String trainerId = (String)request.getSession().getAttribute("trainer"); %>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 재설정</title>
    <style>
        .box{
            padding:39px ,40px, 20px;
            font:12px;
            text-align:center;
            border:solid 1px black;
            width: 400px;
            height: 650px;
            flex-direction: column;
        }   
        .color{
            background-color: #343b6a;
            height: 50px;
        }
        .color img{
            padding-left: 1em;
            height:50px;
        }
        input,
        .pw-btn{
            width: 350px !important;
            border-radius:0.25em !important;
        }
        li{
            list-style-type: none;
        }
    </style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
        $(function(){
            $("input[name=trainerPw]").blur(regexCheck);
            $("input[name=changePw2]").blur(passwordCheck);
            $(".join-form").submit(function(){
                //함수이름을 적고 call() 이라고 부르면 this 를 바꿔서 부를 수 있다
                var judge1 = regexCheck.call(document.querySelector("input[name=trainerPw]"));
                var judge2 = passwordCheck.call(document.querySelector("input[name=changePw2]"));

                return judge1 &&judge2;
            });
            
        function regexCheck(){
        //this== 비밀번호 입력창
        var regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$])[A-Za-z\d!@#$]{8,16}$/;
        var trainerPw =$('input[name=trainerPw]').val();

        var judge = regex.test(trainerPw);
        if(judge){
            $(this).next().next("span").text("");
            // $(".pw1").text("");
            return true;
        }else{
            $(this).next().next("span").css("color","red")
            $(this).next().next("span").text("8~16자 영문,소문,숫자,특수문자를 사용.");
            return false;
        }
        };

        function passwordCheck(){
        //this == 비밀번화 확인창
        var judge1 = $("input[name=changePw1]").val().length > 0;
        var judge2 = $("input[name=changePw1]").val() == $(this).val();

        if(judge1){
            if(judge2){
                $(this).next().next("span").css("color","green")
                $(this).next().next("span").text("비밀번호가 일치합니다.");
                return true;
            }else{
                $(this).next().next("span").css("color","red")
                $(this).next().next("span").text("비밀번호가 일치하지 않습니다.");
                return false;
            }
        }else{
            $(this).next().next("span").css("color","red")
            $(this).next().next("span").text("비밀번호를 먼저 입력하세요");
            return false;
        }
        };
})
    </script>
</head>
<body>
<form class="join-form" action="setPw1.trainer" method="post">
    <div class="color">
        <a href="메인페이지 이동"><img src="../image/ci_main_logo.png"></a>
    </div>
    <div class="container w400 m50">
        <div class="row center m50">
            <h2>비밀번호 재설정</h2>
        </div>
        <div class="row m40">
            <hr>
        </div>
        <div class="box">
            <div class="row center">
            <ul>
                <li>
                    안전한 비밀번호로 내정보를 보호하세요
                </li>
                <li>
                    다른 아이디/사이트에서 사용한 적 없는 비밀번호
                </li>
                <li>
                    이전에 사용한 적 없는 비밀번호가 안전합니다.
                </li>
            </ul>
            </div>
            <div  class="row center">
            <ul>
                <li>
                    <strong>
                        <label for="userid">아이디</label>
                        <input type ="text" name ="trainerId" class="fill form-input input-round" value="<%=trainerId%>" readonly id="userid">
                    </strong>
                </li>
                <li>
                        <div class="row center">
                    	<strong>
                            <label for="oldpass">현재 비밀번호</label>
                            <input type ="password" name ="trainerPw" class="fill form-input input-round dis" id="oldpass">
                            <br>
                            <span></span>
                    	</strong>
                        </div>    
                </li>
                <li>
                      	<div class="row center">
	                    <strong>
                        <label for="newpass">새 비밀번호</label>
                        <input type ="password" name ="changePw1" class="fill form-input input-round dis" id="newpass">
                        <br>
                        <span></span>
                    	</strong>
                   		</div>    
                </li>
                <li>
                        <div class="row center"></div>
	                    <strong>
                        <label for="newpass2">새 비밀번호 확인</label>
                        <input type ="password" name ="changePw2" class="fill form-input input-round dis" id="newpass2">
                        <br>
                        <span></span>
                   		 </strong>
                    	</div>  
                </li>
                <li>
                    <div class="row center ">
                        <button type="submit" class="btn btn-semi pw-btn">확인</button>
                    </div>
                    <div class="row center">
                        <a href="trainerMyPage.jsp" class="link link-btn pw-btn">취소</a>
                    </div>
                </li>
            </ul>
                
        </div>
        </div>
        <!-- 버튼-->

    </div>
</form>
</body>
</html>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>