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
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
			<table border="1">
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
		<form action="pay.player" method="post">
			<input type="hidden" name="playerId" value="<%=playerId%>">
			<input type="hidden" name="trainerId" value="<%=trainerId%>">
			<input type="hidden" name="playerPoint" value="<%=trainerDto.getTrainerPrice() %>">
			<button type="submit">결제하기</button>
		</form>
	<br><br>
	<form action="matchingDelete.player" method="post">
		<input type="hidden" name="playerId" value="<%=playerId%>">
		<input type="hidden" name="trainerId" value="<%=trainerId%>">
		<button type="submit">삭제</button>
	</form>
	<a href="<%=request.getContextPath()%>">메인</a>
	<a href="matchingList.jsp">내 일정</a>
	<a href="mypage.jsp">내정보</a>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>