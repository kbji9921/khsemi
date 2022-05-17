<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String playerId = (String) session.getAttribute("login");
String trainerId = request.getParameter("trainerId");

//String trainerName = request.getParameter("trainerName");
%>
<%
PlayerDao playerDao = new PlayerDao();
PlayerDto playerDto = playerDao.selectOne(playerId);
TrainerDao trainerDao = new TrainerDao();
TrainerDto trainerDto = trainerDao.selectOne(trainerId);
%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/trainer.css">
<form action="matching.insert" method="get">
	<input type="hidden" name="playerId" value="<%=playerId%>"> <input
		type="hidden" name="trainerId" value="<%=trainerId%>"> <input
		type="hidden" name="trainerPrice"
		value="<%=trainerDto.getTrainerPrice()%>">
	<div class="container w450 m30 center">
		<div class="row m30 center">
			<h2>새 매칭</h2>
		</div>
		<div class="row center m30">
			<table class="table table-border">
				<tr>
					<th>학생명</th>
					<td><input type="text" value="<%=playerDto.getPlayerName()%>"
						readonly class="matching-input"></td>
				</tr>
				<tr>
					<th>강사ID</th>
					<td><input type="text"
						class="input-round form-input matching-input"
						value="<%=trainerId%>" readonly></td>
				<tr>
					<th>강사명</th>
					<td><input type="text"
						value="<%=trainerDto.getTrainerName()%>" readonly
						class="matching-input"></td>
				</tr>
				<tr>
					<th>종목</th>
					<td><input type="text"
						value="<%=trainerDto.getTrainerSports()%>" readonly
						class="matching-input"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="text"
						value="<%=trainerDto.getTrainerGender()%>" readonly
						class="matching-input"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text"
						value="<%=trainerDto.getTrainerPhone()%>" readonly
						class="matching-input"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text"
						value="<%=trainerDto.getTrainerEmail()%>" readonly
						class="matching-input"></td>
				<tr>
					<th>PT 횟수</th>
					<td><select name="matchingDays" class="matching-input">
							<option>10</option>
							<option>20</option>
							<option>30</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="row m40 right">
			<button type="submit"
				class="btn btn-semi btn-round fill matching-input">신청</button>
		</div>
	</div>
</form>
<div class="row center">
	<%
	if (request.getParameter("error") != null) {
	%>
	<h3 style="color: red;">이미 매칭이 잡힌 아이디입니다.</h3>
	<%
	}
	%>
</div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>