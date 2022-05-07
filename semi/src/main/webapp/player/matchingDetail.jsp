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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matching Detail</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>강사명</th>
			</tr>
			<tr>
				<th>성별</th>
			</tr>
			<tr>
				<th>분야</th>
			</tr>
			<tr>
				<th>PT비용</th>
			</tr>
			<tr>
				<th>연락처</th>
			</tr>
			<tr>
				<th>강사이메일</th>
			</tr>
			<tr>
				<th>학생명</th>
			</tr>
			<tr>
				<th>남은 PT 횟수</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td><%=trainerDto.getTrainerName() %></td>
			</tr>
			<tr>
				<td><%=trainerDto.getTrainerGender() %></td>
			</tr>
			<tr>
				<td><%=trainerDto.getTrainerSports()%></td>
			</tr>
			<tr>
				<td><%=trainerDto.getTrainerPrice() %></td>
			</tr>
			<tr>
				<td><%=trainerDto.getTrainerPhone() %></td>
			</tr>
			<tr>
				<td><%=trainerDto.getTrainerEmail()%></td>
			</tr>
			<tr>
				<td><%=playerDto.getPlayerName()%></td>
			</tr>
			<tr>
				<td><%=ptcount%></td>
			</tr>
		</tbody>
	</table>
</body>
</html>