<%@page import="semi.servlet.DtoDao.ReservationDao"%>
<%@page import="semi.servlet.DtoDao.ReservationDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	// String playerId=(String)request.getSession().getAttribute("login");
    String playerId="test1234";
    //String trainerId=request.getParameter("trainerId");
    String trainerId="testuser6";
    TrainerDao trainerDao = new TrainerDao();
    TrainerDto trainerDto = trainerDao.selectOne(trainerId);
    PlayerDao playerDao = new PlayerDao();
    PlayerDto playerDto = playerDao.selectOne(playerId);
    
  
    %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    
    <style>
    html{
        background-color: #F5F6F7;
    }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<link rel="stylesheet" type="text/css" href="../css/common.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
 
<script>
         $(function() {
              $("#time1").timepicker({
        		timeFormat: 'h:mm p',
        		interval: 60,
        		minTime: '09',
        		maxTime: '10:00pm',
      		 	defaultTime: '09',
       			startTime: '09:00',
        		dynamic: false,
        		dropdown: true,
        		scrollbar: true        
    		});
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: false //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImageOnly: false //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "날짜 선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+7D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
            });                    
            
            //초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('+1D', '+7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
       });


  </script>
</head>
<body>
    <form action="insert.kh" method="post">
    <div class="container w450">
        <div class="row center">
        <h1>예약</h1>
        </div>
        <div class="row">
            <label>강사</label>
            <%=trainerDto.getTrainerName()%>
            <input type="hidden" name="trainerId" value=<%=trainerDto.getTrainerId()%>>
        </div>
        <div class="row">
            <label>회원</label>
            <%=playerDto.getPlayerName()%>
            <input type="hidden" name="playerId" value=<%=playerDto.getPlayerId()%>>
        </div>
        <div class="row">
        <label>날짜 선택</label>
            <input id="datepicker" name="reservationDate" class="form-input input-round fill">
        </div>
        <div class="row">
          <label for="time">시간 선택</label>
      	 <select name="reservationTime" class="form-input input-round fill">
      	 	<option>09:00AM</option>
      	 	<option>10:00AM</option>
      	 	<option>11:00AM</option>
      	 	<option>12:00PM</option>
      	 	<option>01:00PM</option>
      	 	<option>02:00PM</option>
      	 	<option>03:00PM</option>
      	 	<option>04:00PM</option>
      	 	<option>05:00PM</option>
      	 	<option>06:00PM</option>
      	 	<option>07:00PM</option>
      	 	<option>08:00PM</option>
      	 	<option>09:00PM</option>
      	 	
      	 </select>
        </div>
        <div class="row m40">
            <input type="submit" class="btn btn-semi btn-round fill" value="예약">
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