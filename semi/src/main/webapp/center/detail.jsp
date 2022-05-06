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
 <%--준비 --%>
  <%
  	CenterDao centerDao = new CenterDao();
  	CenterDto centerDto = centerDao.selectOne(centerId);
  	
  	EocDao eocDao = new EocDao();
  	List<EocDto> list = eocDao.selectList(centerId);
  	
    
  %>
 <%--준비 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">

</head>
<body>
	 <div class="container w600 m30">
        <!--제목-->
        <div class="row center">
            <h2>Personal Training Center</h2>
        </div>
        <!--센터 정보-->
        <div class="flex-container flex-vertical">
            <div class="flex-container">
                <div class="row">
                    <img src="http://via.placeholder.com/250x250" class="img img-round">
                </div>
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
                    <a href="#" class="link link-btn fill">목록으로 돌아가기</a>
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
           <div class="flex-container flex-vertical trainer-list">
               <div class="row">
                  <a href="#"><img src="https://placeimg.com/150/150/people" class="img img-round img-hover"></a>
               </div>
               <div class="center">
                   <a href="#" class="trainer-name">황인빈 강사님</a>
               </div>
           </div>

           <div class="flex-container flex-vertical trainer-list">
            <div class="row">
                <img src="https://placeimg.com/150/150/people" class="img img-round img-hover">
            </div>
            <div class="center">
                <a href="#" class="trainer-name">황인빈 강사님</a>
            </div>
        </div>

        <div class="flex-container flex-vertical trainer-list">
            <div class="row">
                <img src="https://placeimg.com/150/150/people" class="img img-round img-hover">
            </div>
            <div class="center">
                <a href="#" class="trainer-name">황인빈 강사님</a>
            </div>
        </div>

        </div>

        <!--더보기 기능 구현해야함-->
        <div class="row m30">
            <button class="btn btn-primary fill">더보기</button>
        </div>
    </div>
</body>
</html>