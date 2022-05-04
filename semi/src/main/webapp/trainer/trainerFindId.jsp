<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
	<h1>아이디 찾기</h1>
	<form action="find_id.kh"  method="post">
	<table >
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="trainerName" required>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="tel" name="trainerPhone" required>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="email" name="trainerEmail" required>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="submit">아이디 찾기</button>
			</td>
		</tr>	
	</table>
	</form>
<%if(request.getParameter("error")!=null){ %>
<h3>정보가 일치하는 아이디가 존재하지 않습니다</h3>
<%} %>