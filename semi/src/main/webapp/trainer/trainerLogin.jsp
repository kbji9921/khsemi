<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    
    %>
    <jsp:include page="/jsp/template/header.jsp"></jsp:include>
    <style>
	 h1{
	   font-weight: 600;
	   color: #343b6a;
	   font-size: 20px;
	}
</style>
<form action="login.kh" method="post">
    <div class="container w450 m40">
        <div class="row center">
            <h1>강사 로그인</h1>
        </div>
        <div class="row">
            <label for="id">아이디</label>
            <input type="text" name="trainerId" required class="form-input fill input-round" id="id">
        </div>
        <div class="row">
            <label for="password">비밀번호</label>
            <input type="password" name="trainerPw" required class="form-input fill input-round" id="password">
        </div>
        <div class="row">
            <input type="submit" class="btn btn-primary fill btn-semi" value="로그인"> 
        </div>
        <div class="row center">
            <a href="trainerFindId.jsp" class="link">아이디가 기억나지 않아요</a>
        </div>
        <div class="row center">
            <a href="trainerFindPw.jsp" class="link">비밀번호가 기억나지 않아요</a>
        </div> 
        <div class="row center">
         <%-- 에러표시가 있는 경우 메세지를 출력 --%>
         <%if(request.getParameter("error")!=null){ %>
         <h3 style="color:red">로그인 정보가 일치하지 않습니다.</h3>
         <%} %>           
        </div>
    </div>
</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>