<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String playerId = (String)session.getAttribute("login");
%> 

<%
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
</head>
<body>
	<h2>내정보</h2>
	
	<label>
		아이디
		<%=playerDto.getPlayerId() %>
	</label>
	<br><br>
	
	<label>
		닉네임
		<%=playerDto.getPlayerName() %>
	</label>
	<br><br>
	
	<label>
		생년월일
		<%=playerDto.getPlayerBirth() %>
	</label>
	<br><br>
	
	<label>
		전화번호
		<%=playerDto.getPlayerPhone() %>
	</label>
	<br><br>
	
	<label>
		이메일
		<%=playerDto.getPlayerEmail() %>
	</label>
	<br><br>
	
	<label>
		등급
		<%=playerDto.getPlayerGrade() %>
	</label>
	<br><br>
	
	<label>
		포인트
		<%=playerDto.getPlayerPoint() %>
	</label>
	<br><br>
	
	<label>
		회원가입 일자
		<%=playerDto.getPlayerJoindate() %>
	</label>
	<br><br>
	
	<label>
		최근 접속일
		<%=playerDto.getPlayerLogindate() %>
	</label>
	<br><br>
	
	<h2><a href="loginSuccess.jsp">로그인 메인</a></h2><br><br>
	<h2><a href="changePw.jsp">비밀번호 변경</a></h2><br><br>
	<h2><a href="changeInformation.jsp">개인정보 변경</a></h2><br><br>
	<h2><a href="point.jsp">포인트 충전</a></h2><br><br>
	<h2><a href="deletePlayer.jsp">탈퇴하기</a></h2><br><br>
	
	<h2><a href="matchingList.jsp?studentId=<%=playerId %>">내 일정</a></h2>
</body>
</html>