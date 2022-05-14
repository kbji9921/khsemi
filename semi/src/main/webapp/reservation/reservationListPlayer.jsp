<%@page import="semi.servlet.DtoDao.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    String playerId = request.getParameter("playerId");
	    ReservationDao reservationDao = new ReservationDao();
	    List<ReservationDto> list = reservationDao.selectOnePlayer(playerId);
    %>
    <jsp:include page="/jsp/template/header.jsp"></jsp:include>

<title>회원 예약 리스트</title>
<style>
.list-center-area{
width:100%;
}
</style>
<body>
	<div class="container w500 m30">
		<div class="row center">
			<h2>스케쥴 목록</h2>
		</div>
	        <div class="flex-container flex-vertical">
        	<%for(ReservationDto reservationDto : list){ %>
            <div class="flex-container list-center-listbox">
                <!--센터이미지-->
                <div class="row center list-image-area">
                    <a href="/semi/center/detail.jsp?centerId=<%=reservationDto.getReservationNo()%>">
                    <img src="http://via.placeholder.com/150x150" class="img img-hover img-round">
                    </a>
                </div>
                <div class="list-center-area">
                    <div class="row m30 center">
                    <a href="/semi/center/detail.jsp?centerId=<%=reservationDto.getReservationDate()%>">
                        <h2><%=reservationDto.getReservationDate()%></h2>
                        <h2><%=reservationDto.getReservationTime()%></h2>
                        </a>
                    </div>
                    <div class="row center">
                        <h4><%=reservationDto.getTrainerId()%>&nbsp;<%=reservationDto.getPlayerId()%></h4>
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