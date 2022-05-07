<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String playerId = (String) session.getAttribute("login");
	
	String error = request.getParameter("error");
	boolean type1 = error != null && error.equals("1");
	boolean type2 = error != null && error.equals("2");
	boolean type3 = error != null && error.equals("3");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	
	 <h1>비밀번호 변경</h1>
	 
	 <form action="password.player" method="post">
	 	<input type="hidden" name="playerId" value="<%=playerId%>">
	 
	  <label>
	  		현재 비밀번호
	 		<input type="password" name="currentPw" required >
	 </label>
	 <br><br>
	 
	 <label>
	  		바꿀 비밀번호
	 		<input type="password" name="changePw" required >
	 </label>
	 <br><br>
	 
	 <button value="submit">비밀번호 변경</button>
	 
		   <%if(type1){ %>
		   
				<h3 style="color:red;">현재 비밀번호와 같은 비밀번호로 변경할 수 없습니다</h3>
			
			<%} %>
			
			<%if(type2){ %>
			
				<h3 style="color:red;">입력하신 정보는 조건에 맞지 않습니다.</h3>
			
			<%} %>
			
			<%if(type3){ %>
			
				<h3 style="color:red;">사용중인 비밀번호가 다릅니다.</h3>
			
			<%} %>
	 </form>
	 
	 
	 
</body>
</html>