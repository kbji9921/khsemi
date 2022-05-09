<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
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
  %>
   <%--출력 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Center Update page</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">

</head>
<body>
	 <form action="update.kh" method="post">
        <div class="container w400 m30">
            <div class="row center">
                <h1>센터정보 수정</h1>
            </div>
            
			 <div class="row">
			 	<label>센터아이디
            	<input type="text" name="centerId" value="<%=centerId%>" class="form-input inpur-round fill" readonly>
			 	</label>
            </div>
            
            <div class="row">
                <label for="centername-input">센터이름</label>
                <input type="text" name="centerName" value="<%=centerDto.getCenterName() %>" autocomplete="off" class="form-input inpur-round fill" id="centername-input">
            </div>
            <div class="row">
                <label for="centerphone-input">전화번호</label>
                <input type="text" name="centerPhone" value="<%=centerDto.getCenterPhone() %>" autocomplete="off" class="form-input input-round fill" id="centerphone-input">
            </div>
            <div class="row">
                <label for="week-input">평일운영시간</label>
                <input type="text" name="centerWeektime" value="<%=centerDto.getCenterWeektime() %>" autocomplete="off" class="form-input input-round fill" id="week-input">
            </div>
            <div class="row">
                <label for="wknd-input">주말운영시간</label>
                <input type="text" name="centerWkndtime" value="<%=centerDto.getCenterWkndtime() %>" autocomplete="off" class="form-input input-round fill" id="wknd-input">
            </div>
            <div class="row">
                <label>주소</label><br>
                <input type="text" name="centerPost" value="<%=centerDto.getCenterPost() %>" autocomplete="off" class="form-input input-round">
                <a href="#" class="btn btn-primary">검색</a>
            </div>
            <div class="row">
                <input type="text" name="centerBasicAddress" value="<%=centerDto.getCenterBasicAddress() %>" autocomplete="off" class="form-input input-round fill">
            </div>
            <div class="row">
                <input type="text" name="centerDetailAddress" value="<%=centerDto.getCenterDetailAddress() %>" autocomplete="off" class="form-input input-round fill">
            </div>
          
            <div class="row">
                <label for="introduction-input">센터소개</label>
                <textarea name="centerIntroduction" class="form-input input-round fill" rows="7"><%=centerDto.getCenterIntroduction() %></textarea>
            </div>
            <div class="row">
                <label>센터대표사진</label>
                <%-- <input type="file" name="centerPics" value="?" accept=".jpg,.png" class="form-input input-round fill">--%>
				</div>
            <div class="row right">
                <button type="submit" class="btn btn-primary">수정</button>
                <a href="/semi/center/detail.jsp?<%=centerDto.getCenterId() %>" class="link link-btn">취소</a>
            </div>
        </div>
    </form>
</body>
</html>