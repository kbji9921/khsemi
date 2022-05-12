<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.BoardDao"%>
<%@page import="semi.servlet.DtoDao.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//상세페이지
int boardNo = Integer.parseInt(request.getParameter("boardNo"));

//조회수 증가 후 진입
BoardDao boardDao = new BoardDao();
boardDao.plusReadCount(boardNo); 
BoardDto boardDto = boardDao.selectOne(boardNo);

//내 글인지 확인
//String playerId = (String)session.getAttribute("login");
//boolean isOwner = playerId != null && playerId.equals(boardDto.getBoardWriter());
//관리자인지 확인
//boolean isManager = playerGrade != null && playerGrade.equals("관리자");
%>

<jsp:include page="../template/header.jsp"></jsp:include>
<jsp:include page="../template/boardHeader.jsp"></jsp:include>

<section class="container w850 board-box">
	<div class="flex-container">
		<span class="board-lable">문의구분</span>
		<span class="board-input"><%=boardDto.getBoardType()%></span>
	</div>
	<div class="flex-container">
		<span class="board-lable">제목</span>
		<span class="board-input"><%=boardDto.getBoardTitle() %></span>
	</div>
	<div class="flex-container">
		<span class="board-lable">작성자</span>
		<span class="board-input"><%=boardDto.getBoardWriter() %></span>
	</div>
	<div class="flex-container">
		<span class="board-lable">작성일</span>
		<span class="board-input"><%=boardDto.getBoardTime() %></span>
	</div>
	<div class="flex-container">
		<span class="board-lable">조회수</span>
		<span class="board-input"><%=boardDto.getBoardReadCount() %></span>
	</div>
	<div class="board-content">
	<%=boardDto.getBoardContent() %>
	</div>
</section>

<div class="btn-box w850">
	<%-- <%if(isOwner || isManager){ %> --%>
	<a href="#" class="delete-btn">삭제</a>
	<%-- <%} %> --%>
	<a href="/semi/jsp/board/boardList.jsp" class="list_btn">목록</a>
	<%-- <%if(isOwner || isManager){ %> --%>
	<a href="#" class="modify-btn">수정</a>
	<%-- <%} %> --%>
</div>

<jsp:include page="../template/footer.jsp"></jsp:include>