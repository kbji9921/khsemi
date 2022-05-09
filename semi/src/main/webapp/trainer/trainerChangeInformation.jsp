<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%-- 준비 --%>
<%
	request.setCharacterEncoding("UTF-8");
	String trainerId= "testuser";
%>    
    
    <%-- 처리 --%>
<%
    TrainerDao trainerDao = new TrainerDao();
    TrainerDto trainerDto = trainerDao.selectOne(trainerId); 

%>

<form action="Information.kh" method="post">
<div class="Container w500">
		<div class="row center">
		<h1>개인정보 변경</h1>
		</div>
		<div class="row">
		<label>프로필 사진</label>
		<input type="file" name="trainerProfile" accept="jpg,png">
		</div>
		<div class="row">
		<label>아이디</label>
		<input type="hidden" name="trainerId" value="<%=trainerDto.getTrainerId()%>" required class="form-input full input-round" autocomplete="off">
		</div>
		<div class="row">
		<label>이름</label>
		<input type="text" name="trainerName" value="<%=trainerDto.getTrainerName()%>" required class="form-input full input-round" autocomplete="off">
		</div>
		<div class="row">
		<label>생년월일</label>
		<input type="date" name="trainerBirth" value="<%=trainerDto.getTrainerBirth()%>" required class="form-input full input-round" autocomplete="off">
		</div>
		<div class="row">
		<label>전화번호</label>
		<input type="tel" name="trainerPhone" value="<%=trainerDto.getTrainerPhone()%>" required class="form-input full input-round" autocomplete="off">
		</div>
		<div class="row">
		<label>이메일</label>
		<input type= "email" name="trainerEmail" value="<%=trainerDto.getTrainerEmail()%>" class="form-input full input-round" autocomplete="off">
		</div>
		<div class="row">
		<label>가격</label>
		<input type="number" name="trainerPrice" value="<%=trainerDto.getTrainerPrice()%>" required class="form-input full input-round" autocomplete="off">
		</div>
		<div class= "row">
		<label>운동종목</label>
		<select name="trainerSports" required class="form-input full input-round">
			<option>선택</option>
			<%if(trainerDto.getTrainerSports().equals("헬스")){%>
			<option value="헬스" selected>헬스</option>
			<%}else{ %>
			<option value="헬스">헬스</option>
			<%} %>
			<%if(trainerDto.getTrainerSports().equals("필라테스")){%>
			<option value="필라테스" selected>필라테스</option>
			<%}else{ %>
			<option value="필라테스">필라테스</option>
			<%} %>
			<%if(trainerDto.getTrainerSports().equals("요가")){%>
			<option value="요가" selected>요가</option>
			<%}else{ %>
			<option value="요가">요가</option>
			<%} %>
			<%if(trainerDto.getTrainerSports().equals("수영")){%>
			<option value="수영" selected>수영</option>
			<%}else{ %>
			<option value="수영">수영</option>
			<%} %>
			<%if(trainerDto.getTrainerSports().equals("테니스")){%>
			<option value="테니스" selected>테니스</option>
			<%}else{ %>
			<option value="테니스">테니스</option>
			<%} %>
		</select>
		</div>
		<label>비밀번호</label>
			<input type="password" name="trainerPw" required class="form-input full input-round" autocomplete="off">
		</div>
        <div class="row">
            <input type="submit" class="btn btn-primary btn-round full" value="변경">
        </div>
</div>
</form>
<%if(request.getParameter("error")!=null){ %>
<h3>비밀번호가 일치하지 않습니다.</h3>
<%} %>