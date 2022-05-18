<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	String playerId = request.getParameter("playerId");
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
 %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">

    </script>
</head>
<body>
    <div class="container w300 m30">
        <div class="row center m50">
            <h1>환영합니다.</h1>
        </div>
        <div class="row center">
           <%=playerDto.getPlayerName()%>님, 회원가입을 환영합니다.
        </div>
        <div class="row center">
            살빠Gym 새로운 아이디는 <%=playerDto.getPlayerId()%>입니다.
        </div>
        <div class="row center m40">
           <a href="<%=request.getContextPath()%>/player/login.jsp" class="link link-btn fill">로그인</a>
        </div>
    </div>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>