<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.MatchingDto"%>
<%@page import="semi.servlet.DtoDao.MatchingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String trainerId = (String)session.getAttribute("trainer");
%>

<%
	MatchingDao matchingDao = new MatchingDao();
	//MatchingDto matchingDto = matchingDao.selectList(playerId);
	List<MatchingDto> list = matchingDao.selectPayList(trainerId);
	
	TrainerDao trainerDao = new TrainerDao();
	TrainerDto trainerDto = trainerDao.selectOne(trainerId); 
%>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/header.jsp"></jsp:include>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/matchingHeader.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/matching.css">


<section class="container w850">
	<div class="row right">
	  		<h4><%=trainerDto.getTrainerName()%> 강사</h4>
	</div>
	<table border="1" class="board-tb w850">
	   			<thead>
	   				<tr>
						<th>매칭번호</th>
						<th>회원명</th>
						<th>매칭일</th>
						<th>pt세션</th>
						<th>상태</th>
						<th>비고</th>
					</tr>
	   			</thead>
	   			<tbody>
	   					<%for(MatchingDto matchingDto  : list){ %>
						<tr>
							<%
								PlayerDao playerDao = new PlayerDao();
								PlayerDto playerDto = playerDao.selectOne(matchingDto.getStudentId());
							%>
							<td><%=matchingDto.getMatchingNo() %></td>
							<td><%=playerDto.getPlayerName() %></td>
							<td><%=matchingDto.getMatchingDate() %></td>
							<td><%=matchingDto.getMatchingDays() %></td>
							<td><%=matchingDto.getMatchingState() %></td>
							<td><a href="<%=request.getContextPath() %>/player/deleteTrainer.matching?playerId=<%=playerDto.getPlayerId()%>&trainerId=<%=trainerId%>">삭제</a></td>
						</tr>
					<%} %>
					<%if(list.isEmpty()){ %>
						<tr> 
							<td align="center" colspan="6">매칭내역이 없습니다.</td>
						</tr>
					<%} %>
	   			</tbody>	
	   		</table>
	   <div class="row center">
			<%if(request.getParameter("error") != null){ %>
				<h3 style="color:red;">결제한 내역은 지울수 없습니다.</h3>
			<%} %>
		</div>
	</div>
</section>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/footer.jsp"></jsp:include>
