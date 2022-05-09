<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>살빠GYM</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
</head>
<body>
	<main>
		<header>
			<a href="/semi/jsp/index.jsp" id="logo">
				<img src="/semi/images/ci_main_logo.png" width="270px" alt="살빠짐 홈으로 가기">
			</a>
			<nav>
				<ul id="gnb">
					<li><a href="/semi/jsp/index.jsp">Home</a></li>
					<li><a href="/semi/jsp/board/boardList.jsp">문의게시판</a></li>
					
					<li class="gnb-right">
						<a href="#">로그인</a>
						<span class="partition">|</span>
						<a href="#">회원가입</a>
					</li>
					
					<%-- 사용자 로그인 후
					<li class="gnb-right">
						<a href="#">내예약</a>
						<span class="partition">|</span>
						<a href="#">내정보</a>
						<span class="partition">|</span>
						<a href="#">로그아웃</a>
					</li>
					--%>
					
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