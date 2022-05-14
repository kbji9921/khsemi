<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.MatchingDto"%>
<%@page import="semi.servlet.DtoDao.MatchingDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String playerId = request.getParameter("playerId");
	String trainerId = request.getParameter("coachId");
%>

<%
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
	
	TrainerDao trainerDao = new TrainerDao();
	TrainerDto trainerDto = trainerDao.selectOne(trainerId);
	
	MatchingDao matchingDao = new MatchingDao();
	Integer ptcount = matchingDao.selectOne(playerId, trainerId);
	MatchingDto matchingDto = matchingDao.selectCheck(playerId, trainerId);
	boolean statecheck = matchingDto.getMatchingState().length() == 4;
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<jsp:include page="/jsp/template/matchingHeader.jsp"></jsp:include>
<section class="container w850 board-box">
<table border="1" class="board-tb w850 m30">
	<tr>
		<th>강사명</th>
		<th><%=trainerDto.getTrainerName() %></th>
	</tr>
	<tr>
		<th>성별</th>
		<th><%=trainerDto.getTrainerGender() %></th>
	</tr>
	<tr>
		<th>분야</th>
		<th><%=trainerDto.getTrainerSports()%></th>
	</tr>
	<tr>
		<th>PT비용</th>
		<th><input type="number" name="playerPoint" value="<%=trainerDto.getTrainerPrice() %>" readonly></th>
	</tr>
	<tr>
		<th>상태</th>
		<th><%=matchingDto.getMatchingState() %></th>
	</tr>
	<tr>
		<th>연락처</th>
		<th><%=trainerDto.getTrainerPhone() %></th>
	</tr>
	<tr>
		<th>강사이메일</th>
		<th><%=trainerDto.getTrainerEmail()%></th>
	</tr>
	<tr>
		<th>학생명</th>
		<th><%=playerDto.getPlayerName()%></th>
	</tr>
	<tr>
		<th>남은 PT 횟수</th>
		<th><%=ptcount%></th>
	</tr>
</table>
<%if(!statecheck){ %>
   	 <div class="row right">
		<form action="pay.player" method="post">
			<input type="hidden" name="playerId" value="<%=playerId%>">
			<input type="hidden" name="trainerId" value="<%=trainerId%>">
			<input type="hidden" name="playerPoint" value="<%=trainerDto.getTrainerPrice() %>">
			<button type="submit">결제하기</button>
		</form>
   </div>
   <%}else{%>
	   <div class="row center m50">	
	   		<a href="<%=request.getContextPath()%>/reservation/reservationInsert.jsp?playerId=<%=playerId%>&trainerId=<%=trainerId %>" class="btn fill  m30">예약하기</a>
	   		<span>&nbsp;&nbsp;</span>
	   		<a href="matchingList.jsp" class="btn  fill m30">확인</a>
   		</div>
   <%} %>
   <div class="row center">
		<%if(request.getParameter("error") != null){ %>
			<h3 style="color:red;">지불할 포인트가 부족합니다.</h3><br><br>
			<a href="<%=request.getContextPath()%>/player/point.jsp">포인트 충전</a>
		<%} %>
	</div>
</section>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>