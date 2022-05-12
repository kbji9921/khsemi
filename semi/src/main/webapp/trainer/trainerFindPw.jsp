<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
    
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<h1>비밀번호 찾기</h1>
<form action = "find_pw.kh" method="post">
<table>
	<tr>
		<th>아이디 입력</th>
		<td>
		<input type ="text" name ="trainerId" required>
		</td>
	</tr>
	<tr>
		<th>이름 입력</th>
		<td>
		<input type ="text" name ="trainerName" required>
		</td>
	</tr>
	<tr>
		<th>전화번호 입력</th>
		<td>
		<input type ="tel" name ="trainerPhone" required>
		</td>
	</tr>
	<tr>
		<th>생년월일 입력</th>
		<td>
		<input type ="date" name ="trainerBirth" required>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="submit">찾기</button>
		</td>
	</tr>
</table>
</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>

