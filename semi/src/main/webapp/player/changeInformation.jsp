<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String playerId = (String) session.getAttribute("login");
%>

<%
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
%> 

<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<style>
    .h1{
       font-weight: 500;
       color: #343b6a;
       font-size: 20px;
    }
    
</style>
<jsp:include page="/jsp/template/header.jsp"></jsp:include> 
	 <form action="chageinformation.player" method="Post">
	   <div class="container w600 m30 center"> 
	   
	     <div class="row center">
		  	<h1>개인정보 변경</h1>
		  </div>
		  <div class="row center m50">
				<table class="table table-border table-hover">
					<tr>
						<th>이름 :</th>
						<td> <input type="text" name="playerName" class="form-input" autocomplete="off" required  value="<%=playerDto.getPlayerName()%>"></td>
					</tr>
					<tr>
						<th>성별 :</th>
						<td> <input type="text" name="playerGender" class="form-input" required  placeholder="남/녀" value="<%=playerDto.getPlayerGender()%>"></td>
					</tr>
					<tr>
						<th>생년월일 :</th>
						<td> <input type="date" name="playerBirth" class="form-input" required value="<%=playerDto.getPlayerBirth()%>"></td>
					</tr>
					<tr>
						<th>전화번호 :</th>
						<td><input type="number" name="playerPhone" class="form-input" required value="<%=playerDto.getPlayerPhone()%>"></td>
					</tr>
					<tr>
						<th>이메일 :</th>
						<td>    <input type="email" name="playerEmail" class="form-input" required value="<%=playerDto.getPlayerEmailString()%>"></td>
					</tr>
					<tr>
						<th>비밀번호 확인 :</th>
						<td><input type="password" name="playerPw" class="form-input" required ></td>
					</tr>
	   		</table>
		  </div>
		<div class="row center">
			<button class="btn btn-semi w300" value="submit">변경</button>
		</div>
		<% if(request.getParameter("error") != null){ %>
			<h2 style="color:red;">비밀번호가 일치하지 않습니다.</h2>
		<%} %>
  </div>
</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
