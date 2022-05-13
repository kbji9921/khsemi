<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<%
	String trainerSports = request.getParameter("exerciseName");
%>

<%--메인 화면 -> 종목 선택 후 선택된 종목의 센터 리스트, 강사 리스트 페이지...  --%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">

    <section class="container w400 m40">
        <a href="<%=request.getContextPath()%>/center/list.jsp?type=exercise_name&keyword=<%=trainerSports%>">
            <img src="" alt="센터 검색으로">
        </a>

        <a href="<%=request.getContextPath()%>/trainer/trainerList.jsp?type=trainer_sports&keyword=<%=trainerSports%>">
        	<img src="" alt="강사 검색으로">
        </a>       
    </section>


<jsp:include page="/jsp/template/footer.jsp"></jsp:include>