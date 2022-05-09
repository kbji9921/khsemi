<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.MatchingDto"%>
<%@page import="semi.servlet.DtoDao.MatchingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String playerId = (String)session.getAttribute("login");
%>

<%
	MatchingDao matchingDao = new MatchingDao();
	//MatchingDto matchingDto = matchingDao.selectList(playerId);
	List<MatchingDto> list = matchingDao.selectList(playerId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>matching information</title>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<th>학생</th>
				<th>강사</th>
				<th>메칭일</th>
				<th>남은 교육수</th>
				<th>비고</th>
			</tr>
		</thead>	
		
		<tbody>
			<%for(MatchingDto matchingDto  : list){ %>
				<tr>
					<td><%=matchingDto.getStudentId() %></td>
					<td><%=matchingDto.getCoachId() %></td>
					<td><%=matchingDto.getMatchingDate() %></td>
					<td><%=matchingDto.getMatchingDays() %></td>
					<td>
						<a href="matchingDetail.jsp?playerId=<%=playerId%>&coachId=<%=matchingDto.getCoachId()%>">삭제</a>
					</td>
				</tr>
			<%} %>
		</tbody>
	</table>
	<br><br>
	<a href="matchingInsert.jsp">매칭 추가</a><br><br>
	
	<a href="loginSuccess.jsp">메인</a><br><br>
	
	<a href="mypage.jsp">내정보</a>
</body>
</html>