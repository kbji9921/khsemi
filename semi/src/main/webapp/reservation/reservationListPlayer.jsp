<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    String playerId = request.getParameter("playerId");
    	PlayerDao playerDao = new PlayerDao();
    	PlayerDto playerDto = playerDao.selectOne(playerId);
	    ReservationDao reservationDao = new ReservationDao();
	    List<ReservationDto> list = reservationDao.selectOnePlayer(playerId);
    %>
    
<title>회원 예약 리스트</title>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>


<body>
	<div class="container w600 m30">
		<div class="row center">
			<h2>나의 예약 정보 </h2>
		</div>
	        <div class="flex-container flex-r-vertical display-center">
        	<%for(ReservationDto reservationDto : list){ %>
            <div class="flex-container row m10">
                <!--센터이미지-->
                <div class="row center">
                    <a href="/semi/center/detail.jsp?centerId=<%=reservationDto.getReservationNo()%>">
                    <img src="http://via.placeholder.com/200x200" class="img img-hover img-round">
                    </a>
                </div>
                <div class="list-center-area">
                    <div class="row m30 center">
                    	<a href="/semi/center/detail.jsp?centerId=<%=reservationDto.getReservationDate()%>"></a>
                    </div>
                   	<div class="row m10 center">
                       <h2><%=reservationDto.getReservationDate()%></h2>
                    </div>
                    <div class="row m20 center">
                        <h2><%=reservationDto.getReservationTime()%></h2>
                    </div>  
                    <div class="row m10 center">
                    <%
                    	TrainerDao trainerDao = new TrainerDao();
                    	TrainerDto trainerDto = trainerDao.selectOne(reservationDto.getTrainerId());
                    %>
                        <h2><label>강사명 : <%=trainerDto.getTrainerName()%></label></h2>                   
                        <br>
                        <h2><label>회원명 : <%=playerDto.getPlayerName()%></label></h2>
                    </div>
                    <%--센터 담당 운동 
                    <%for(EocDto eocDto : eocList){ %>
                    <div class="row center list-exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
					<%} %>--%>
                    <!--좋아요 수-->
                </div>
            </div>
         <%} %>
        </div>
    </div>
    </body>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>