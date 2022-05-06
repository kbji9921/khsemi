<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<form action="findPw.player" method="post">
		<label>
			아이디:
			<input type="text" name="playerId" required>
		</label>
		<br><br>
		<label>
			닉네임:
			<input type="text" name="playerName" required>
		</label>
		<br><br>
		
		<input type="submit" value="제출">
	
		<% if(request.getParameter("error") != null){%>
			<h3> 입력한 정보와 일치하는 데이터가 없습니다.</h3>
		<%} %>
	</form>
</body>
</html>