<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.MatchingDto"%>
<%@page import="semi.servlet.DtoDao.MatchingDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String playerId = (String)session.getAttribute("login");
   String trainerId = request.getParameter("trainerId");
%>

<%
   // matching테이블 회원 아이디로 List 조회
   MatchingDao matchingDao = new MatchingDao();
   //MatchingDto matchingDto = matchingDao.selectList(playerId);
   List<MatchingDto> list = matchingDao.selectList(playerId);
   
   //회원 이름 조회
   PlayerDao playerDao = new PlayerDao();
   PlayerDto playerDto = playerDao.selectOne(playerId);
   
%>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/header.jsp"></jsp:include>
<style>
   a {
      font-size: 20px;
   }
</style>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/matchingHeader.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/matching.css">
<section class="container w850">
<div class="row right">
  		<a href="<%=request.getContextPath()%>">새로운 매칭 찾으러가기!</a>
  </div>
<table border="1" class="board-tb w850">
	<thead>
		<tr>
			<th>No.</th>
			<th>학생이름</th>
			<th>강사이름</th>
			<th>매칭일</th>
			<th>교육수</th>
			<th>상태</th>
			<th>결제/예약</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
		<%for(MatchingDto matchingDto  : list){ %>
		<tr class="center">
			<%
				TrainerDao trainerDao = new TrainerDao();
				TrainerDto trainerDto = trainerDao.selectOne(matchingDto.getCoachId()); 
			%>
			<td><%=matchingDto.getMatchingNo() %></td>
			<td><%=playerDto.getPlayerName() %></td>
			<td><%=trainerDto.getTrainerName() %></td>
			<td><%=matchingDto.getMatchingDate() %></td>
			<td><%=matchingDto.getMatchingDays() %></td>
			<td><%=matchingDto.getMatchingState() %></td>
			<td>
				<% boolean isPass = matchingDto.getMatchingState().equals("결제완료"); %>
				<%if(!isPass){ %>
					<a href="<%=request.getContextPath() %>/player/matchingDetail.jsp?playerId=<%=playerId%>&coachId=<%=matchingDto.getCoachId()%>">결제하기</a>
				<%}else{ %>
					<a href="<%=request.getContextPath() %>/player/matchingDetail.jsp?playerId=<%=playerId%>&coachId=<%=matchingDto.getCoachId()%>">예약하기</a>
				<%} %>		
			</td>
			<td>
			   <form action="matchingDelete.player" method="post">
					<input type="hidden" name="playerId" value="<%=playerId%>">
					<input type="hidden" name="trainerId" value="<%=matchingDto.getCoachId()%>">
					<%--매칭 완료 후 매칭 삭제버튼 삭제 --%>
					<button type="submit" class="matching-delete">매칭삭제</button>
				</form>
			</td>
			</tr>
		<%} %>
		<%if(list.isEmpty()){ %>
	      <tr>
	         <td colspan="8" align=center>
	         	매칭 내역이 없습니다.
	         </td>
	      </tr>
	   <%} %>
	</tbody>	
</table>
  	<div class="row center">
		<%if(request.getParameter("error") != null){ %>
			<h3 style="color:red;">결제한 내역은 지울수 없습니다.</h3>
		<%} %>
	</div>
</section>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/footer.jsp"></jsp:include>