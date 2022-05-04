<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 	CenterDao centerDao = new CenterDao();
 	List<CenterDto> list = centerDao.selectList();
 %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center list</title>
</head>
<body>
	<table border="1" width="800">
		<thead>
			<tr>
			<th>번호</th>
			<th>센터명</th>
			<th>평일개장</th>
			<th>평일폐장</th>
			<th>휴일개장</th>
			<th>휴일폐장</th>
			<th>연락처</th>
			<th>등록일</th>
			<th>센터소개</th>
			<th>센터비용</th>
			<th>개월</th>
			</tr>
		</thead>
		<tbody>
		<%for(CenterDto centerDto : list){ %>
			<tr>
				<td><%=centerDto.getCenterNo() %></td>
				<td><%=centerDto.getCenterName() %></td>
				<td><%=centerDto.getCenterWeekStime() %></td>
				<td><%=centerDto.getCenterWeekFtime() %></td>
				<td><%=centerDto.getCenterWkndStime() %></td>
				<td><%=centerDto.getCenterWkndFtime() %></td>
				<td><%=centerDto.getCenterPhone() %></td>
				<td><%=centerDto.getCenterOpen() %></td>
				<td><%=centerDto.getCenterIntroduction() %></td>
				<td><%=centerDto.getCenterPay() %></td>
				<td><%=centerDto.getCenterMonth() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>