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
		<div class="container w450 m30 center">
			<div class="row m30 center">
	           	<h2>새 매칭</h2>
	        </div>
	        <div class="row center m30">
	        	<table class="table table-border">
	        			<tr>
	        				<th>학생명</th>
	        				<td width=50%;>  <input type="text" name="playerName" value="<%=playerDto.getPlayerName()%>" readonly></td>
	        			</tr>
	        			<tr>
	        				<th>강사ID</th>
	        				<td>
								<select name="coachId">
									<option value="">강사선택</option>
									<%for(TrainerDto trainerDto : list){ %>
										<option><%=trainerDto.getTrainerId() %></option>
									<%} %>
								</select>
							</td>
	        			</tr>
	        			<tr>
	        				<th>PT 횟수</th>
	        				<td>
								<select name="matchingDays">
									<option value="">선택하세요</option>	
									<option>10</option>		
									<option>20</option>	
									<option>30</option>	
								</select>
							</td>
	        			</tr>
	        	</table>
	        </div>
	        <div class="row m40 right">
            	<input type="submit" class="btn btn-semi btn-round fill" value="신청">
        	</div>
        </div>
        
		
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>