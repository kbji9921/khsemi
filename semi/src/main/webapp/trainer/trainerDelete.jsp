<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   String trainerId = (String)request.getSession().getAttribute("trainer");
    %>
    <jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container w400 m30">
<form action = "delete.trainer" method="post">
<div class="row center">
<h1> 회원 탈퇴</h1>
</div>
<div class="row">
	<input type="hidden" name="trainerId" value="<%=trainerId%>">
	<input type="password" name="trainerPw" required class="form-input input-round fill">
</div>
<div class="row">
	<button type="submit" class="btn btn-round btn-danger fill"> 탈퇴 </button>
</div>
</form>
</div>
<%-- 에러표시가 있는 경우 메세지를 출력 --%>
<%if(request.getParameter("error")!=null){ %>
	<h3>비밀번호가 일치하지 않습니다.</h3>
<%} %>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>