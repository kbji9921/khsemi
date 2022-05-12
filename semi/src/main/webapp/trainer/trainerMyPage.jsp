<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%-- 준비 --%>
<%
String trainerId = "testuser6";
//String trainerId= (String)request.getSession().getAttribute("trainer");
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
        }
        .img-wrapper{
            width:25%;
        }
        .contents-wrapper{
            flex-grow:1; /*나머지 전부 다 라는 의미로 쓰임 */
        }
        .container{
            border:1px solid black;
        }
        .list-center-area{
        width:100%;}
        .hide{
            display:none;
        }
        input:disabled{
            background-color: #F0F0F0;
        }
    </style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <link rel="stylesheet" type="text/css" href="../css/sidebar.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
    $(function(){
        $(".input-dis").attr("disabled", true);
    	$("#btn").  click(function(event){
            $(".input-dis").attr("disabled", false);
            event.preventDefault();
            $("#btn").addClass("hide")
            $('#btn2').removeClass("hide")
            
    	});
    })
    </script>
</head>
<body>  
    <div class="row m30">
        <label for ="tg" class="toggle-label"><img src="../images/menu.png" width="30"></label>
        <input type="checkbox" class="toggle-sidebar" id="tg">
        <div class="sidebar">
            <div class="row m50">
            </div>
            <div class="row">
                <button class="btn btn-round fill" onclick="location.href='<%=request.getContextPath()%>'">홈으로</button>
            </div>
            <div class="row">
                <button class="btn btn-round fill" onclick="location.href='trainerChangeInformation.jsp'">변경</button>
            </div>
            <div class="row">
            <button class="btn btn-round fill" onclick="location.href='<%=request.getContextPath()%>/reservation/reservationList.jsp?trainerId=<%=trainerId%>'">스케쥴</button>
        </div>
            <div class="row">
                <button class="btn btn-round fill" onclick="location.href='trainerSetPw.jsp?trainerId=<%=trainerId%>'">비밀번호 변경</button>
            </div>
        <div class="row">
            <button class="btn btn-round fill btn-danger" onclick="location.href='trainerDelete.jsp?trainerId=<%=trainerId%>'">회원 탈퇴</button>
        </div>
    </div>
</div>

<form>
    <div class="container w600 m30">
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
  <div class="container w600 m30">
        <div class="row">
            	 <div class="row">
                    <label>아이디</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerId()%>" >
            	 </div>
	 				<div class="row">
                    <label>이름</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerName()%>">
            	 </div>
 	 				<div class="row">
                    <label>생년월일</label>
                    <input type="date" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerBirth()%>">
            	 </div>
            	 <div class="row">
                    <label>전화번호</label>
                    <input type="tel" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerPhone()%>">
            	 </div>
 	 			<div class="row">
                    <label>이메일</label>
                    <input type="email" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerEmail()%>">
      	 		<div class="row">
                    <label>운동종목</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerSports()%>">
            	 </div>
       	 		<div class="row">
                    <label>성별</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerGender()%>">
            	 </div>
    	 		<div class="row">
                    <label>가입일</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerJoindate()%>">
            	 </div>
              	 <div class="row">
                    <label>최근접속일</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=trainerDto.getTrainerLogindate()%>">
            	 </div>
        </div>
    </div>
    <button class="btn btn-semi full" id="btn">수정</button>
    <button class="btn btn-semi full hide" id="btn2" >변경완료</button>
    </div>
</form>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>