<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<h1>비밀번호 확인</h1>
	<form action="delete.player" method="post">
		<input type="password" name="playerPw" required>
		<input type="submit" value="탈퇴하기">
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
