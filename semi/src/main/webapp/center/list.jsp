<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--준비 --%>
 <%
 	String type = request.getParameter("type");
 	String keyword = request.getParameter("keyword");
 %>
 <%--처리 --%>
 <%
 	CenterDao centerDao = new CenterDao();
 	boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
 	List<CenterDto> list;
 	if(isSearch){
 		list = centerDao.selectList(type, keyword);
 	}
 	else{
 		list = centerDao.selectList();
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
            <form action="#" method="get">
                <select name="type" class="form-input input-round">
                    <option>동이름</option>     
                    <option>센터명</option>
                </select>
                <input type="text" name="keyword" class="form-input input-round" placeholder="센터명 또는 OO동으로 검색">
                <button type="submit" class="btn btn-primary">검색</button>
            </form>
        </div>
       
        <!--센터 목록-->
        <div class="flex-container flex-vertical">
            <div class="flex-container list-center-listbox">
                <!--센터이미지-->
                <div class="row center list-image-area">
                    <img src="http://via.placeholder.com/150x150" class="img img-hover img-round">
                </div>
                <div class="list-center-area">
                    <div class="row m30">
                        <h2>KH헬스</h2>
                    </div>
                    <div class="row">
                        <h4>서울시 영등포구 당산동 00-00</h4>
                    </div>
                    <div class="row center list-exercise-kinds">
                        <h4>헬스</h4>
                    </div>

                    <!--좋아요 수-->
                    <div class="row right">
                        <h4>[10]</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>