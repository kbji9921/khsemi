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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 변경</title>
</head>
<body>
	 <h1>개인정보 변경</h1>
	 
	 <form action="chageinformation.player" method="Post">
		 
		 
		 <label>
		 	닉네임
		    <input type="text" name="playerName" autocomplete="off" required  value="<%=playerDto.getPlayerName()%>">
		</label><br><br>
		
		 <label>
		 	생년월일
		    <input type="date" name="playerBirth" required value="<%=playerDto.getPlayerBirth()%>">
		</label><br><br>
		
		<label>
		 	전화번호
		    <input type="number" name="playerPhone" required value="<%=playerDto.getPlayerPhone()%>">
		</label><br><br>
		
		<label>
		 	이메일
		    <input type="email" name="playerEmail" required value="<%=playerDto.getPlayerEmailString()%>">
		</label><br><br>
		
		<label>
		 	비밀번호 확인
		    <input type="password" name="playerPw" required >
		</label><br><br>
		
		<button value="submit">변경</button>
	
		<% if(request.getParameter("error") != null){ %>
			<h2 style="color:red;">비밀번호가 일치하지 않습니다.</h2>
		<%} %>
	
	</form>
</body>
</html>