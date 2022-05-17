<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    
    %>
    <jsp:include page="/jsp/template/header.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mypage.css">
<form action="<%=request.getContextPath()%>/trainer/login.kh" method="post">
    <div class="container w450 m40">
        <div class="row center">
            <h1 class="login-title">강사회원 로그인</h1>
        </div>
        <div class="row">
            <label for="id">아이디</label>
            <input type="text" name="trainerId" required class="form-input fill input-round mypage-input" id="id">
        </div>
        <div class="row">
            <label for="password">비밀번호</label>
            <input type="password" name="trainerPw" required class="form-input fill input-round mypage-input" id="password">
        </div>
        <div class="row">
            <input type="submit" class="btn btn-primary fill btn-semi mypage-btn" value="로그인"> 
        </div>
        <div class ="row center m30">
		<h3><a href="<%=request.getContextPath()%>/trainer/trainerFindId.jsp" class="find-account">아이디 찾기</a> <span class="find-account"> | </span> <a href="<%=request.getContextPath()%>/trainer/trainerFindPw.jsp" class="find-account">비밀번호 찾기</a></h3>
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