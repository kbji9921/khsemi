<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%-- 준비 --%>
<%
String trainerId= "testuser6";
%>    
    
    <%-- 처리 --%>
<%
TrainerDao trainerDao = new TrainerDao();
TrainerDto trainerDto = trainerDao.selectOne(trainerId);
%>    
<div class="Container w400 m30">
<div class="row"></div>
<div class="row center">
<h1> 내 정보 </h1>
</div>
<div class="row">
<table class="table table-border table-stripe">
	<tr>
		<th>아이디</th>
		<td><%=trainerDto.getTrainerId()%></td>
	</tr>
		<tr>
		<th>이름</th>
		<td><%=trainerDto.getTrainerName()%></td>
	</tr>
		<tr>
		<th>가격</th>
		<td><%=trainerDto.getTrainerPrice()%></td>
	</tr>
		<tr>
		<th>운동종목</th>
		<td><%=trainerDto.getTrainerSports()%></td>
	</tr>
	<tr>
		<th>센터번호</th>
		<td><%=trainerDto.getCenterId()%></td>
	</tr>
</table>
</div>
<div class="row right">
<button type="button" onclick="location.href='password1.jsp'" class="btn btn-hover btn-primary">비밀번호 변경</button>
<button type="button" onclick="location.href='information1.jsp'" class="btn btn-hover btn-primary">개인정보 변경</button>
<button type="button" onclick="location.href='#'" class="btn btn-hover btn-secondary">포인트 충전</button>
<button type="button" onclick="location.href='exit1.jsp'" class="btn btn-hover btn-danger">탈퇴하기</button>
</div>
</div>