<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String playerId = request.getParameter("playerId");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 확인</title>
</head>
<body>
	<label>
		아이디:
		<%=request.getParameter(playerId) %>
	</label>
</body>
</html>