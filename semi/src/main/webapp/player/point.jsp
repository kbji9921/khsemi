<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<h2>포인트 충전</h2>
	<form action="chargePoint.player" method="post">
		<label>
			충전 포인트:
			<input type="number" name="playerPoint" required>
		</label>
		<br><br>
		<input type="submit" value="충전">
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
