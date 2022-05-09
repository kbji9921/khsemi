<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<h1>비밀번호 확인</h1>
	<form action="delete.player" method="post">
		<input type="password" name="playerPw" required>
		<input type="submit" value="탈퇴하기">
	</form>
</body>
</html>