<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/commons.css">
<style>
h1{
   font-weight: 500;
   color: #343b6a;
   font-size: 20px;
   text-align: left;
}
</style>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	
	<form action="delete.player" method="post">
	
	  <div class="container w450 m30 center">
	  <h1>비밀번호 확인</h1>
	
	     <div class="row">
	           <input type="password" name="playerPw" required>
	     </div>
	
	     <div class="row m20">
		       <input type="submit" class="btn btn-semi btn-round" value="탈퇴하기">
	     </div>		
	
	   </div>
	</form>
	
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
