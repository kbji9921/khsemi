<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
}
.container{
	background-color: #ddd;
	height:500px;
	margin:50px;
}
</style>
</head>
<body>
	<main>
		<header>
			<a href="#" id="logo">
				<%--<img src=""> --%>
				<h1>살빠GYM</h1>
			</a>
			<nav>
				<ul id="gnb">
					<li><a href="#">Home</a></li>
					<li><a href="#">고객의소리</a></li>
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</nav>
		</header>
	<%-- header end --%>
	
	<%-- sports s --%>
		<article class="container">
		</article>
	<%-- sports e --%>
	
	<%-- trainer s --%>
		<article class="container">
		</article>
	<%-- trainer e --%>
	
	<%-- center s --%>
		<article class="container">
		</article>
	<%-- center e --%>
	
	<%--footer --%>
		<footer class="footer">
		</footer>
	</main>
</body>
</html>