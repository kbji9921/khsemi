<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- include libraries(jQuery, bootstrap) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<jsp:include page="../template/header.jsp"></jsp:include>
<jsp:include page="../template/boardHeader.jsp"></jsp:include>

<script type="text/javascript">
$(function(){
	$("textarea[name=boardContent]").summernote({
		placeholer : "내용입력",
		height : 400
});
})
</script>

	

<section class="container w850 board-box">
	<form action="write.kh" method="post" id="boardInsert">
		<div class="flex-container">
			<span class="board-lable">문의구분</span>
			<select name="boardType" class="board-input" required>
				<option value="" selected hidden>====선택====</option>
				<option>이용문의</option>
				<option>포인트 구입 신청</option>
				<option>환불신청</option>
				<option>기타문의</option>
			</select>
		</div>
		<div class="flex-container">
			<span class="board-lable">제목</span>
			<input type="text" class="board-input" name="boardTitle">
		</div>
		<textarea name="boardContent"></textarea>
	<button type="submit" class="confirm-btn">저장</button>
	</form>
</section>

<div class="btn-box w850">
	<a href="/semi/jsp/board/boardList.jsp" class="list_btn">목록</a>
</div>

<jsp:include page="../template/footer.jsp"></jsp:include>

