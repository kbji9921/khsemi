<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playerId = request.getParameter("playerId");
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
%>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/header.jsp"></jsp:include>
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
            <h2>아이디 찾기</h2>
        </div>
        <div class="row m40">
            <hr>
        </div>
        <div class="row center">
            <h5>고객님의 정보와 일치하는 아이디 목록입니다.</h5>
        </div>
        <div class="box display-center">
            <ul>
                <li>
                    <strong class="tab">
                        <label for="select0" class="label_rd"><%=playerId%></label>
                    </strong>
                    <input type="hidden" name="nv_id0">
                    <span>가입:<%=playerDto.getPlayerJoindate()%></span>
                </li>
            </ul>
        </div>
        <!-- 버튼-->
        <div class="row m50 center">
            <a href="<%=request.getContextPath()%>/player/login.jsp" class="link link-btn" >로그인하기</a>
            <a href="<%=request.getContextPath()%>/player/set_pw.jsp?playerId=<%=playerId%>>" class="link link-btn" >비밀번호 찾기</a>
        </div>
    </div>
    </form>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/footer.jsp"></jsp:include>