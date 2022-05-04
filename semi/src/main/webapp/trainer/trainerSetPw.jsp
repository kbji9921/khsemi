<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String trainerId = request.getParameter("trainerId"); %>


<h1>비밀번호 재설정</h1>
<form action="trainer/setPw.kh" method="post">
	<input type="hidden" name = "trainerId" value="<%=trainerId%>">
 	<input type="password" name ="trainerPw" required>
	<input type="submit" value="재설정">
</form>
