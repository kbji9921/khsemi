<%@page import="semi.servlet.DtoDao.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//목록 및 검색
String type = request.getParameter("type");
String keyword = request.getParameter("keyword");
boolean search = (type!=null) && (keyword!=null);
List<BoardDto> list;

BoardDao boardDao = new BoardDao();
if (search){
	list = boardDao.selectList(type, keyword);
	
}else{
	list = boardDao.selectList();
}
%>

<jsp:include page="../template/header.jsp"></jsp:include>
<jsp:include page="../template/boardHeader.jsp"></jsp:include>



<%--검색창 --%>
<%--<p>type=<%=type%> keyword=<%=keyword %> search=<%=search %></p> --%>
<section class="container w850 board-box">
<div class="search-box">
	<form action="boardList.jsp" method="get" class="flex-form">
		<select name="type" class="search-select">
			<option value="board_title">문의구분</option>
			<option value="board_title">제목</option>
			<option value="board_content">내용</option>
			<option value="board_witer">작성자</option>
		</select>
		<input class="search-input" type="search" name="keyword" placeholder="검색어입력" required>
		<input class="search-submit" type="submit" value="검색">
	</form>
</div>

<table border="1" class="board-tb w850">
	<thead>
		<tr>
			<th>No.</th>
			<th>문의구분</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
	<%for(BoardDto boardDto : list){ %>
		<tr align="center">
			<td><%=boardDto.getBoardNO() %></td>
			<td><%=boardDto.getBoardType()%></td>
			<td align="left">
				<a href="boardDetail.jsp?boardNo=<%=boardDto.getBoardNO()%>">
					<%=boardDto.getBoardTitle() %>
				</a>
			</td>
			<td><%=boardDto.getBoardWriter()%></td>
			<td><%=boardDto.getBoardTime() %></td>
			<td><%=boardDto.getBoardReadCount() %></td>
		</tr>
	<%} %>
	</tbody>
</table>
<div class="btn-box w850">
	<a href="boardWrite.jsp" class="modify-btn">글쓰기</a>
</div>
</section>

<%--페이지네이션 --%>
<h5 class="pagenation">
[이전]
1
2
3
4
5
6
7
8
9
10
[다음]
</h5>

<jsp:include page="../template/footer.jsp"></jsp:include>