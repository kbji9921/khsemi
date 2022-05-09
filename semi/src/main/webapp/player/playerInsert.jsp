<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입 화면</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/common.css"> -->
    <style>
    html{
        background-color: #F5F6F7;
    }
    </style>
</head>
<body>
    <form action="insert.player" method="post">
    <div class="container w450">
  <!-- <div class="row center">
         <img src="../images/ci_main_logo.png" width="165">
        </div> --> 
                <div class="row center">
        <h1>회원가입</h1>
        </div>
        <div class="row">
            <label>아이디</label>
            <input type="text" name="playerId" autocomplete="off" class="form-input fill input-round" >
        </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="playerPw"  class="form-input fill input-round">
        </div>
        <div class="row">
                <label>비밀번호 재확인</label>
                <input type="password" id="password-check"  class="form-input fill input-round">
            </div>
            <div class="row">
            <label>이름
            <input type="text" name="playerName"  autocomplete="off"class="form-input fill input-round">
        </label>
        </div>
        <div class="row">
            <label>생년월일</label><br>
            <input type="date" name="playerBirth"  class="form-input input-round" autocomplete="off" placeholder="YYYY-MM-DD">
        </div>
        <div class="row">
            <label>성별</label>
            <input type="text" name="playerGender"  class="form-input fill input-round" autocomplete="off">
        </div>
        <div class="row">
            <label>이메일</label>
            <input type="email" name="playerEmail"  class="form-input fill input-round" autocomplete="off">
        </div>
        <div class="row">
            <label>전화번호</label>
            <input type="tel" name="playerPhone"  class="form-input fill input-round" autocomplete="off" placeholder="-제외하고 입력">
        </div>
        <div class="row m40">
            <input type="submit" class="btn btn-semi btn-round fill" value="가입하기">
        </div>
        <div class="row center">
            <a href="#" class="link">이용약관</a>
            <a href="#" class="link">개인정보 처리방침</a>
            <a href="#" class="link">회원정보 고객센터</a>
        
        </div>
        <div class="row center">
        <p>Copyright 살빠짐 Corp. All Rights Reserved.</p>
        </div>
    </div>
</form>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>