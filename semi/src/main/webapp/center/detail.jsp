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
 	String centerId = request.getParameter("centerId");

 %>
 <%--처리 --%>
  <%
  	CenterDao centerDao = new CenterDao();
  	CenterDto centerDto = centerDao.selectOne(centerId);
  	
  	EocDao eocDao = new EocDao();
  	List<EocDto> list = eocDao.selectList(centerId);
  	
  	TrainerDao trainerDao = new TrainerDao();
  	List<TrainerDto> trainerList = trainerDao.selectTrainerList(centerId);

  %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">
	 <div class="container w600 m30">
        <!--제목-->
        <div class="row center m30">
            <h2>Personal Training Center</h2>
        </div>
        <!--센터 정보-->
        <div class="flex-container flex-vertical">
            <div class="flex-container">
               
                    <img src="http://via.placeholder.com/250x250" class="img img-round">
                
                <div class="content-area">
                    <div class="row center">
                        <h1><%=centerDto.getCenterName() %></h1>
                    </div><hr>
                    <div class="row">
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
                    <%for(EocDto eocDto : list){ %>
                    <div class="row center exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
                    <%} %>
                    <!--목록으로 돌아가기 버튼-->
                    <a href="/semi/center/list.jsp" class="link link-btn fill">목록으로 돌아가기</a>
                </div>

            </div>
            <!--센터 소개글-->
            <div class="row center-introduction">
                <h4><%=centerDto.getCenterIntroduction() %></h4>
            </div>
        </div>

        <!--해당 센터 강사 목록-->
        <span>우리 센터의 강사</span>
        <div class="flex-container m10">
		 <%for(TrainerDto trainerDto : trainerList){ %>
           <div class="flex-container flex-vertical layer-3">
               <div class="row center">
                  <a href="/semi/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId() %>">
                  <img src="https://placeimg.com/150/150/people" class="img img-round img-hover">
                  </a>
               </div>
               <div class="center">
                   <a href="/semi/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId() %>" class="trainer-name">
                   <%=trainerDto.getTrainerName() %>
                   </a>
               </div>
			
           </div>
        <%} %>
        <!-- <div class="flex-container flex-vertical layer-3">
            <div class="row center">
                <img src="https://placeimg.com/150/150/people" class="img img-round img-hover">
            </div>
            <div class="center">
                <a href="#" class="trainer-name">황인빈 강사님</a>
            </div>
        </div> -->

        </div>
		
        <!--더보기 기능 구현해야함-->
        <div class="row m30">
            <button class="btn btn-primary fill">더보기</button>
        </div>
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>