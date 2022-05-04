<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="login.player" method="post">
		<label>
			아이디
			<input type="text" name="playerId" required placeholder="8~21">
		</label>
		
		<br><br>
		
		<label>
			아이디
			<input type="password" name="playerPw" required >
		</label>
		
		<br><br>
		
		<input type="submit" value="로그인">
	
	</form>
	
	<label>
		<a href="findIdPlayer.jsp">아이디 찾기</a>
	</label>
	
	<br><br>
	
	<label>
		<a href="findPwPlayer.jsp">비밀번호 찾기</a>
	</label>
</body>
</html>