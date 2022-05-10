<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    html{
        background-color: #F5F6F7;
}
</style>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<a href="<%=request.getContextPath()%>/player/join.jsp">
		<img src="" alt="일반">
	</a>
	
	<a href="<%=request.getContextPath()%>/trainer/trainerJoin.jsp">
		<img src="" alt="강사">
	</a>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>