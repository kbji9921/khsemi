<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--준비 --%>
 <%
 	//String centerId = request.getParameter("centerId");
 	String type = request.getParameter("type");
 	String keyword = request.getParameter("keyword");
 %>
 <%--처리 --%>
 <%
 	CenterDao centerDao = new CenterDao();
 	EocDao eocDao = new EocDao();
 	boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
 	List<CenterDto> centerList;
 	List<EocDto> eocList;
 	if(isSearch){
 		centerList = centerDao.selectList(type, keyword);
 		//eocList = eocDao.selectList(centerId);
 	}
 	else{
 		centerList = centerDao.selectList();
 		//eocList = eocDao.selectList(centerId);
 	}
 %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">

	 <div class="c-container w650 m30">

        <div class="row center">
            <h1>살빠GYM CENTER</h1>
        </div>
        <!--검색창-->
        <div class="row center m20">
            <form action="<%=request.getContextPath() %>/center/list.jsp" method="get">
            <%if(type==null||type.equals("center_basic_address")){ %>
                <select name="type" class="form-input input-round">
                    <option value="center_basic_address" selected >동이름</option>     
                    <option value="center_name">센터명</option>
                </select>
                <%} else{%>
                 <select name="type" class="form-input input-round">
                    <option value="center_basic_address">동이름</option>     
                    <option value="center_name" selected >센터명</option>
                </select>
                <%} %>
                <%if(isSearch){ %>
                	<input type="text" name="keyword" class="form-input input-round layer-2"  placeholder="OO동 또는 센터명으로 검색하세요" autocomplete="off" value="<%=keyword%>">
                <%} else{ %>
                	<input type="text" name="keyword" class="form-input input-round layer-2"  placeholder="OO동 또는 센터명으로 검색하세요" autocomplete="off">
                <%} %>
                <button type="submit" class="btn btn-semi">검색</button>
            </form>
        </div>
       
        <!--센터 목록-->
        <div class="flex-c-container flex-c-vertical">
        	<%for(CenterDto centerDto : centerList){ %>
            <div class="flex-c-container c-list-listbox m10">
                <!--센터이미지-->
                <div class="row c-list-img">
                    <a href="<%=request.getContextPath() %>/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>">
                    <img src="http://via.placeholder.com/170x170" class="c-img img-hover img-round" width="100%">
                    </a>
                </div>
                <div class="c-list-area">
                    <div class="row m30">
                    <a href="<%=request.getContextPath() %>/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>">
                        <h2><%=centerDto.getCenterName() %></h2>
                        </a>
                    </div>
                    <div class="row">
                        <h3><%=centerDto.getCenterBasicAddress() %>&nbsp;<%=centerDto.getCenterDetailAddress() %></h3>
                    </div>
                    <%--센터 담당 운동 
                    <%for(EocDto eocDto : eocList){ %>
                    <div class="row center list-exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
					<%} %>--%>
                    <!--좋아요 수-->
                    <div class="row right m20">
                        <h4>[10]</h4>
                    </div>
                </div>
            </div>
                    <%} %>
        </div>
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>