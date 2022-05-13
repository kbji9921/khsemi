<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>

<%
	String trainerSports = request.getParameter("exerciseName");
    String exerciseName = request.getParameter("exerciseName");
    



%>

<%--메인 화면 -> 종목 선택 후 선택된 종목의 센터 리스트, 강사 리스트 페이지...  --%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sports.css">

    <section class="container">
    
         <p class="contents-p">선택하신 종목의 센터 또는 강사로 찾으실 수 있습니다</p>
         
         <br>


        <div class="flex-container">
            <div class="content-box">
                <div class="content">                   
                  <a href="<%=request.getContextPath()%>/center/list.jsp?exerciseName=<%=exerciseName%>">
                    <img src="/semi/images/main_center.jpg" width="100%" alt="센터 검색으로">
                  </a>
                </div>
                  <span>센터</span>
                </div>

            <div class="content-box">
                <div class="content">            
                     <a href="<%=request.getContextPath()%>/trainer/trainerList.jsp?type=trainer_sports&keyword=<%=trainerSports%>">
        	       <img src="/semi/images/main_trainer.jpg" width="100%" alt="강사 검색으로">
                    </a>
                  </div>
                    <span>강사</span>
                  </div> 
            
            </div>              
    </section>


<jsp:include page="/jsp/template/footer.jsp"></jsp:include>