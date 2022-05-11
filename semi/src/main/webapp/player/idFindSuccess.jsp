<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String playerId = request.getParameter("playerId");
%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<div class="container w450 m30">
        <div class="row m30 center">
        	 <h1>아이디 찾기 결과</h1>
        </div>
        <div class="row center">
        	 <h1><%=playerId %></h1>
        </div>
         <div class="row m40 center">
	          <h2><a href="findPwPlayer.jsp?playerId=<%=playerId%>">비밀번호 찾기</a></h2>
	      </div>
    </div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
