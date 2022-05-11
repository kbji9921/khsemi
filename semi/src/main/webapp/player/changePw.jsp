<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String playerId = (String) session.getAttribute("login");
	
	String error = request.getParameter("error");
	boolean type1 = error != null && error.equals("1");
	boolean type2 = error != null && error.equals("2");
	boolean type3 = error != null && error.equals("3");
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
   
	 <form action="password.player" method="post">
	  <div class="container w450 m30 center">
	    <div class="row">
	      <h1>비밀번호 변경</h1>
	 	  <input type="hidden" name="playerId" value="<%=playerId%>">
	   </div>
	  
	  <div class="row m30">  
	  <label>
	  		현재 비밀번호
	 		<input type="password" name="currentPw" class="form-input" required >
	 </label>
	 </div>
	 
	 <br>
	 
	 <div class="row m0">
	 <label>
	  		바꿀 비밀번호
	 		<input type="password" name="changePw" class="form-input" required >
	 </label>
	 </div>
	 
	 <br><br>
	 
	 <div >
	 <button class="btn btn-semi" value="submit" >비밀번호 변경</button>
	 </div>
		   <%if(type1){ %>
		   
				<h3 style="color:red;">현재 비밀번호와 같은 비밀번호로 변경할 수 없습니다</h3>
			
			<%} %>
			
			<%if(type2){ %>
			
				<h3 style="color:red;">입력하신 정보는 조건에 맞지 않습니다.</h3>
			
			<%} %>
			
			<%if(type3){ %>
			
				<h3 style="color:red;">사용중인 비밀번호가 다릅니다.</h3>
			
			<%} %>
		</div>
	 </form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>