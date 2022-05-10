<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playerId = request.getParameter("playerId");
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<form action="set_pw.player" method="post">
		<input type="text" name="playerId" value="<%=playerId %>">
		
		<input type="password" name="changePw" required placeholder="새 비밀번호">
		<br><br>
		<button type="submit">비밀번호 재설정</button>
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
