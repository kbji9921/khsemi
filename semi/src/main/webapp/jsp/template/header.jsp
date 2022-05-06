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
<style>
#gnb {
	display:flex;
	justify-content: space-around;
	height: 50px;
    background-color: #343b6a;
}
.gnb-right{
	display:flex;
	justify-content: space-around;
}
.partition{
	line-height: 47px;
    color: #fff;
    padding: 0 15px;
}
.wrap{
	padding: 40px 0 130px 0;
}
.container{
    margin: 30px 0;
    border-radius: 20px;
    padding: 28px 0;
}
.container .contents-title{
	font-weight: 600;
    margin-bottom: 10px;
    padding-left: 20px;
    font-size: 25px;
    color: #343b6a;
}

.container .contents-info{
	font-weight: 500;
    margin-bottom: 20px;
    padding-left: 20px;
    font-size: 16px;
}

.flex-container {
    display: flex;
    flex-direction: row;
    background-color: #efefef;
    border-radius: 20px;
    justify-content: space-evenly;
}
.flex-container.exercise {
    background: none;
}
.content-box{
	text-align:center;
}
.content-box > a{
	font-size: 18px;
    font-weight: 600;
    color: #343b6a;
}
#gnb li a {
    font-weight: 600;
    height: 50px;
    line-height: 50px;
    color: #fff;
    font-size: 17px;
    }
#gnb li:first-child {
	margin-right:500px;
	    }
#logo{
	display: block;
	margin: 40px 0;
    font-size: 3em;
    font-weight: 600;
}
.content {
    width: 160px;
    height: 160px;
    background-color: #ddd;
    box-sizing: border-box;
    margin: 20px;
    border-radius: 100%;
    overflow: hidden;
}
.content a:hover {
    background-color: #ccc;
    transition: 0.3s;
}
.content.exercise {
    width: 130px;
    height: 130px;
    background-color: #efefef;
}
.content.exercise > a {
    width: 100%;
    height:100%;
    display:flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
.footer{
	color: #777;
    font-size: 14px;
}
.footer p:nth-child(2){
	margin: 20px 0;
    line-height: 18px;
}
.footer-copyright{
	font-size:11px;
}
</style>
</head>
<body>
	<main>
		<header>
			<a href="#" id="logo">
				<img src="/semi/images/ci_main_logo.png" width="270px" alt="살빠짐 홈으로 가기">
			</a>
			<nav>
				<ul id="gnb">
					<li><a href="#">Home</a></li>
					<li><a href="#">고객의소리</a></li>
					
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