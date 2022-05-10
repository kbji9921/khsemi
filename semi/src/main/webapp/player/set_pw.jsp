<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playerId = request.getParameter("playerId");
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<form action="set_pw.player" method="post">
		<input type="hidden" name="playerId" value="<%=playerId %>">
		<div class="container w450 m30 center">
	        <div class="row">
	            <label>새 비밀번호</label>
	            	<input type="password" name="changePw" required autocomplete="off" class="form-input fill input-round" >
	        </div>
	        <div class="row">
	            <label>비밀번호 확인</label>
	            	<input type="password" name="checkPw" required autocomplete="off" class="form-input fill input-round" >
	        </div>
	        <div class="row">
				 <input type="submit" class="btn btn-semi btn-round fill" value="변경하기">
	        </div>
        </div>
        <div class="row center">
			<%if(request.getParameter("error") != null){ %>
				<h3 style="color:red;">비밀번호가 동일하지 않습니다.</h3>
			<%} %>
	</div>
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
