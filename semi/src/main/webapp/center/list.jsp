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

        <div class="row center">
            <h1>살빠GYM CENTER</h1>
        </div>
        <!--검색창-->
        <div class="row center m30">
            <form action="/semi/center/list.jsp" method="get">
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
                	<input type="text" name="keyword" class="form-input input-round" placeholder="센터명 또는 OO동으로 검색" value="<%=keyword%>">
                <%} else{ %>
                	<input type="text" name="keyword" class="form-input input-round" placeholder="센터명 또는 OO동으로 검색">
                <%} %>
                <button type="submit" class="btn btn-primary">검색</button>
            </form>
        </div>
       
        <!--센터 목록-->
        <div class="flex-container flex-vertical">
        	<%for(CenterDto centerDto : centerList){ %>
            <div class="flex-container list-center-listbox">
                <!--센터이미지-->
                <div class="row center list-image-area">
                    <a href="/semi/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>">
                    <img src="http://via.placeholder.com/150x150" class="img img-hover img-round">
                    </a>
                </div>
                <div class="list-center-area">
                    <div class="row m30">
                    <a href="/semi/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>">
                        <h2><%=centerDto.getCenterName() %></h2>
                        </a>
                    </div>
                    <div class="row">
                        <h4><%=centerDto.getCenterBasicAddress() %>&nbsp;<%=centerDto.getCenterDetailAddress() %></h4>
                    </div>
                    <%--센터 담당 운동 
                    <%for(EocDto eocDto : eocList){ %>
                    <div class="row center list-exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
					<%} %>--%>
                    <!--좋아요 수-->
                    <div class="row right">
                        <h4>[10]</h4>
                    </div>
                </div>
            </div>
                    <%} %>
        </div>
    </div>
</body>
</html>