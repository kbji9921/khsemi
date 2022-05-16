<%@page import="semi.servlet.DtoDao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    String id = (String)request.getSession().getAttribute("login");
    BoardDao boardDao = new BoardDao();
    int number =boardDao.getSequence();
    
    %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
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
	<form action="write.kh" method="post" id="boardInsert" enctype="multipart/form-data">
	<input type="hidden" name="boardNo"value=<%=number%>>
	<input type="hidden" name="boardWriter"value=<%=id%>>
		<div class="flex-container">
			<label for="boardType" class="board-lable">문의구분</label>
			<select name="boardType" class="board-select" id="boardType" required>
				<option value="" selected hidden>==== 선택 ====</option>
				<option>이용문의</option>
				<option>포인트 구입 신청</option>
				<option>환불신청</option>
				<option>기타문의</option>
			</select>
		</div>
		<div class="flex-container">
			<label for="boardTitle" class="board-lable">제목</label>
			<input type="text" class="board-input" name="boardTitle" id="boardTitle" required>
		</div>
		<textarea name="boardContent"></textarea>
	</form>
</section>

<div class="btn-box w850">
	<a href="javascript:void(0)" type="submit" class="confirm-btn">저장</a>
	<a href="boardList.jsp" class="list_btn">목록</a>
</div>
<script>
$(function(){
	$('.confirm-btn').click(function(e){
		$('#boardInsert').submit();
	});
});
</script>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>

