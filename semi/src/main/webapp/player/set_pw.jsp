<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String playerId = request.getParameter("playerId");
   
   String error = request.getParameter("error");
	boolean type1 = error != null && error.equals("1");
%>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/header.jsp"></jsp:include>
    <title>비밀번호 재설정</title>
    <style>
        .box{
            padding:39px ,40px, 20px;
            font:12px;
            text-align:center;
            border:solid 1px black;
            width: 400px;
            height: 450px;
            flex-direction: column;
        }   
        .pw-btn{
            width: 350px !important;
            border-radius:0.25em !important;
        }
        
    </style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


       <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
        $(function(){
            $("input[name=changePw1]").blur(regexCheck);
            $("input[name=changePw2]").blur(passwordCheck);
            $(".join-form").submit(function(){
                //함수이름을 적고 call() 이라고 부르면 this 를 바꿔서 부를 수 있다
                var judge1 = regexCheck.call(document.querySelector("input[name=changePw1]"));
                var judge2 = passwordCheck.call(document.querySelector("input[name=changePw2]"));

                return judge1 &&judge2;
            });
            
        function regexCheck(){
        //this== 비밀번호 입력창
        var regex = /[a-zA-Z][a-zA-z0-9]{7,15}/;
        var trainerPw =$('input[name=changePw1]').val();

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
    <form class="join-form" action="set_pw.player" method="post">
    <div class="container w400 m50">
        <div class="row center m50">
            <h2>비밀번호 재설정</h2>
        </div>
        <div class="row m40">
            <hr>
        </div>
        <div class="box display-center">
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
                        <label>아이디</label>
                        <input type ="text" name ="playerId" class="fill form-input input-round" readonly value="<%=playerId%>">
                    </strong>
                </li>
                <li>
                    <strong>
                        <label>새 비밀번호</label>
                        <input type ="password" name ="changePw1" class="fill form-input input-round" required>
                        <br>
                        <span></span>
                    </strong>
                </li>
                <li>
                    <strong>
                        <label>새 비밀번호 확인</label>
                        <input type ="password" name ="changePw2" class="fill form-input input-round" required>
                        <br>
                        <span></span>
                    </strong>
                </li>
            </ul>
        	</div>
	        <div class="row center">
	            <button type="submit" class="btn btn-semi pw-btn">확인</button>
	        </div>
	        <div class="row center">
	            <a href="<%=request.getContextPath() %>/player/login.jsp" class="link link-btn pw-btn">취소</a>
	        </div>
	        <div class="row center">
				<%if(type1){ %>
					<h3 style="color:red;">기존에 사용한 비밀번호입니다.</h3>
				<%} %>
			</div>
        </div>
        <!-- 버튼-->
    </div>
</form>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/footer.jsp"></jsp:include>
