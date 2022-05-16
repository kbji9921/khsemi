<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String playerId = (String)request.getSession().getAttribute("login");
    	int playerPoint = Integer.parseInt(request.getParameter("playerPoint"));
    %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<style>
h2{
   font-weight: 600;
   color: #343b6a;
   font-size: 20px;
}
</style>

    <form action="returnPoint.player" method="post">
    <input type="hidden" name="playerId" value="<%=playerId%>">
    
    <div class="container w450 m30 center">
	    <div class="row m20 center">
			<h2>포인트 환불</h2>
		</div>
		<div class="row center m30">
			<label>
				환불 포인트:
				<input type="number" class="form-input" name="playerPoint" value="<%=playerPoint %>" readonly>
			</label>
		</div>
		
		<div class="row m50 center">
		<input type="submit" class="btn btn-semi btn-round w300" value="환불">
		<br><br>
		</div>
		</div>
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
