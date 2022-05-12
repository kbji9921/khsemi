<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String trainerId = (String)request.getSession().getAttribute("trainer"); %>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<div class="container w400 m30">
<div class="row center m30">
<h1>비밀번호 재설정</h1>
</div>
<div class="row center">
<form action="setPw.trainer" method="post">
	<div class="row">
	<label>현재 비밀번호</label>
	<input type="hidden" name = "trainerId" value="<%=trainerId%>" class="form-input input-round fill">
 	<input type="password" name ="trainerPw"  class="form-input input-round fill">
	</div>
	<div class="row">
	<label>새 비밀번호</label>
 	<input type="password" name="changePw1" class="form-input input-round fill">
	</div>
	<div class="row">
	<label>새 비밀번호 확인</label>
 	<input type="password" name="changePw2" class="form-input input-round fill">
	</div>
	<div class="row">
	<button type="submit" class="btn btn-semi fill">재설정</button>
	</div>
</form>
</div>
</div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>