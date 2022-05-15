<%@page import="java.text.Format"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.TrainerAttachmentDao"%>
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

	
	//현재 글에 대한 평점 목록을 조회 
	GradeDao gradeDao = new GradeDao();
	List<GradeDto> GradeList = gradeDao.selectList(trainerId);

	
	
	//평점
	List<StatisticVO> list = gradeDao.statistic();
	boolean isNoGrade = list!=null; //평점이 있는지 확인
	String gradeTarget = gradeDao.selectGradeTarget(playerId); //회원 아이디를 넣어서 타겟을 확인
	boolean isRight = gradeTarget!=null && trainerId.equals(gradeTarget); //평점 타겟과 트레이너 아이디 동일한지 확인
	//회원확인
	boolean isPlayer= playerId!=null;
	

	// 프로필사진조회
	//트레이너 아이디를 통해 trainerAttachment DB에서 번호 획득
	TrainerAttachmentDao trainerAttachmentDao = new TrainerAttachmentDao();
	int attach = trainerAttachmentDao.selectOne(trainerId);
	//trainerAttachment에서 받은 번호를 attachmentDao에 넣어서 불러오기
	AttachmentDao attachmentDao = new AttachmentDao();
	AttachmentDto attachmentDto = attachmentDao.selectOne(attach);
	//사진이 없다면
	boolean noPic = attachmentDto==null;

	
	//센터 정보 출력
	CenterDao centerDao = new CenterDao();
	CenterDto centerDto = centerDao.selectOne(trainerDto.getCenterId());
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">
 <!-- jquery cdn -->
 <style>
 .image-c-area img{
	display: flex;
	justify-content: center;
	align-items: center;
	width: 250px !important;
	height: 250px !important;
}
.hide{
display:none}
 </style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		$(function () {
			$('#textarea').on('keyup', function () {
				$('#text_count').html("(" + $(this).val().length + " / 100)");

				if ($(this).val().length > 100) {
					$(this).val($(this).val().substring(0, 100));
					$('#text_count').html("(100 / 100)");
				}
			});

		});
	</script>
	 <div class="c-container w650 m30">
        <!--제목-->
        
        <!--센터 정보-->
	<div class="flex-c-container flex-c-vertical m30">
		<div class="flex-c-container">
			<div class="row image-c-area">
				<%if(!noPic){ %>
				<a
					href="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>"></a>
				<img
					src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>"
					class="img img-circle asdf">
				<%}else{ %>
				<img src="<%=request.getContextPath()%>/images/profile.png"
					width="200px" class="img img-round">
				<%} %>
			</div>
			<div class="content-c-area">
				<div class="row center">
					<h1 class="m20"><%=trainerDto.getTrainerName() %></h1>
				</div>
				<hr>
				<div class="row">
					<%if(trainerDto.getCenterId()!=null){ %>
					<h4>
						[주 소] :&nbsp;<%=centerDto.getCenterBasicAddress() %>&nbsp;<%=centerDto.getCenterDetailAddress() %></h4>
				</div>
				<div class="row">
					<h4>
						[전화번호] :&nbsp;<%=centerDto.getCenterPhone() %></h4>
				</div>
				<hr>
				<div class="row">
					<h4>
						[평 일] :&nbsp;<%=centerDto.getCenterWeektime() %>
					</h4>
				</div>
				<div class="row">
					<h4>
						[주 말] :&nbsp;<%=centerDto.getCenterWkndtime() %>
					</h4>
				</div>
				<hr>
				<%}else{%>
				<h4>[주 소] :&nbsp;&nbsp;</h4>
			</div>
			<div class="row">
				<h4>[전화번호] :&nbsp;</h4>
			</div>
			<hr>
			<div class="row">
				<h4>[평 일] :&nbsp;</h4>
			</div>
			<div class="row">
				<h4>[주 말] :&nbsp;</h4>
			</div>
			<hr>
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
        <a href="<%=request.getContextPath()%>/player/matchingInsert.jsp?trainerId=<%=trainerId%>&trainerName=<%=trainerDto.getTrainerName()%>" class="link-btn link fill">매칭</a>
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
	<%if(statisticVO.getType().equals(trainerId)){
		
		Format f = new DecimalFormat("#.#");%>
	<tr>
		<td><%=f.format(statisticVO.getAverage())%></td>
		<td><%=statisticVO.getCount() %></td>
	</tr>
	<%} %>
<%} %>
	</table>

	<br><br>
	<br><br>
</div>

	</div>
	<!-- 평점 작성 -->
	<div class="row">
	<%if(request.getParameter("error")!=null){ %>
	<h3 style="color:red;">이미 평가를 하셨습니다.</h3>
	<%} %>
	</div>
<div class="center">
	<%if(isPlayer){ %>
	<table border="1" class="board-tb w1000">
	<form action="insert.grade" method="post">
	<td style="width:128px">
		<select name="gradeRate" class="form-input input-round">
			<option value="5">⭐⭐⭐⭐⭐</option>
			<option value="4">⭐⭐⭐⭐</option>
			<option value="3">⭐⭐⭐</option>
			<option value="2">⭐⭐</option>
			<option value="1">⭐</option>
		</select>
	</td>

	<input type="hidden" name="gradeTarget" value="<%=trainerId%>">
	<input type="hidden" name="gradeWriter" value="<%=playerId%>">
	<td style="width:70%">
		<textarea name="gradeContent"rows="5"  class="form-input input-round answer" style="width:100%" id="textarea"></textarea>
		<span id="text_count">(0 / 100)</span>
	</td>
	<td>
		<button type="submit" class="btn btn-semi">등록</button>
	</td>
	</form>
	</table>
	<% }%>
	<br>
	<table border="1" class="board-tb w1000">
	<thead>
		<tr>
			<th>별점</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th width="59%">내용</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<%for(GradeDto rDto : GradeList){%>
		<tr align="center">
			<%if(rDto.getGradeRate()==1){%>
				<td width="5%">⭐</td>
			<%} %>
			<%if(rDto.getGradeRate()==2){%>
				<td width="5%">⭐⭐</td>
			<%} %>
			<%if(rDto.getGradeRate()==3){%>
				<td width="5%">⭐⭐⭐</td>
			<%} %>
			<%if(rDto.getGradeRate()==4){%>
				<td width="5%">⭐⭐⭐⭐</td>
			<%} %>
			<%if(rDto.getGradeRate()==5){%>
				<td width="5%">⭐⭐⭐⭐⭐</td>
			<%} %>
			<td><%=rDto.getGradeWriter()%></td>
			<td align="left">
				<%=rDto.getGradeTime()%>
			</td>
			<td><%=rDto.getGradeContent()%></td>
			<%
			//댓글 글쓴이와 로그인한 계정이 동일하다면 
			boolean isGradeWriter= playerId!=null && playerId.equals(rDto.getGradeWriter());
			%>
			<%if(isGradeWriter){ %>
			<td><a href="<%=request.getContextPath()%>/grade/gradeDelete.grade?gradeNo=<%=rDto.getGradeNo()%>&trainerId=<%=trainerDto.getTrainerId()%>" class="link link-btn hide">삭제</a></td>
		</tr>		
		<%} %>
	<%}%>
	</tbody>
</table>
</div>
	<!-- 평점 목록 -->



<jsp:include page="/jsp/template/footer.jsp"></jsp:include>