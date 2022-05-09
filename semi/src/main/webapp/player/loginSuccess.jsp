<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<h1>로그인 성공</h1>
	<form action="logout.player" method="get">
		<button type="submit">로그아웃</button>
	</form>
		<br><br>
	<a href="mypage.jsp">내정보</a>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
