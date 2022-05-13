<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playerId = (String) session.getAttribute("login");
%>
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<style>
h1{
   font-weight: 500;
   color: #343b6a;
   font-size: 20px;
}
</style>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	
<form action="delete.player" method="post">
	<input type="hidden" name="playerId" value="<%=playerId %>">

  <div class="container w450 m30 center">
  	 <div class="row center m30">
  		<h1>정말 탈퇴하실 건가요?</h1>
     </div>

     <div class="row center m30">
     		<label>비밀번호 </label>
           <input type="password" name="playerPw" required>
     </div>
     
     <div class="row center m30">
     		<label>비밀번호 확인 </label>
           <input type="password" name="checkPw" required>
     </div>

     <div class="row m30 center">
	       <input type="submit" class="btn btn-round btn-danger w300" value="탈퇴하기">
     </div>		
   </div>
</form>
	
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
