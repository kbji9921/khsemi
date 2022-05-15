<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.TrainerAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.GradeDto"%>
<%@page import="semi.servlet.DtoDao.GradeDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>


<%	
    String trainerId = request.getParameter("trainerId");
    String centerId = request.getParameter("centerId");
%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/index.css">

			<article class="container">
				<h3 class="contents-title">종목선택</h3>
				<p class="contents-info">1:1 운동강사 매칭서비스! 배우고 싶은 종목을 선택해보세요.</p>
				<div class="flex-container exercise">
					<div class="content-box">
						<div class="content exercise">
							<a href="<%=request.getContextPath()%>/index/sportsSelect.jsp?exerciseName=헬스">
								<img src="/semi/images/health_icon.png" width=45%>
							</a>
						</div>
						<a href="#">헬스</a>
					</div>
					<div class="content-box">
						<div class="content exercise">
							<a href="<%=request.getContextPath()%>/index/sportsSelect.jsp?exerciseName=필라테스">
								<img src="/semi/images/pilates_icon.png" width=45%>
							</a>
						</div>
						<a href="#">필라테스</a>
					</div>
					<div class="content-box">
						<div class="content exercise">
							<a href="<%=request.getContextPath()%>/index/sportsSelect.jsp?exerciseName=요가">
								<img src="/semi/images/yoga_icon.png" width=35%>
							</a>
						</div>
						<a href="#">요가</a>
					</div>
					<div class="content-box">
						<div class="content exercise">
							<a href="<%=request.getContextPath()%>/index/sportsSelect.jsp?exerciseName=테니스">
								<img src="/semi/images/tennis_icon.png" width=45%>
							</a>
						</div>
						<a href="#">테니스</a>
					</div>
					<div class="content-box">
						<div class="content exercise">
							<a href="<%=request.getContextPath()%>/index/sportsSelect.jsp?exerciseName=수영">

								<img src="/semi/images/swim_icon.png" width=45%>
							</a>
						</div>
						<a href="#">수영</a>
					</div>
				</div>
			</article>
		<%-- sports e --%>
		
		<%-- trainer s --%>
			<article class="container">
				<h3 class="contents-title">우리동네 인기 강사</h3>
				<p class="contents-info">클릭하여 강사님의 이력을 확인해보세요!</p>
				<div class="flex-container">

							<%
					TrainerDao trainerDao = new TrainerDao();
					List<GradeDto> list = trainerDao.selectListByGradeRate();
			    	TrainerAttachmentDao trainerAttachmentDao = new TrainerAttachmentDao();
			    	for(GradeDto gradeDto:list){
			        	int attachmentNo = trainerAttachmentDao.selectOne(gradeDto.getGradeTarget());
			
			        	AttachmentDao attachmentDao = new AttachmentDao();
			        	AttachmentDto attachmentDto = attachmentDao.selectOne(attachmentNo);
			
			        	boolean noPic = attachmentDto==null;
					%>
				<div class="content-box">
					<div class="content trainer" >
						 <%if(noPic){ %>
                    		<a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?trainerId=<%=gradeDto.getGradeTarget()%>">
                    		<img src="<%=request.getContextPath()%>/images/profile.png" class="c-img img-shadow img-round" width="170px" >
                    		</a>
                		<%}else{ %>
                			<a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?trainerId=<%=gradeDto.getGradeTarget()%>">
                	 		<img src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attachmentNo%>" class="c-img img-shadow img-round" width="170px">
                    		</a>
                		<%} %>
							
						</div>
					</div>	
					<%} %>
				</div>
			</article>

		<%-- trainer e --%>
		
		<%-- center s --%>
			<article class="container">
				<h3 class="contents-title">우리동네 인기 센터</h3>
				<p class="contents-info">클릭하여 센터의 상세정보를 확인해보세요!</p>
				<div class="flex-container">
					<div class="content-box">
						<div class="content center">
						
						<!-- likeCount 을 가져와서 출력 -->
						
						<a href="<%=request.getContextPath()%>/center/detail.jsp?centerId=<%=centerId%>"> 
							
								<img src="https://placeimg.com/170/170/tech/grayscale" width=100%>
							</a>
						</div>
					</div>
					<div class="content-box">
						<div class="content center">
							<a href="<%=request.getContextPath()%>/center/detail.jsp?centerId=test1">
								<img src="https://placeimg.com/170/170/tech/grayscale" width=100%>
							</a>
						</div>
					</div>
					<div class="content-box">
						<div class="content center">
							<a href="<%=request.getContextPath()%>/center/detail.jsp?centerId=test2">
								<img src="https://placeimg.com/170/170/tech/grayscale" width=100%>
							</a>
						</div>
					</div>
					<div class="content-box">
						<div class="content center">
							<a href="<%=request.getContextPath()%>/center/detail.jsp?centerId=test3">
								<img src="https://placeimg.com/170/170/tech/grayscale" width=100%>
							</a>
						</div>
					</div>
					<div class="content-box">
						<div class="content center">
							<a href="<%=request.getContextPath()%>/center/detail.jsp?centerId=test4">
								<img src="https://placeimg.com/170/170/tech/grayscale" width=100%>
							</a>
						</div>
					</div>
				</div>
			</article>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
