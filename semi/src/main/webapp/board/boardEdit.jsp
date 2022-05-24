<%@page import="semi.servlet.DtoDao.BoardDto"%>
<%@page import="org.omg.CORBA.INTERNAL"%>
<%@page import="semi.servlet.DtoDao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int boardNo = Integer.parseInt(request.getParameter("boardNo"));
BoardDao boardDao = new BoardDao();
BoardDto boardDto = boardDao.selectOne(boardNo);

%>
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<jsp:include page="/jsp/template/boardHeader.jsp"></jsp:include>

<script type="text/javascript">
$(function(){
	$("textarea[name=boardContent]").summernote({
	placeholer : "내용입력",
		height : 400
	})
});

</script>


	

<section class="container w850 board-box">
	<form action="edit.kh" method="post" id="boardInsert" enctype="multipart/form-data">
	<input type="hidden" name="boardNo" value="<%=boardNo%>">
	<input type="hidden" name="boardWriter" value="<%=boardDto.getBoardWriter() %>">
		<div class="flex-container">
			<label for="boardType" class="board-lable">문의구분</label>
				<select name="boardType" class="board-select" id="boardType" required>
					<option value="" <%if(boardDto.getBoardType() == null){ %>selected<% } %> hidden>==== 선택 ====</option>
					<option <% if(boardDto.getBoardType().equals("이용문의")){ %> selected="selected" <% } %>>이용문의</option>
					<option <% if(boardDto.getBoardType().equals("포인트 구입 신청")){ %> selected="selected" <% } %>>포인트 구입 신청</option>
					<option <% if(boardDto.getBoardType().equals("환불신청")){ %> selected="selected" <% } %>>환불신청</option>
					<option <% if(boardDto.getBoardType().equals("기타문의")){ %> selected="selected" <% } %>>기타문의</option>
				</select>
		</div>
		<div class="flex-container">
			<label for="boardTitle" class="board-lable">제목</label>
			<input type="text" class="board-input" name="boardTitle" id="boardTitle" value="<%=boardDto.getBoardTitle() %>" required>
		</div>
		<textarea name="boardContent"><%=boardDto.getBoardContent() %></textarea>
	</form>
</section>

<div class="btn-box w850">
	<a href="javascript:void(0)" type="submit" class="confirm-btn" >저장</a>
	<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="list_btn">목록</a>
</div>
<script>
$(function(){
	$('.confirm-btn').click(function(e){
		$('#boardInsert').submit();
	});
});
</script>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>

