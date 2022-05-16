<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String trainerId=request.getParameter("trainerId");
	TrainerDao trainerDao = new TrainerDao();
	TrainerDto trainerDto = trainerDao.selectOne(trainerId);
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 성공</title>
    <style>
        .box{
            padding:39px ,40px, 20px;
            font:12px;
            text-align:center;
            border:solid 1px black;
            width: 650px;
            height: 120px;
        }   
        
        .tab { 
            padding-right:100px;
         }
    </style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">

    </script>
</head>
<body>
<form>
    <div class="container w650 m50">
        <div class="row center m50">
            <h2>비밀번호 재설정</h2>
        </div>
        <div class="row m40">
            <hr>
        </div>
        <div class="row center">
            <h5>비밀번호 재설정이 완료 되었습니다.</h5>
        </div>
        <div class="row m50 center">
            <a href="trainerLogin.jsp" class="link link-btn" >로그인하기</a>
        </div>
    </div>
    </form>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>