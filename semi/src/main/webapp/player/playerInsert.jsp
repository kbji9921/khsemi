<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 등록</title>
    
</head>
<body>
    <form action="insert.player" method="post">
    	<label>아이디</label><br><br>
    	<input type="text" name="playerId" required placeholder="8~21"><br><br>
    	
    	<label>비밀번호</label><br><br>
    	<input type="password" name="playerPw" required ><br><br>
    	
    	<label>닉네임</label><br><br>
    	<input type="text" name="playerName" required placeholder="2~7"><br><br>
    	
    	<label>생년월일</label><br><br>
    	<input type="date" name="playerBirth" required ><br><br>
    	
    	<label>전화번호</label><br><br>
    	<input type="number" name="playerPhone" required ><br><br>
    	
    	<label>이메일</label><br><br>
    	<input type="email" name="playerEmail"  placeholder="8~21"><br><br>
    	
    	<input type="submit" value="join">
    </form>
</body>
</html>