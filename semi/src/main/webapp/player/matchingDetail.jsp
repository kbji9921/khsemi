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
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
		<div class="container w800 m30 center">
		   <div class="row center">
<%-- 		   		<h2><%=trainerDto.getTrainerName() %> 강사 상세 매칭 정보</h2> --%>
		   </div>
		   
		<div class="row m30 center">
	   		<table class="table table-border table-hover">
				<tr>
					<th>강사명</th>
					<td><%=trainerDto.getTrainerName() %></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><%=trainerDto.getTrainerGender() %></td>
				</tr>
				<tr>
					<th>분야</th>
					<td><%=trainerDto.getTrainerSports()%></td>
				</tr>
				<tr>
					<th>PT비용</th>
					<td><input type="number" name="playerPoint" value="<%=trainerDto.getTrainerPrice() %>" readonly></td>
				</tr>
				<tr>
					<th>상태</th>
					<td><%=matchingDto.getMatchingState() %></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><%=trainerDto.getTrainerPhone() %></td>
				</tr>
				<tr>
					<th>강사이메일</th>
					<td><%=trainerDto.getTrainerEmail()%></td>
				</tr>
				<tr>
					<th>학생명</th>
					<td><%=playerDto.getPlayerName()%></td>
				</tr>
				<tr>
					<th>남은 PT 횟수</th>
					<td><%=ptcount%></td>
				</tr>
	   		</table>
	   </div>
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
	</div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>