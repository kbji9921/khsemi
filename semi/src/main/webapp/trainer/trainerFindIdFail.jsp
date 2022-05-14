<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 실패</title>
    <style>
        .box{
            padding:39px ,40px, 20px;
            font:12px;
            text-align:center;
            border:solid 1px black;
            width: 650px;
            height: 120px;
        }   
        .color{
            background-color: #343b6a;
            height: 50px;
        }
        .color img{
            padding-left: 1em;
            height:50px;
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
    <div class="color">
        <a href="메인페이지 이동"><img src="../image/ci_main_logo.png"></a>
    </div>
    <div class="Container w650 m50">
        <div class="row center m50">
            <h2>아이디 찾기</h2>
        </div>
        <div class="row m40">
            <hr>
        </div>
        <div class="row center">
            <h5>고객님의 정보와 일치하는 아이디가 없습니다.</h5>
        </div>
        <div class="box display-center">
        </div>
        <!-- 버튼-->
        <div class="row m50 center">
            <input type="submit" class="btn btn-round btn-semi" value="회원가입">
            <input type="submit" class="btn btn-round btn-semi" value="다시입력">
        </div>
    </div>
</body>
</html>
