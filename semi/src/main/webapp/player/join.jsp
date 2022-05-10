<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<style>
    html{
        background-color: #F5F6F7;
    }
</style>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
    <form action="insert.player" method="post">
   	<div class="container w450 m30 center">
        <div class="row">
            <label>아이디</label>
            	<input type="text" name="playerId" required autocomplete="off" class="form-input fill input-round" >
        </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="playerPw" required class="form-input fill input-round">
        </div>
        
        <div class="row">
        <label>이름</label>
            <input type="text" name="playerName" required autocomplete="off"class="form-input fill input-round">
        </div>
        <div class="row">
            <label>생년월일</label><br>
            <input type="date" name="playerBirth" required class="form-input input-round" autocomplete="off" placeholder="YYYY-MM-DD">
        </div>
        <div class="row">
            <label>성별</label>
            <input type="text" name="playerGender"  class="form-input fill input-round" autocomplete="off">
        </div>
        <div class="row">
            <label>이메일</label>
            <input type="text" name="playerEmail"  class="form-input fill input-round" autocomplete="off">
        </div>
        <div class="row">
            <label>전화번호</label>
            <input type="text" name="playerPhone" required class="form-input fill input-round" autocomplete="off" placeholder="-제외하고 입력">
        </div>
        
        <div class="row m40">
            <input type="submit" class="btn btn-semi btn-round fill" value="가입하기">
        </div>
      </div>  
    </form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
