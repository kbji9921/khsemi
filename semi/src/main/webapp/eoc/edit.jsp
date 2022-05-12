<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--준비 --%>
<%
	long eocNo = Long.parseLong(request.getParameter("eocNo"));
%>
<%--처리 --%>
<%
	EocDao eocDao = new EocDao();
	EocDto eocDto = eocDao.selectOne(eocNo);
%>
<%--출력 --%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">

<form action="edit.kh" method="post">
	<input type="hidden" name="eocNo" value="<%=eocDto.getEocNo()%>">
    <div class="container w400 m30">
        <div class="row">
            <label>센터아이디</label>
                <input type="text" name="centerId" autocomplete="off" value="<%=eocDto.getEocCenterId() %>" readonly class="form-input input-round fill">
        </div>
        <div class="row">
            <label>운동명</label>
             <%if(eocDto.getEocExerciseName()==null) {%>
                <select name="exerciseName" class="form-input input-round fill">
                    <option selected>선택</option>
                    <option>헬스</option>
                    <option>필라테스</option>
                    <option>요가</option>
                    <option>테니스</option>
                    <option>수영</option>
                </select>
                <%} else if(eocDto.getEocExerciseName().equals("헬스")){ %>
                <select name="exerciseName" class="form-input input-round fill">
                    <option>선택</option>
                    <option selected>헬스</option>
                    <option>필라테스</option>
                    <option>요가</option>
                    <option>테니스</option>
                    <option>수영</option>
                </select>
                <%} else if(eocDto.getEocExerciseName().equals("필라테스")){ %>
                	 <select name="exerciseName" class="form-input input-round fill">
                    <option>선택</option>
                    <option>헬스</option>
                    <option selected>필라테스</option>
                    <option>요가</option>
                    <option>테니스</option>
                    <option>수영</option>
                </select>
                 <%} else if(eocDto.getEocExerciseName().equals("요가")){ %>
                <select name="exerciseName" class="form-input input-round fill">
                    <option>선택</option>
                    <option>헬스</option>
                    <option>필라테스</option>
                    <option selected>요가</option>
                    <option>테니스</option>
                    <option>수영</option>
                </select>
                 <%} else if(eocDto.getEocExerciseName().equals("테니스")){ %>
                <select name="exerciseName" class="form-input input-round fill">
                    <option>선택</option>
                    <option>헬스</option>
                    <option>필라테스</option>
                    <option>요가</option>
                    <option selected>테니스</option>
                    <option>수영</option>
                </select>
                <%} else {%>
                	 <select name="exerciseName" class="form-input input-round fill">
                    <option>선택</option>
                    <option>헬스</option>
                    <option>필라테스</option>
                    <option>요가</option>
                    <option>테니스</option>
                    <option selected>수영</option>   
            </select>
            <%} %>
        </div>
        <div class="row center">
            <button type="submit" class="btn btn-semi">수정</button>
            <a href="/semi/eoc/detail.jsp?centerId=<%=eocDto.getEocCenterId() %>" class="link link-btn">취소</a>
        </div>
    </div>
</form>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
