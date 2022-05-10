<%@page import="semi.servlet.DtoDao.StatisticVO"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.GradeDao"%>
<%@page import="semi.servlet.DtoDao.GradeDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
//세션
//  String playerId = (String)session.getAttribute("login");
	String playerId = "test1234";
 // String trainerId = (String)session.getAttribute("trainer");
 	String trainerId = "testuser6";

 	TrainerDao trainerDao = new TrainerDao();
 	TrainerDto trainerDto = trainerDao.selectOne(trainerId);
	GradeDto gradeDto = new GradeDto();
	//현재 글에 대한 평점 목록을 조회
	GradeDao gradeDao = new GradeDao();
	List<GradeDto> GradeList = gradeDao.selectList(trainerId);

	//댓글 글쓴이와 로그인한 계정이 동일하다면 
	boolean isGradeWriter= playerId!=null && playerId.equals(gradeDto.getGradeWriter());
	//boolean isAdmin = auth!=null && auth.equals("관리자");
	List<StatisticVO> rate = gradeDao.statistic();
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		$("")
	});
</script>
</head>
<body>
<div class="row center">
<h1> 강사 상세 </h1>
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
		<th>센터아이디</th>
		<td><%=trainerDto.getCenterId()%></td>
	</tr>
</table>
</div>
	<div class="row">
	<form action="insert.grade" method="post">
	<div>
		<select name="gradeRate">
			<option value="5">⭐⭐⭐⭐⭐</option>
			<option value="4">⭐⭐⭐⭐</option>
			<option value="3">⭐⭐⭐</option>
			<option value="2">⭐⭐</option>
			<option value="1">⭐</option>
		</select>
		</div>
		<input type="hidden" name="gradeTarget" value="<%=trainerId%>">
		<input type="hidden" name="gradeWriter" value="<%=playerId%>">
		<div>
		<textarea name="gradeContent"rows="5" cols="120" class="form-input input-round"></textarea>
		</div>
		<button type="submit" class="btn btn-success">댓글작성</button>
	</form>
	</div>
	<!-- 총 평균점수 -->
	<div class="row">
	<table class="table table-border">	
	<tr>
		<th>총 숫자</th>
		<th>평균 점수</th>
		<th>최저점</th>
		<th>최고점</th>
	</tr>
	<tr>
		<%for(StatisticVO rateDto : rate){%>
			<td><%=rateDto.getCount()%></td>
			<td><%=rateDto.getAverage()%></td>
			<td><%=rateDto.getMin()%></td>
			<td><%=rateDto.getMax()%></td>
		<%} %>
		</tr>
	</table>
	</div>
	<!-- 댓글 목록 -->
	<table width="95%" class="table table-border">
		<%for(GradeDto rDto : GradeList){%>
		<tr>
		<th width="5%"><%=rDto.getGradeRate()%></th>
		<th width="15%"><%=rDto.getGradeWriter()%></th>
		<td width="15%"><%=rDto.getGradeTime()%></td>
		<td><textarea name="gradeContent" cols="70" readonly><%=rDto.getGradeContent()%></textarea></td>
		<!-- 댓글 작성자 수정 삭제 가능 -->
		<td align="right">
			<a href="grade_delete.grade?gradeNo=<%=rDto.getGradeNo()%>" class="link link-btn">삭제</a>
			<a href="grade_update.grade?gradeNo=<%=rDto.getGradeNo()%>&gradeTarget=<%=rDto.getGradeTarget()%>>" class="link link-btn">수정</a>
		</td>
		</tr>
		<%} %>
	</table>
</body>
</html>