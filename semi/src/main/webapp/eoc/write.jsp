<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String centerId = request.getParameter("centerId");
%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">

<form action="write.kh" method="post">
    <div class="container w400 m30">
        <div class="row">
            <label>센터아이디</label>
                <input type="text" name="centerId" autocomplete="off" value="<%=centerId %>" readonly class="form-input input-round fill">
        </div>
        <div class="row">
            <label>운동명</label>
                <select name="exerciseName" class="form-input input-round fill">
                    <option selected>선택</option>
                    <option>헬스</option>
                    <option>필라테스</option>
                    <option>요가</option>
                    <option>테니스</option>
                    <option>수영</option>
                </select>
        </div>
        <div class="row center">
            <button type="submit" class="btn btn-semi">등록</button>
            <a href="<%=request.getContextPath()%>/eoc/detail.jsp?centerId=<%=centerId%>" class="link link-btn">취소</a>
        </div>
    </div>
</form>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>