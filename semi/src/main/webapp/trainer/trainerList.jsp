<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
TrainerDao trainerDao = new TrainerDao();
List<TrainerDto> list = trainerDao.selectList();

%>
<table border ="1">
	<tr bgcolor="skyblue"  align="center">
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>생년월일</th>
		<th>이메일</th>
		<th>가격</th>
		<th>가입일</th>
		<th>최근 로그인</th>
	</tr>
	<%for(TrainerDto trainerDto:list){ %>
	<tr  align="center">
		<td><%=trainerDto.getTrainerId()%></td>
		<td><%=trainerDto.getTrainerName()%></td>
		<td><%=trainerDto.getTrainerPhone()%></td>
		<td><%=trainerDto.getTrainerBirth()%></td>
		<td><%=trainerDto.getTrainerEmail()%></td>
		<td><%=trainerDto.getTrainerPrice()%></td>
		<td><%=trainerDto.getTrainerJoindate()%></td>
		<td><%=trainerDto.getTrainerLogindate()%></td>
	</tr>
	<%} %>
</table>