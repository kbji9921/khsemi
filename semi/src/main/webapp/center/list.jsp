<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--준비 --%>
 <%
 	String type = request.getParameter("type");
 	String keyword = request.getParameter("keyword");
 %>
 <%-- 페이지네이션 처리 --%>
 <%
 	 int p;
 	 try{
 		 p= Integer.parseInt(request.getParameter("p"));
 		 if(p <=0) throw new Exception();
 	 }
 	 catch(Exception e){
 		 p=1;
 	 }
 	 
 	 int s;
 	 try{
 		 s = Integer.parseInt(request.getParameter("s"));
 		 if(s<=0) throw new Exception();
 	 }
 	 catch(Exception e){
 		 s=4;
 	 }
 %>
 <%--처리 --%>
 <%
 	CenterDao centerDao = new CenterDao();
 	EocDao eocDao = new EocDao();
 	boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
 	
 	List<CenterDto> centerList;
 	List<EocDto> eocList;
 	if(isSearch){
 		centerList = centerDao.selectListByPaging(p,s,type, keyword);
 		//eocList = eocDao.selectList(centerId);
 	}
 	else{
 		centerList = centerDao.selectListByPaging(p,s);
 		//eocList = eocDao.selectList(centerId);
 	}
 	
 %>
 
 <!-- 숫자(페이지네이션) 링크 -->
<%
	int count;
	if(isSearch){//검색 결과 수 카운트
		count = centerDao.countByPaging(type, keyword);
	}
	else{//목록 결과 수 카운트
		count = centerDao.countByPaging();
	}
	
	//마지막 페이지 번호 계산
	int lastPage = (count + s - 1) / s;
	
	//블록 크기
	int blockSize = 5;
	
	//시작블록 혹은 종료 블록 중 하나만 계산하면 반대편은 계산이 가능하다.
	//종료블록에 영향을 미치는 데이터는 현재 페이지(p) 이다.
	//하단 블록에는 반드시 현재페이지 번호가 포함되어야 하므로 이 번호를 기준으로 시작과 종료를 계산한다!
	int endBlock = (p + blockSize - 1) / blockSize * blockSize;
	int startBlock = endBlock - (blockSize - 1);
	
	//범위를 초과하는 문제를 해결(endBlock > lastPage)
	if(endBlock > lastPage){
		endBlock = lastPage;
	}
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">
	<style>
		.pagination {
	    text-align: center;
	    white-space: nowrap;
	    overflow: hidden;            
	}
	.pagination > a {
	    color: #95a5a6;
	    text-decoration: none;
	
	    display: inline-block;
	    min-width:1.7em;
	    padding: 0.25em;
	
	    text-align: center;
	
	    border:1px solid #95a5a6;
	}
	.pagination > a:hover,
	.pagination > a.active {
	    color: #343B6A;
	    border-color: #343B6A;
	}
	</style>
	 <div class="c-container w650 m30">

        
        <!--검색창-->
        <div class="row center m20">
            <form action="<%=request.getContextPath() %>/center/list.jsp" method="get">
            <%if(type==null||type.equals("center_basic_address")){ %>
                <select name="type" class="form-input input-round">
                    <option value="center_basic_address" selected >동이름</option>     
                    <option value="center_name">센터명</option>
                </select>
                <%} else{%>
                 <select name="type" class="form-input input-round">
                    <option value="center_basic_address">동이름</option>     
                    <option value="center_name" selected >센터명</option>
                </select>
                <%} %>
                <%if(isSearch){ %>
                	<input type="text" name="keyword" class="form-input input-round layer-2"  placeholder="OO동 또는 센터명으로 검색하세요" autocomplete="off" value="<%=keyword%>">
                <%}else{ %>
                <button type="submit" class="btn btn-semi">검색</button>
                <%} %>
            </form>
        </div>
        <%if(centerList.isEmpty()){ %>
        	<div class="row center m30">
        		<h3>검색 정보가 없습니다.</h3>
        	</div>
		<%}else{ %>     
        <!--센터 목록-->
        <div class="flex-c-container flex-c-vertical">
        	<%for(CenterDto centerDto : centerList){ %>
            <div class="flex-c-container c-list-listbox m10">
                <!--센터이미지-->
                <div class="row c-list-img">
                    <a href="<%=request.getContextPath() %>/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>">
                    <img src="https://placeimg.com/170/170/tech/grayscale" class="c-img img-shadow img-round" width="100%">
                    </a>
                </div>
                <div class="c-list-area">
                    <div class="row m30">
                    <a href="<%=request.getContextPath() %>/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>">
                        <h2><%=centerDto.getCenterName() %></h2>
                        </a>
                    </div>
                    <div class="row">
                        <h3><%=centerDto.getCenterBasicAddress() %>&nbsp;<%=centerDto.getCenterDetailAddress() %></h3>
                    </div>
                    <%--센터 담당 운동 
                    <%for(EocDto eocDto : eocList){ %>
                    <div class="row center list-exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
					<%} %>--%>
                    <!--좋아요 수-->
                    <div class="row right m20">
                        <h4>[10]</h4>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
        <%} %>
        <!-- 페이지네이션 링크 -->
       
		<div class="row center pagination">
		<!-- 이전 버튼 -->
		<%if(p > 1){ %>
			<%if(isSearch){ %>
			<a href="list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&laquo;</a>
			<%} else { %>
			<a href="list.jsp?p=1&s=<%=s%>">&laquo;</a>
			<%} %>
		<%} %>
		
		<%if(startBlock > 1){ %>
			<%if(isSearch){ %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&lt;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>">&lt;</a>
			<%} %>
		<%} %>
		
		<!-- 숫자 링크 영역 -->
		<%for(int i=startBlock; i <= endBlock; i++){ %>
			<%if(isSearch){ %>
				<%if(i == p){ %>
				<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
				<%} %>
			<%} else { %>
				<%if(i == p){ %>
				<a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>	
				<%} else { %>
				<a href="list.jsp?p=<%=i%>&s=<%=s%>"><%=i%></a>
				<%} %>
			<%} %>
		<%} %>
		
		<!-- 다음 버튼 영역 -->
		<%if(endBlock < lastPage){ %>
			<%if(isSearch){ %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&gt;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>">&gt;</a>
			<%} %>
		<%} %>
		
		<%if(p < lastPage){ %>
			<%if(isSearch){ %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>">&raquo;</a>
			<%} else { %>
			<a href="list.jsp?p=<%=lastPage%>&s=<%=s%>">&raquo;</a>
			<%} %>
		<%} %>
	</div>
	
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>