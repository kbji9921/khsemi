<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.PlayerAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String playerId = request.getParameter("playerId");
%>
<%
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
	
	PlayerAttachmentDao playerAttachmentDao = new PlayerAttachmentDao();
	int attach = playerAttachmentDao.selectOne(playerId);
	
	AttachmentDao attachmentDao = new AttachmentDao();
	AttachmentDto attachmentDto = attachmentDao.selectOne(attach);
	
	boolean noPic = attachmentDto==null;
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 사진 등록</title>
    <style>
    .img{
    width:100%;}
        .box{
            padding:39px ,40px, 20px;
            font:12px;
            text-align:center;
            border:solid 1px black;
            width: 400px;
            height: 650px;
            flex-direction: column;
        }   
        input,
        .pw-btn{
            width: 350px !important;
            border-radius:0.25em !important;
        }
        li{
            list-style-type: none;
        }
    </style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
    </script>
</head>
<body>
<form class="join-form" action="profileDelete.player" method="get">
    <div class="container w400 m50">
        <div class="row center m50">
            <h2>프로필 삭제</h2>
        </div>
        <div class="row m40">
            <hr>
        </div>
        <div class="box">
            <div class="row center">
				<a href="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>"></a>
                <img src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>" class="img img-circle asdf">
            </div>
           	 <div  class="row center">
	        	<input type="hidden" name="playerId" value="<%=playerId%>">
	        	<input type="hidden" name="attachmentNo" value="<%=attach%>">
	       	</div>
       		<button type="submit" class="btn btn-semi">삭제하기</button>
       		<a href="<%=request.getContextPath()%>/player/mypage.jsp?playerId=<%=playerId%>" class="link link-btn">취소</a>
        </div>
       </div>
        <!-- 버튼-->
</form>
</body>
</html>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>