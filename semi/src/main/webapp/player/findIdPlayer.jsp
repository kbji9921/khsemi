<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>

	<form action = "findId.player" method="post">
		<label>
			닉네임
			<input type="text" name="playerName" required placeholder = "사용한 닉네임">
		</label>
		<br><br>
		<label>
			전화번호
			<input type="number" name="playerPhone" required placeholder="본인 전화번호">
		</label>
		<input type="submit" value="찾기"></input>
	
		<%if(request.getParameter("error") != null){ %>
		
			<h3 style="color:red;">정보가 일치하는 아이디가 존재하지 않습니다</h3>
		
		<%} %>
	</form>
	
</body>
</html>