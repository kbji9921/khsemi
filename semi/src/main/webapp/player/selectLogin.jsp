<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<div class="row center">
	<div class="row center">
	<label>일반</label>
	<a href="<%=request.getContextPath()%>/player/login.jsp">
		<img src="../images/asdfff.png"  width = "200px"alt="일반">
	</a>
	<label>강사</label>
	<a href="<%=request.getContextPath()%>/trainer/trainerLogin.jsp">
		<img src="../images/asdf.jpg" width = "200px"alt="강사">
	</a>
	</div>
</div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>