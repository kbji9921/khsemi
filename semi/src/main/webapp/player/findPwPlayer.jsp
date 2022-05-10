<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<form action="findPw.player" method="post">
		<div class="container w450 m30 center">
			<div class="row center m30">
				<h2>비밀번호 찾기</h2>
			</div>
	        <div class="row">
	            <label>아이디</label>
	            	<input type="text" name="playerId" required autocomplete="off" class="form-input fill input-round" >
	        </div>
	        
	        <div class="row">
	            <label>이름</label>
	            	<input type="text" name="playerId" required autocomplete="off" class="form-input fill input-round" >
	        </div>
	        
	        <div class="row">
	            <label>전화번호</label>
	            	<input type="text" name="playerPhone" required autocomplete="off" class="form-input fill input-round" >
	        </div>
	        
	        <div class="row m40">
            	<input type="submit" class="btn btn-semi btn-round fill" value="비밀번호 찾기">
       	 	</div>
        </div>
		<div class="row center">
       		<%if(request.getParameter("error") != null){ %>
				<h3 style="color:red;">입력한 정보를 찾을 수 없습니다.</h3>
			<%} %>
		</div>
	</form>
	
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
