<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
 String playerId = (String)request.getSession().getAttribute("login"); %>


<jsp:include page="/jsp/template/header.jsp"></jsp:include>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 사진 등록</title>
    <style>
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
        <script src="<%=request.getContextPath()%>/js/upload.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
    </script>
</head>
<body>
<form class="join-form" action="profileInsert.player" method="post" enctype="multipart/form-data">
    <div class="container w400 m50">
        <div class="row center m50">
            <h2>프로필 등록</h2>
        </div>
        <div class="row m40">
            <hr>
        </div>
        <div class="box">
            <div class="row center">
            <ul>
                <li>
                    프로필 사진을 등록하세요.
                </li>
                <li>
                    jpg, png 파일만 등록이 가능합니다.
                </li>
                <li>
                    크기는 2mb 이내로 등록하세요
                </li>
            </ul>
            </div>
            <div  class="row center m30">
           <img src="" class="thumb"/ width="80%">
           	 <div  class="row center">
        	      <input type="file" class="hidden_input" id="imageSelector" name="playerAttachment" accept="image/jpeg, image/jpg, image/png" multiple />
        	<input type="hidden" name="playerId" value="<%=playerId%>">
       	</div>
	       	<button type="submit" class="btn btn-semi">등록하기</button>
	       	<a href="<%=request.getContextPath()%>/player/mypage.jsp?playerId=<%=playerId%>" class="link link-btn">취소</a>
        </div>
                
        </div>
        </div>
        <!-- 버튼-->
</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>