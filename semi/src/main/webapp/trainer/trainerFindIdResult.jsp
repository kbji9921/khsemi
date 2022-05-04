<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String trainerId=request.getParameter("trainerId");

%>

<h1> 찾으시는 아이디는 <%=trainerId%> 입니다.</h1>

<h2><a href= "login.jsp">로그인 하러가기</a></h2>
<h2><a href= "<%=request.getContextPath()%>">메인 페이지로 이동</a></h2>
