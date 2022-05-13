	<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%-- 준비 --%>
<%
//String trainerId = "testuser6";
String trainerId= (String)request.getSession().getAttribute("trainer");
%>    
    
    <%-- 처리 --%>
<%
TrainerDao trainerDao = new TrainerDao();
TrainerDto trainerDto = trainerDao.selectOne(trainerId);
%> 
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 변경</title>
    <style>
        .flex-container{
            padding: 1em;
            background-color: #343b6a;
            color: white;
            border-radius: 0.3em;
        }
        .img-wrapper{
            width:25%;
        }
        .contents-wrapper{
            flex-grow:1; /*나머지 전부 다 라는 의미로 쓰임 */
        }
        /* .Container{
            /* border:1px solid black; 
        } */
        .list-center-area{
        width:100%;}
        .hide{
            display:none;
        }
        input:disabled{
            background-color: #F0F0F0;
        }
        .btn{
            height:40px;
            border-radius: 0.25em;
        }
        .color{
            background-color: #343b6a;
            height: 50px;
        }
        .color img{
            padding-left: 1em;
            height:50px;
        }
        ul.menu{
            background-color: white !important;
        }
        ul.menu li:hover{
            background-color: white !important;
            
        }
        ul.menu a{
            color:#343b6a !important;
            overflow: visible !important;
        }
        ul.menu a:hover{
            color: red !important;
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
        $(".input-dis").attr("disabled", true);
    	$("#btn").click(function(event){
            $(".input-dis").attr("disabled", false);
            $("#btn").addClass("hide")
            $('#btn2').removeClass("hide")
            $('#btn3').removeClass("hide")
            event.preventDefault();
    	});
        $('#btn3').click(function(event){
            $(".input-dis").attr("disabled", true);
            $("#btn").removeClass("hide")
            $('#btn2').addClass('hide')
            $('#btn3').addClass('hide')
        });
    })
    </script>
</head>
<body>  
<form class="join-form">
    <div class="color">
        <a href="메인페이지 이동"><img src="../image/ci_main_logo.png"></a>
        <ul class="menu">
            <li><a herf="#">정보 수정</a></li>
            <li><a href="#">이력 관리</a></li>
            <li><a href="#">비밀번호 변경</a></li>
            <li><a href="#">탈퇴</a></li>
        </ul>
    </div>
    <div class="container w400 m30">
            <div class="flex-container flex-vertical">
            <div class="flex-container list-center-listbox">
                <!--센터이미지-->
                <div class="row center list-image-area">
                    <img src="http://via.placeholder.com/150x150" class="img img-hover img-round">
                </div>
                <div class="list-center-area display-center">
					<div class="row center">
					<h2><%=trainerDto.getTrainerName()%>님	</h2>
					</div>
					</div>
                </div>
      
            </div>
        </div>
        <!--  -->
  <div class="container w400 m30">
        <div class="row">
            	 <div class="row">
                    <label>아이디</label>
                    <input type="text" class="form-input input-round fill" value="<%=trainerDto.getTrainerId()%>" disabled>
                    <span></span>
            	 </div>
	 				<div class="row">
                    <label>이름</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerName()%>">
                    <span></span>
            	 </div>
 	 				<div class="row">
                    <label>생년월일</label>
                    <input type="date" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerBirth()%>">
                    <span></span>
            	 </div>
            	 <div class="row ">
                    <label>전화번호</label>
                    <input type="tel" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerPhone()%>">
                    <span></span>
            	 </div>
 	 			<div class="row ">
                    <label>이메일</label>
                    <input type="email" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerEmail()%>">
                    <span></span>
      	 		<div class="row ">
                    <label>운동종목</label>
                    <select class="form-input input-round full input-dis">
                        <option value="<%=trainerDto.getTrainerSports()%>" >선택</option>
                        <option>요가</option>
                        <option>헬스</option>
                        <option>필라테스</option>
                        <option>수영</option>
                        <option>테니스</option>
                    </select>
            	 </div>
       	 		<div class="row ">
                    <label>성별</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerGender()%>">
                    <span></span>
            	 </div>
    	 		<div class="row ">
                    <label for="logindate">가입일</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerJoindate()%>" id="logindate">
                    <span></span>
            	 </div>
              	 <div class="row ">
                    <label>최근접속일</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerLogindate()%>">
                    <span></span>   
            	 </div>
        </div>
    </div>
    <div class="row">
        <button class="btn btn-semi fill" id="btn">수정</button>
        <button class="btn btn-semi fill hide" id="btn2" >변경완료</button>
    </div>
    <div class="row">
        <button class="btn btn-secondary fill hide" id="btn3">취소</button>
    </div>
    </div>
</form>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>