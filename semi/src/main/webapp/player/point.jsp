<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<style>
h2{
   font-weight: 600;
   color: #343b6a;
   font-size: 20px;
}
</style>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>

    <form action="chargePoint.player" method="post">
    
    <div class="container w450 m30 center">
	    <div class="row m20 center">
			<h2>포인트 충전</h2>
		</div>
	
		<div class="row center m30">
			<label>
				충전 포인트:
				<input type="number" class="form-input" name="playerPoint" required>
			</label>
		</div>
		
		<div class="row m50 center">
		<input type="submit" class="btn btn-semi btn-round w300" value="충전">
		</div>
		</div>
	</form>
	
	
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
