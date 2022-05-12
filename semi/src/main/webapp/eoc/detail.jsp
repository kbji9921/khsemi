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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/center1.css">

 <!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <script type="text/javascript">
        $(function(){
            $(".delete-btn").click(function(){
                return confirm("정말 삭제하시겠습니까?");
            });
        });
    </script>

<div class="c-container w300 m30">
	<div class="row m20">
		<table class="c-table table-border">
			<thead>
				<tr>
					<th colspan="3">센터 운동 관리</th>
				</tr>
			</thead>
			<tbody>
				<%for (EocDto eocDto : list) {%>
				<tr>
					<td width="60%"><%=eocDto.getEocExerciseName()%></td>
					<td><a href="<%=request.getContextPath() %>/eoc/edit.jsp?eocNo=<%=eocDto.getEocNo()%>" class="link">수정</a></td>
					<td>
					<a href="<%=request.getContextPath() %>/eoc/delete.kh?eocNo=<%=eocDto.getEocNo()%>&centerId=<%=eocDto.getEocCenterId()%>" 
					class="link delete-btn">삭제</a>
					</td>
				</tr>
				<%}%>
			</tbody>
		</table>
		<div class="row right">
			<a href="<%=request.getContextPath()%>/eoc/write.jsp?centerId=<%=centerId%>" class="link link-btn">추가</a>
		</div>
	</div>
</div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>