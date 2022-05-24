<%@page import="semi.servlet.DtoDao.BoardReplyDto"%>
<%@page import="semi.servlet.DtoDao.BoardReplyDao"%>
<%@page import="semi.servlet.DtoDao.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//페이지네이션
int p;
try{
	p = Integer.parseInt(request.getParameter("p"));
	if(p <= 0) throw new Exception();
}catch(Exception e){p = 1;}

int s;
try{
	s = Integer.parseInt(request.getParameter("s"));
	if(s <= 0) throw new Exception();
}catch(Exception e){s = 10;}

%>
<%
//목록 및 검색
String type = request.getParameter("type");
String keyword = request.getParameter("keyword");
boolean search = (type!=null && !type.equals("")) && (keyword!=null && !keyword.equals(""));
List<BoardDto> list;

BoardDao boardDao = new BoardDao();
if (search){
// 	list = boardDao.selectList(type, keyword);
	list = boardDao.selectListByPaging(p,s,type,keyword);
	
}else{
// 	list = boardDao.selectList();
	list = boardDao.selectListByPaging(p,s);
}

//댓글수 표시
BoardReplyDao boardReplyDao = new BoardReplyDao();
boolean replyExsist;


%>


<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<jsp:include page="/jsp/template/boardHeader.jsp"></jsp:include>


<%--검색창 --%>
<%--<p>type=<%=type%> keyword=<%=keyword %> search=<%=search %></p> --%>
<section class="container w850">
	<div class="search-box">
		<form action="<%=request.getContextPath()%>/board/boardList.jsp" method="get" class="flex-form">
		<%if(type==null || type.equals("board_type")){%>
			<select name="type" class="search-select">
				<option value="board_type" selected>문의구분</option>
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
				<option value="board_writer">작성자</option>
			</select>
		<%}else if(type.equals("board_title")){%>
			<select name="type" class="search-select">
				<option value="board_type">문의구분</option>
				<option value="board_title" selected>제목</option>
				<option value="board_content">내용</option>
				<option value="board_writer">작성자</option>
			</select>
		<%}else if(type.equals("board_content")){%>
			<select name="type" class="search-select">
				<option value="board_type">문의구분</option>
				<option value="board_title">제목</option>
				<option value="board_content" selected>내용</option>
				<option value="board_writer">작성자</option>
			</select>
		<%}else{%>
			<select name="type" class="search-select">
				<option value="board_type">문의구분</option>
				<option value="board_title">제목</option>
				<option value="board_content">내용</option>
				<option value="board_writer" selected>작성자</option>
			</select>
		<%} %>
		
		
		<%if(type!=null && keyword!=null){ %>
			<input class="search-input" type="search" name="keyword" placeholder="검색어입력" value ="<%=keyword%>" >
			<input class="search-submit" type="submit" value="검색">
		<%}else{ %>
			<input class="search-input" type="search" name="keyword" placeholder="검색어입력" >
			<input class="search-submit" type="submit" value="검색">
		<%} %>
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
	<%for(BoardDto boardDto : list){ 
		List<BoardReplyDto> replyList = boardReplyDao.selectList(boardDto.getBoardNo());
		replyExsist = replyList.size()>0;
		%>
		<tr align="center">
			<td><%=boardDto.getBoardNo() %></td>
			<td><%=boardDto.getBoardType()%></td>
			<td align="left">
				<a href="<%=request.getContextPath()%>/board/boardDetail.jsp?boardNo=<%=boardDto.getBoardNo()%>">
					<%=boardDto.getBoardTitle() %>
				</a>
				<%if(replyExsist){ %>
					<span class="reply_count">(<%=replyList.size()%>)</span>
				<%} %>
			</td>
			<td>
			<%if(boardDto.getBoardWriter() == null){%>
			(탈퇴계정)
			<%}else{ %>
			<%=boardDto.getBoardWriter()%></td>
			<%} %>
			<td><%=boardDto.getBoardTime() %></td>
			<td><%=boardDto.getBoardReadCount() %></td>
		</tr>
	<%} %>
	<%if(list.isEmpty()){ %>
		<tr>
			<td colspan="6" align=center>
			검색결과가 없습니다.
			</td>
		</tr>
	<%} %>
	</tbody>
</table>
<div class="btn-box w850">
	<a href="<%=request.getContextPath()%>/board/boardWrite.jsp" class="modify-btn">글쓰기</a>
</div>
</section>

<%--페이지네이션 --%>
<%
	int count;
	if(search){
		count = boardDao.countByPaging(type, keyword);
	}else{
		count = boardDao.countByPaging();
	}
	
	//마지막페이지번호
	int lastPage = (count+s-1)/s;
	//블록크기
	int blockSize = 10;

	int endBlock = (p+blockSize-1)/blockSize *blockSize;
	int startBlock = endBlock - (blockSize-1);
	
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>

<%--pagination --%>
<h4 class="pagination-board">
	<%if(search){ %>
	<%-- 검색 --%>
		<%if(startBlock > 1 ){ %>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;&lt;</a>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
		<%}else if(list.size()>0){%>
			<a href="javascript:void(0);">&lt;&lt;</a>
			<a href="javascript:void(0);">&lt;</a>
		<%} %>
		<%for(int i=startBlock; i<=endBlock; i++){ %>
			<a <%if(i == p){ %> class="active" <%}%>
			href="<%=request.getContextPath()%>/board/boardList.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
		<%}%>
		<%if(endBlock < lastPage ){ %>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;&gt;</a> 
		<%}else if(list.size()>0){%>
			<a href="javascript:void(0);">&gt;&gt;</a>
			<a href="javascript:void(0);">&gt;</a>
		<%} %>
	<%}else{ %>
	<%-- 목록 --%>
		<%if(startBlock > 1 ){ %>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp?p=1&s=<%=s%>">&lt;&lt;</a>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
		<%}else if(list.size()>0){%>
			<a href="javascript:void(0);">&lt;&lt;</a>
			<a href="javascript:void(0);">&lt;</a>
		<%} %>
		<%for(int i=startBlock; i<=endBlock; i++){ %>
	 		<a <%if(i == p){ %> class="active" <%}%>
	 		href="<%=request.getContextPath()%>/board/boardList.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
	 	<%}%>
	 	<%if(endBlock < lastPage ){ %>
		 	<a href="<%=request.getContextPath()%>/board/boardList.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<a href="<%=request.getContextPath()%>/board/boardList.jsp?p=<%=lastPage%>&s=<%=s%>">&gt;&gt;</a>
		<%}else if(list.size()>0){%>
			<a href="javascript:void(0);">&gt;</a>
			<a href="javascript:void(0);">&gt;&gt;</a>
		<%} %>
<%} %>
</h4>


<jsp:include page="/jsp/template/footer.jsp"></jsp:include>