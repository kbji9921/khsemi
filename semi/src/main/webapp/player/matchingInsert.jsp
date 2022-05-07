<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String studentId = (String) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>matching</title>
</head>
<body>
	<form action="matching.insert" method="post">
		<label>
			학생 아이디
			<input type="text" name="studentId" value="<%=studentId %>" readonly>
		</label>
		
		<br><br>
		
		<label>
			강사 아이디
			<select name="coachId">
				<option>testuser6</option>
				<option>testuser1</option>
				<option>testuser2</option>
			</select>
		</label>
		
		<br><br>
		
		<label>
			PT 횟수
			<select name="matchingDays">
				<option>10</option>	
				<option>20</option>
				<option>30</option>		
			</select>
		</label>
		
		<br><br>
		
		<button value="submit">매칭</button>
	</form>
</body>
</html>