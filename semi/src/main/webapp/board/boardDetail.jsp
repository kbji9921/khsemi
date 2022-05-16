<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.BoardReplyDto"%>
<%@page import="semi.servlet.DtoDao.BoardReplyDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.BoardDao"%>
<%@page import="semi.servlet.DtoDao.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%
//상세페이지
int boardNo = Integer.parseInt(request.getParameter("boardNo"));

//조회수 증가 후 진입
BoardDao boardDao = new BoardDao();
boardDao.plusReadCount(boardNo); 
BoardDto boardDto = boardDao.selectOne(boardNo);

//내 글인지 확인
String playerId = (String)session.getAttribute("login");
boolean isOwner = playerId != null && playerId.equals(boardDto.getBoardWriter());
//관리자인지 확인
PlayerDao playerDao = new PlayerDao();
PlayerDto playerDto = playerDao.selectOne(playerId);
String playerGrade = playerDto.getPlayerGrade();
boolean isManager = playerGrade != null && playerGrade.equals("관리자");

//댓글 리스트
BoardReplyDao boardReplyDao = new BoardReplyDao();
List<BoardReplyDto> list = boardReplyDao.selectList(boardNo);

%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<%-- <jsp:include page="/jsp/template/boardHeader.jsp"></jsp:include> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/board.css">

<section class="container board-box w850">
	<div class="container">
		<div class="board-detail">
			<span class="board-type"><%=boardDto.getBoardType()%></span>
			<span class="board-title"><%=boardDto.getBoardTitle() %></span>
			<div class="board-rightbox">
				<span class="">작성자: 
				<%if (boardDto.getBoardWriter() == null){%>
				(탈퇴계정)
				<%}else{ %>
				<%=boardDto.getBoardWriter() %>
				<%} %></span>
				<span class="">작성일: <%=boardDto.getBoardTime() %></span>
				<span class="">조회: <%=boardDto.getBoardReadCount() %></span>
			</div>
		</div>
	</div>	
	<div class="flex-container">
	</div>
	<div class="board-content">
	<%=boardDto.getBoardContent() %>
	</div>
</section>


<div class="btn-box w850">
	<%if(isOwner || isManager){ %>
		<a href="boardEdit.jsp?boardNo=<%=boardNo%>" class="modify-btn">수정</a>
	<%} %>
	<%if(isOwner || isManager){ %>
		<a href="javascript:void(0);" onclick="deleteToggle()" class="delete-btn">삭제</a>
	<%} %>
	<a href="boardList.jsp" class="list_btn">목록</a>
</div>

<%-- 댓글 --%>
<div class="reply-container w850">
	<span class="reply-top">댓글 <span class="red"><%=list.size() %></span></span>
	<%for(BoardReplyDto boardReplyDto : list){ 
		int replyNo = boardReplyDto.getReplyNo();
		boolean isreplyOwner = playerId != null && playerId.equals(boardReplyDto.getReplyWriter());
	%>
		<div class="reply-box flex-container">
			<span class="reply-id">
			<%if(boardReplyDto.getReplyWriter() == null){ %>
				(탈퇴계정)
			<%}else{ %>
				<%=boardReplyDto.getReplyWriter() %>
			<%} %>
			</span>
			<pre class="reply-content"><%=boardReplyDto.getReplyContent() %></pre>
			<span class="reply-time">
			<%=boardReplyDto.getReplyTime() %>
			<%if(isreplyOwner || isManager){ %>
				<a href="replyDelete.kh?replyNo=<%=replyNo%>&boardNo=<%=boardNo%>" class="delete-reply"></a>
			<%}%>
			</span>
		</div>
	<%} %>
	<%--댓글 input --%>
	<form action="replyWrite.kh" method="post">
		<div class="flex-container">
			<input type="hidden" name="boardNo" value="<%=boardNo%>">
<%-- 			<input type="hidden" name="replyWriter" value="<%=playerId%>"> --%>
			<textarea name="replyContent" class="reply-textarea" placeholder="내용을 입력해주세요" required></textarea>
			<input type="submit" class="reply-submit" value="댓글등록">
		</div>
	</form>
</div>
<%--삭제팝업 --%>
<div class="delete-popup">
	<button class="close" onclick="deleteToggle()"></button>
	<p><%=boardDto.getBoardNo() %>번 게시물을 삭제하시겠습니까?
	<a href="delete.kh?boardNo=<%=boardNo%>" class="confirm">삭제</a>
</div>
<div class="mordal-layer"></div>

<script type="text/javascript">
	function deleteToggle(){
		var windowHeight = $(window).height();
		$('.mordal-layer').css("height",windowHeight+"px");
		$('.delete-popup').toggle(10);
		$('.mordal-layer').toggle();
	}
</script>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>