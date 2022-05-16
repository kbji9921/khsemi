<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //로그인확인
  String playerId = (String)session.getAttribute("login");
  String trainerId = (String)session.getAttribute("trainer");
  boolean playerLogin = playerId != null;
  boolean trainerLogin = trainerId != null;
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>살빠GYM</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
</head>
<body>
   <main>
      <header>
         <a href="<%=request.getContextPath()%>" id="logo">
            <img src="/semi/images/ci_main_logo.png" width="270px" alt="살빠짐 홈으로 가기">
         </a>
         <nav>
            <ul id="gnb">
               <li><a href="<%=request.getContextPath()%>">Home</a></li>
               <%if(playerLogin){ %>
               <li><a href="/semi/board/boardList.jsp">이용문의</a></li>
               <%} %>

               <%--강사 로그인 후 --%>
              		 <%if(trainerLogin){ %>
                  <li class="gnb-right">
                     <a href="<%=request.getContextPath()%>/player/allMatchingList.jsp?trainerId=<%=trainerId%>">내예약</a>
                     <span class="partition">|</span>
                     <a href="<%=request.getContextPath()%>/trainer/trainerMyPage.jsp">내정보</a>
                     <span class="partition">|</span>
                     <a href="<%=request.getContextPath()%>/trainer/logout.trainer">로그아웃</a>
                  </li>
               <%-- 사용자 로그인 후 --%>
              		 <%}else if(playerLogin){ %>
                  <li class="gnb-right">
                   	<a href="<%=request.getContextPath()%>/player/matchingList.jsp?playerId=<%=playerId%>">내매칭</a>
                     <span class="partition">|</span>
                     <a href="<%=request.getContextPath()%>/reservation/reservationListPlayer.jsp?playerId=<%=playerId%>">내일정</a>
                     <span class="partition">|</span>
                     <a href="<%=request.getContextPath()%>/player/mypage.jsp?playerId=<%=playerId%>">내정보</a>
                     <span class="partition">|</span>
                     <a href="<%=request.getContextPath()%>/player/logout.player">로그아웃</a>
                  </li>
				<%-- 로그인 전 --%>
               <%}else{ %>
               <li class="gnb-right">
                  <a href="<%=request.getContextPath()%>/player/selectLogin.jsp">로그인</a>
                     <span class="partition">|</span>
                  <a href="<%=request.getContextPath()%>/player/selectJoin.jsp">회원가입</a>
               </li>
               <%} %>
               
               <%-- 관리자 로그인 후
               <li class="gnb-right">
                  <a href="#">관리자페이지</a>
                  <span class="partition">|</span>
                  <a href="#">로그아웃</a>
               </li>
               --%>
               
            </ul>
         </nav>
      </header>
   <%-- header end --%>
   
      

   <section class="wrap">