<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String playerId = (String) session.getAttribute("login");
%>

<%
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
%> 

<link rel="stylesheet" type="text/css" href="../css/reset.css">
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
	 <form action="chageinformation.player" method="Post">
	   <div class="container w450 m30 center"> 
	     <div class="row">
		  <h1>개인정보 변경</h1>
		  </div>
		  
		  <div class="row">
		 <label>
		 	이름:
		    <input type="text" name="playerName" class="form-input" autocomplete="off" required  value="<%=playerDto.getPlayerName()%>">
		</label>
		 </div>
		  
		<br><br>
		
		<div>
		  <label>
		  	  <input type="text" name="playerGender" class="form-input" required  placeholder="남/녀" value="<%=playerDto.getPlayerGender()%>">
		  </label>
		   <label>
		 	  생년월일:
		      <input type="date" name="playerBirth" class="form-input" required value="<%=playerDto.getPlayerBirth()%>">
		  </label>
		</div>
		
		<br><br>
		
		<div class="row left">
		  <label>
		 	  전화번호:
		      <input type="number" name="playerPhone" class="form-input" required value="<%=playerDto.getPlayerPhone()%>">
		  </label>
		 </div>
		
		<br><br>
		
		<div class="row left">
		  <label>
		 	  이메일:
		      <input type="email" name="playerEmail" class="form-input" required value="<%=playerDto.getPlayerEmailString()%>">
		  </label>
		</div>
		
		<br><br>
		
		<div class="row left">
		  <label>
		 	  비밀번호 확인:
		      <input type="password" name="playerPw" class="form-input" required >
		  </label>
		</div>
		
		<br><br>
		
		<div>
		<button class="btn btn-semi" value="submit">변경</button>
	
		<% if(request.getParameter("error") != null){ %>
			<h2 style="color:red;">비밀번호가 일치하지 않습니다.</h2>
		<%} %>
		</div>
	  </div>
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
