<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<form action="findPw.player" method="post">
		<label>
			아이디:
			<input type="text" name="playerId" required>
		</label>
		<br><br>
		<label>
			닉네임:
			<input type="text" name="playerName" required>
		</label>
		<br><br>
		
		<input type="submit" value="찾기">
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
