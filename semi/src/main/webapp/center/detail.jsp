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
 <%--trainer 잠시 주석처리
 	TrainerDao trainerDao = new TrainerDao();
  	List<TrainerDto> trainerList = trainerDao.selectTrainerList(centerId);
  --%>

  <%
  	CenterDao centerDao = new CenterDao();
  	CenterDto centerDto = centerDao.selectOne(centerId);
  	
  	EocDao eocDao = new EocDao();
  	List<EocDto> list = eocDao.selectList(centerId);
  	

  %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">
	 <div class="c-container w650 m30">
        <!--제목-->
        <div class="row center m20">
            <h2>Personal Training Center</h2>
        </div>
        <!--센터 정보-->
        <div class="flex-c-container flex-c-vertical">
            <div class="flex-c-container">
               <div class="row image-c-area">
                    <img src="http://via.placeholder.com/250x250" class="c-img img-round">
                </div>
                <div class="content-c-area">
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
                    <div class="center exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
                    <%} %>
                    <!--목록으로 돌아가기 버튼-->
                    <a href="<%=request.getContextPath() %>/center/list.jsp" class="link link-btn fill m10">목록으로 돌아가기</a>
                </div>

            </div>
            <!--센터 소개글-->
            <div class="row center-introbox">
                <h4><%=centerDto.getCenterIntroduction() %></h4>
            </div>
        </div>

        <!--해당 센터 강사 목록-->
        <span>우리 센터의 강사</span>
        <div class="flex-c-container m10">
		 <%--<%for(TrainerDto trainerDto : trainerList){ %>
           <div class="flex-c-container flex-c-vertical layer-3">
               <div class="row center">
                  <a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId() %>">
                  <img src="https://placeimg.com/150/150/people" class="c-img img-round img-hover">
                  </a>
               </div>
               <div class="center">
                   <a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId() %>" class="trainer-nameBox">
                   <%=trainerDto.getTrainerName() %>
                   </a>
               </div>
			
           </div>
        <%} %> --%>
        <div class="flex-c-container flex-c-vertical layer-3">
            <div class="row center">
                <a href="#"><img src="https://placeimg.com/150/150/people" class="c-img img-circle img-hover"></a>
            </div>
            <div class="center">
                <a href="#" class="trainer-nameBox">황인빈 강사님</a>
            </div>
        </div> 
        <div class="flex-c-container flex-c-vertical layer-3">
            <div class="row center">
                <a href="#"><img src="https://placeimg.com/150/150/people" class="c-img img-circle img-hover"></a>
            </div>
            <div class="center">
                <a href="#" class="trainer-nameBox">황인빈 강사님</a>
            </div>
        </div> 
        <div class="flex-c-container flex-c-vertical layer-3">
            <div class="row center">
                <a href="#"><img src="https://placeimg.com/150/150/people" class="c-img img-circle img-hover"></a>
            </div>
            <div class="center">
                <a href="#" class="trainer-nameBox">황인빈 강사님</a>
            </div>
        </div> 

        </div>
		
        <!--더보기 기능 구현해야함-->
        <div class="row m20">
            <button class="btn btn-semi fill">더보기</button>
        </div>
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>