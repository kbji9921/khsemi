<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playerId = (String) session.getAttribute("login");
%>
<%
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);

	TrainerDao trainerDao = new TrainerDao();
	List<TrainerDto> list = trainerDao.selectList();
%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<form action="matching.insert" method="post">
		<input type="hidden" name="playerId" value="<%=playerId%>">
		
		<label>
			학생이름:
			<input type="text" name="playerName" value="<%=playerDto.getPlayerName()%>" readonly>
		</label>
		
		<br><br>
		
		<label>
			강사아이디:
			<select name="coachId">
				<option value="">강사선택</option>
				<%for(TrainerDto trainerDto : list){ %>
					<option><%=trainerDto.getTrainerId() %></option>
				<%} %>
			</select>
		</label>
	
		<br><br>
		
		<label>
			PT 횟수:
			<select name="matchingDays">
				<option value="">선택하세요</option>	
						<option>10</option>		
						<option>20</option>	
						<option>30</option>	
			</select>
		</label>
		
		<br><br>
		
		<button value="submit">신청</button>
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>