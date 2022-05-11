<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.MatchingDto"%>
<%@page import="semi.servlet.DtoDao.MatchingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String playerId = (String)session.getAttribute("login");
%>

<%
	MatchingDao matchingDao = new MatchingDao();
	//MatchingDto matchingDto = matchingDao.selectList(playerId);
	List<MatchingDto> list = matchingDao.selectList(playerId);
	
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<div class="container w800 m30 center">
	   <div class="row center">
	   		<h2>내 매칭 강사</h2>
	   </div>
	     <div class="row right">
	   		<a href="matchingInsert.jsp">매칭 추가</a>
	   </div>
	   <div class="row m30 center">
	   		<table class="table table-border table-hover">
	   			<thead>
	   				<tr>
						<th>매칭번호</th>
						<th>학생이름</th>
						<th>강사이름</th>
						<th>메칭일</th>
						<th>교육수</th>
						<th>상태</th>
						<th>비고</th>
					</tr>
	   			</thead>
	   			<tbody>
	   					<%for(MatchingDto matchingDto  : list){ %>
						<%
						TrainerDao trainerDao = new TrainerDao();
						TrainerDto trainerDto = trainerDao.selectOne(matchingDto.getCoachId());
						%>
						<tr>
							<td><%=matchingDto.getMatchingNo() %></td>
							<td><%=playerDto.getPlayerName() %></td>
							<td><%=trainerDto.getTrainerName() %></td>
							<td><%=matchingDto.getMatchingDate() %></td>
							<td><%=matchingDto.getMatchingDays() %></td>
							<td><%=matchingDto.getMatchingState() %></td>
							<td>
								<a href="matchingDetail.jsp?playerId=<%=playerId%>&coachId=<%=matchingDto.getCoachId()%>">결제하기</a>
							</td>
						</tr>
					<%} %>
	   			</tbody>	
	   		</table>
	   </div>
	   <div class="row right">
	   		<a href="matchingInsert.jsp">매칭 추가</a>
	   </div>
	</div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
