<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.MatchingDto"%>
<%@page import="semi.servlet.DtoDao.MatchingDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String playerId = (String)session.getAttribute("login");
%>

<%
	// matching테이블 회원 아이디로 List 조회
	MatchingDao matchingDao = new MatchingDao();
	//MatchingDto matchingDto = matchingDao.selectList(playerId);
	List<MatchingDto> list = matchingDao.selectList(playerId);
	
	//회원 이름 조회
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
	
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<div class="container w800 m30 center">
	   <div class="row center">
	   		<h2>내 매칭 강사</h2>
	   </div>
	     <div class="row right m30">
	   		<a href="<%=request.getContextPath()%>/reservation/reservationListPlayer.jsp?playerId=<%=playerId%>">내 예약 정보</a>
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
							<th>결제</th>
							<th>비고</th>
						</tr>
	   			</thead>
	   			<tbody>
	   					<%for(MatchingDto matchingDto  : list){ %>
						<tr>
							<%
								TrainerDao trainerDao = new TrainerDao();
								TrainerDto trainerDto = trainerDao.selectOne(matchingDto.getCoachId()); 
							%>
							<td><%=matchingDto.getMatchingNo() %></td>
							<td><%=playerDto.getPlayerName() %></td>
							<td><%=trainerDto.getTrainerName() %></td>
							<td><%=matchingDto.getMatchingDate() %></td>
							<td><%=matchingDto.getMatchingDays() %></td>
							<td><%=matchingDto.getMatchingState() %></td>
							<td>
								<a href="matchingDetail.jsp?playerId=<%=playerId%>&coachId=<%=matchingDto.getCoachId()%>">확인</a>
							</td>
							<td>
							   <form action="matchingDelete.player" method="post">
									<input type="hidden" name="playerId" value="<%=playerId%>">
									<input type="hidden" name="trainerId" value="<%=matchingDto.getCoachId()%>">
									<button type="submit">삭제</button>
								</form>
							</td>
						</tr>
						<%} %>
	   			</tbody>	
	   		</table>
	   </div>
	   <div class="row right">
	   		<a href="<%=request.getContextPath()%>">매칭 찾기</a>
	   </div>
	   	<div class="row center">
			<%if(request.getParameter("error") != null){ %>
				<h3 style="color:red;">결제한 내역은 지울수 없습니다.</h3>
			<%} %>
		</div>
	</div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>