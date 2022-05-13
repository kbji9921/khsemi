<%@page import="semi.servlet.DtoDao.StatisticVO"%>
<%@page import="semi.servlet.DtoDao.GradeDao"%>
<%@page import="semi.servlet.DtoDao.GradeDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%--준비 --%>
 <%


 String playerId = (String)session.getAttribute("login");
//	String playerId = "test1234";
 String trainerId = request.getParameter("trainerId");



	TrainerDao trainerDao = new TrainerDao();
	TrainerDto trainerDto = trainerDao.selectOne(trainerId);

	GradeDto gradeDto = new GradeDto();
	//현재 글에 대한 평점 목록을 조회 
	GradeDao gradeDao = new GradeDao();
	List<GradeDto> GradeList = gradeDao.selectList(trainerId);
	String gradeTarget = gradeDao.selectTarget(trainerId);
	//댓글 글쓴이와 로그인한 계정이 동일하다면 
	boolean isGradeWriter= playerId!=null && playerId.equals(gradeDto.getGradeWriter());
	boolean isRight = gradeTarget!=null && trainerId.equals(gradeTarget);
	//boolean isAdmin = auth!=null && auth.equals("관리자");
	List<StatisticVO> list = gradeDao.statistic();
	boolean isNoGrade = list!=null;
	//회원으로 로그인 했다면
	boolean isPlayer= playerId!=null;
	
	//센터 정보 출력
	CenterDao centerDao = new CenterDao();
	CenterDto centerDto = centerDao.selectOne(trainerDto.getCenterId());
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">
 <!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">
        $(function(){
            $("#delete").click(function(){
                return confirm("정말 삭제하시겠습니까?");
            });
        });
    </script>

	 <div class="c-container w650 m30">
        <!--제목-->
        
        <!--센터 정보-->
        <div class="flex-c-container flex-c-vertical m30">
            <div class="flex-c-container">
               <div class="row image-c-area">
                    <img src="https://placeimg.com/250/250/tech/grayscale" class="c-img img-round">
                </div>
                <div class="content-c-area">
                    <div class="row center">
                        <h1 class="m20"><%=trainerDto.getTrainerName() %></h1>
                    </div><hr>
                    <div class="row">
                    <%if(trainerDto.getCenterId()!=null){ %>
                        <h4>[주 소] :&nbsp;<%=centerDto.getCenterBasicAddress() %>&nbsp;<%=centerDto.getCenterDetailAddress() %></h4>
                    </div>
                    <div class="row">
                        <h4>[전화번호] :&nbsp;<%=centerDto.getCenterPhone() %></h4>
                    </div><hr>
                    <div class="row">
                        <h4>[평 일] :&nbsp;<%=centerDto.getCenterWeektime() %> </h4>
                    </div>
                    <div class="row">
                        <h4>[주 말] :&nbsp;<%=centerDto.getCenterWkndtime() %> </h4>
                    </div><hr>
                    <%}else{%>
                    <h4>[주 소] :&nbsp;&nbsp;</h4>
                    </div>
                    <div class="row">
                        <h4>[전화번호] :&nbsp;</h4>
                    </div><hr>
                    <div class="row">
                        <h4>[평 일] :&nbsp;</h4>
                    </div>
                    <div class="row">
                        <h4>[주 말] :&nbsp;</h4>
                    </div><hr>
                    <%} %>
                    <div class="center exercise-kinds">
                        <h4><%=trainerDto.getTrainerSports()%></h4>
                    </div>
                    <!--버튼-->
                </div>

            </div>
            <!--센터 소개글-->
             <%if(trainerDto.getCenterId()!=null){ %>
            <div class="row center-introbox">
                <h4><%=centerDto.getCenterIntroduction() %></h4>
            </div>
            <%}else{ %>
            <div class="row center-introbox">
                <h4></h4>
            </div>
            <%} %>
        </div>
      <%if(isPlayer){%>
        <div class="row">
        <a href="<%=request.getContextPath()%>/player/matchingInsert.jsp?trainerId=<%=trainerId%>&trainerName=<%=trainerDto.getTrainerName() %>" class="link-btn link fill">매칭</a>
        </div>
        <%} %>
	<!-- 총 평균점수 -->
	<div class="row">
	<table class="table table-border">
	<tr>

	<th>평균점수</th>
	<th>평가자수</th>
	</tr>
	<%for(StatisticVO statisticVO :list){%>
	<%if(statisticVO.getType().equals(trainerId)){ %>
	<tr>
		<td><%=statisticVO.getAverage() %></td>
		<td><%=statisticVO.getCount() %></td>
	</tr>
	<%} %>
<%} %>
	</table>

	<br><br>
	<%if(playerId != null){ %>
		<a href="<%=request.getContextPath()%>/player/matchingInsert.jsp?palyerid=<%=playerId%>&trainerId=<%=trainerId%>">매칭</a>
	<%}%>
	<br><br>
</div>

	</div>
	<!-- 평점 작성 -->

	<%if(isPlayer){ %>
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
	<% }%>
	<!-- 평점 목록 -->
	<table width="95%" class="table table-border">
		<%for(GradeDto rDto : GradeList){%>
		<tr>
			<%if(rDto.getGradeRate()==1){%>
				<th width="5%">⭐</th>
			<%} %>
			<%if(rDto.getGradeRate()==2){%>
				<th width="5%">⭐⭐</th>
			<%} %>
			<%if(rDto.getGradeRate()==3){%>
				<th width="5%">⭐⭐⭐</th>
			<%} %>
			<%if(rDto.getGradeRate()==4){%>
				<th width="5%">⭐⭐⭐⭐</th>
			<%} %>
			<%if(rDto.getGradeRate()==5){%>
				<th width="5%">⭐⭐⭐⭐⭐</th>
			<%} %>

		<th width="15%"><%=rDto.getGradeWriter()%></th>
		<td width="15%"><%=rDto.getGradeTime()%></td>
		<td><textarea name="gradeContent" cols="70" readonly class="input-form input-round fill"><%=rDto.getGradeContent()%></textarea></td>
		<!-- 댓글 작성자 수정 삭제 가능 -->
		<td align="right">
			<a href="grade_delete.grade?gradeNo=<%=rDto.getGradeNo()%>" class="link link-btn">삭제</a>
			<a href="grade_update.grade?gradeNo=<%=rDto.getGradeNo()%>&gradeTarget=<%=rDto.getGradeTarget()%>>" class="link link-btn">수정</a>
		</td>
		</tr>
		<%} %>
	</table>
        
        <div class="row right">
   			<a href="<%=request.getContextPath() %>/trainer/trainerList.jsp" class="link link-btn m10" width="30%">목록</a>
		</div>    
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>