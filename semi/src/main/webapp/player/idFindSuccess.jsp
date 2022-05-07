<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String playerId = request.getParameter("playerId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 확인</title>
</head>
<body>
	<h1>아이디 찾기 결과</h1><br><br>
	<h1><%=playerId%></h1>
	
	<hr>
	
	<h2><a href="login.jsp">로그인</a></h2>
	<h2><a href="<%=request.getContextPath() %>">메인</a></h2>
</body>
</html>