<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<%
	String trainerSport = request.getParameter("trainerSport");
%>

<%--메인 화면 -> 종목 선택 후 선택된 종목의 센터 리스트, 강사 리스트 페이지...  --%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sports.css">

    <section class="container">
    
         <p class="contents-p">선택하신 종목의 센터 또는 강사로 찾으실 수 있습니다</p>

        <div class="flex-container">
            <div class="content-box">
                <div class="content">                   
                  <a href="<%=request.getContextPath()%>/center/list.jsp">
                  
                    <img src="/semi/images/main_center.jpg" width="100%" alt="센터 검색으로">
                  </a>
                </div>
                  <a href="#">센터</a>
                </div>

            <div class="content-box">
                <div class="content">            
                  <a href="<%=request.getContextPath()%>/trainer/trainerList.jsp?trainerSport=<%=trainerSport%>">
                  
        	       <img src="/semi/images/main_trainer.jpg" width="100%" alt="강사 검색으로">
                    </a>
                  </div>
                   <a href="#">강사</a>
                  </div> 
            
            </div>              
    </section>


<jsp:include page="/jsp/template/footer.jsp"></jsp:include>