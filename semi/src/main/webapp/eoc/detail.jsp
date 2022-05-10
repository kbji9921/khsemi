<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--준비 --%>
<%
	String centerId = request.getParameter("centerId");
%>
<%--처리 --%>
<%
	EocDao eocDao = new EocDao();
	List<EocDto> list = eocDao.selectList(centerId);
%>
<%--출력 --%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">

	 <div class="container w400 m30">
        <div class="row center">
            <h1>운동종목</h1>
        </div>
        <div class="row right">
            <a href="/semi/eoc/write.jsp?centerId=<%=centerId %>" class="link link-btn">추가</a>
        </div>
        <div class="row">
            <table class="table table-border exercise-stripe fill">
                <thead>
                    <tr>
                        <th class="exercise-font-color"  colspan="3">운동종목</th>
                    </tr>
                </thead>
                <tbody>
                <%for(EocDto eocDto : list){ %>
                    <tr>
                        <td width="70%">
                        	<%=eocDto.getEocExerciseName() %>
                        </td>
                        <td>
                            <a href="/semi/eoc/edit.jsp?eocNo=<%=eocDto.getEocNo() %>" class="link">수정</a>
                        </td>
                        <td>
                            <a href="/semi/eoc/delete.kh?eocNo=<%=eocDto.getEocNo() %>&centerId=<%=eocDto.getEocCenterId() %>" class="link">삭제</a>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>