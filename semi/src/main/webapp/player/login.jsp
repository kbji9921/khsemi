<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<style>
	 h1{
	   font-weight: 600;
	   color: #343b6a;
	   font-size: 20px;
	}
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mypage.css">
	<form action="login.player" method="post">
	
		<div class="container w450 m30 center">
		<div class="row m30 center">
			<h1 class="login-title">일반회원 로그인</h1>
        </div>
        <div class="row m30">
            <label for="playerId">아이디</label>
            <input type="text" name="playerId" required autocomplete="off" class="form-input fill input-round mypage-input" >
        </div>
        <div class="row">
            <label for="playerPw">비밀번호</label>
            <input type="password" name="playerPw" required class="form-input fill input-round mypage-input">
        </div>
      <div class="row m40">
            <input type="submit" class="btn btn-semi btn-round fill mypage-btn" value="로그인">
        </div>
      </div>  
      <div class="row center">
		<%if(request.getParameter("error") != null){ %>
			<h3 style="color:red;">입력한 정보를 찾을 수 없습니다.</h3>
		<%} %>
	</div>
    </form>
	<div class ="row center m30">
		<h3><a href="<%=request.getContextPath() %>/player/findIdPlayer.jsp">아이디 찾기</a> <span> / </span> <a href="findPwPlayer.jsp">비밀번호 찾기</a></h3>
	</div>
	
	
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>