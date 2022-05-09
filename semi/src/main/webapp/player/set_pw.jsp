<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playerId = request.getParameter("playerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>
	<form action="set_pw.player" method="post">
		<input type="text" name="playerId" value="<%=playerId %>">
		
		<input type="password" name="changePw" required placeholder="새 비밀번호">
		<br><br>
		<button type="submit">비밀번호 재설정</button>
	</form>
</body>
</html>