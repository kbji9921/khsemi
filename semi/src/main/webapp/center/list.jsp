<%@page import="semi.servlet.DtoDao.CenterAttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.CenterAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%--준비 --%>
 <%
    String exerciseName = request.getParameter("exerciseName");
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
    
    if(isSearch){
       centerList = centerDao.selectList(type, keyword, p, s, exerciseName);
       //eocList = eocDao.selectList(centerId);
    }
    else{
       centerList = centerDao.selectList(p,s,exerciseName);
       //eocList = eocDao.selectList(centerId);
    }
    
 %>
    
 
 <!-- 페이지네이션 링크 -->
<%
   int count;
   if(isSearch){//검색 결과 수 카운트
      count = centerDao.countByPaging(type, keyword,exerciseName);
   }
   else{//목록 결과 수 카운트
      count = centerDao.countByPaging(exerciseName);
   }
   
   //마지막 페이지 번호 계산
   int lastPage = (count + s - 1) / s;
   
   //블록 크기
   int blockSize = 10;
   
   int endBlock = (p + blockSize - 1) / blockSize * blockSize;
   int startBlock = endBlock - (blockSize - 1);
   
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
            <input type="hidden" name="exerciseName" value="<%=exerciseName %>">
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
                <input type="text" name="keyword" class="form-input input-round layer-2"  placeholder="OO동 또는 센터명으로 검색하세요" autocomplete="off" >
                <%} %>
                <button type="submit" class="btn btn-semi">검색</button>
            </form>
        </div>
        <%if(centerList.isEmpty()){ %>
           <div class="row center m30">
              <h3>검색 결과가 존재하지 않습니다.</h3>
           </div>
      <%}else{ %>     
        <!--센터 목록-->
        <div class="flex-c-container flex-c-vertical">
           <%for(CenterDto centerDto : centerList){ %>
           		<%
           			centerDto = centerDao.selectOne(centerDto.getCenterId());
           			CenterAttachmentDao centerAttachmentDao = new CenterAttachmentDao();
           			int attachmentNo = centerAttachmentDao.selectOne(centerDto.getCenterId());

                	AttachmentDao attachmentDao = new AttachmentDao();
                	AttachmentDto attachmentDto = attachmentDao.selectOne(attachmentNo);
                	boolean noPic = attachmentDto==null;
           		%>
            <div class="flex-c-container c-list-listbox m10">
                <!--센터이미지-->
                <div class="row c-list-img">
                <%if(noPic){ %>
                    <a href="<%=request.getContextPath() %>/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>&exerciseName=<%=exerciseName%>">
                    <img src="https://placeimg.com/170/170/tech/grayscale" class="c-img img-shadow img-round">
                    </a>
                     <%} else{ %>
                    <a href="<%=request.getContextPath() %>/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>&exerciseName=<%=exerciseName%>">
                    <img src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attachmentDto.getAttachmentNo()%>" class="c-img img-shadow img-round" width="170px" height="170px">
                    </a>
                    <%} %>
                </div>
                <div class="c-list-area">
                    <div class="row m20">
                    <a href="<%=request.getContextPath() %>/center/detail.jsp?centerId=<%=centerDto.getCenterId()%>&exerciseName=<%=exerciseName%>">
                        <h2><%=centerDto.getCenterName() %></h2>
                        </a>
                    </div>
                    <div class="row">
                        <h3><%=centerDto.getCenterBasicAddress() %>&nbsp;<%=centerDto.getCenterDetailAddress() %></h3>
                    </div>
                    <%--센터 담당 운동 --%>
                    <%List<EocDto> eocList; %>
                    <%eocList= eocDao.selectList(centerDto.getCenterId()); %>
                    <%for(EocDto eocDto : eocList){ %>
                    <div class="center exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
               <%} %>
                    <!--좋아요 수-->
                    <div class="row right">
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
         <a href="list.jsp?p=1&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>&exerciseName=<%=exerciseName%>">&laquo;</a>
         <%} else { %>
         <a href="list.jsp?p=1&s=<%=s%>&exerciseName=<%=exerciseName%>">&laquo;</a>
         <%} %>
      <%} %>
      
      <%if(startBlock > 1){ %>
         <%if(isSearch){ %>
         <a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>&exerciseName=<%=exerciseName%>">&lt;</a>
         <%} else { %>
         <a href="list.jsp?p=<%=startBlock-1%>&s=<%=s%>&exerciseName=<%=exerciseName%>">&lt;</a>
         <%} %>
      <%} %>
      
      <!-- 숫자 링크 영역 -->
      <%for(int i=startBlock; i <= endBlock; i++){ %>
         <%if(isSearch){ %>
            <%if(i == p){ %>
            <a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>&exerciseName=<%=exerciseName%>"><%=i%></a>   
            <%} else { %>
            <a href="list.jsp?p=<%=i%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>&exerciseName=<%=exerciseName%>"><%=i%></a>
            <%} %>
         <%} else { %>
            <%if(i == p){ %>
            <a class="active" href="list.jsp?p=<%=i%>&s=<%=s%>&exerciseName=<%=exerciseName%>"><%=i%></a>   
            <%} else { %>
            <a href="list.jsp?p=<%=i%>&s=<%=s%>&exerciseName=<%=exerciseName%>"><%=i%></a>
            <%} %>
         <%} %>
      <%} %>
      
      <!-- 다음 버튼 영역 -->
      <%if(endBlock < lastPage){ %>
         <%if(isSearch){ %>
         <a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>&exerciseName=<%=exerciseName%>">&gt;</a>
         <%} else { %>
         <a href="list.jsp?p=<%=endBlock+1%>&s=<%=s%>&exerciseName=<%=exerciseName%>">&gt;</a>
         <%} %>
      <%} %>
      
      <%if(p < lastPage){ %>
         <%if(isSearch){ %>
         <a href="list.jsp?p=<%=lastPage%>&s=<%=s%>&type=<%=type%>&keyword=<%=keyword%>&exerciseName=<%=exerciseName%>">&raquo;</a>
         <%} else { %>
         <a href="list.jsp?p=<%=lastPage%>&s=<%=s%>&exerciseName=<%=exerciseName%>">&raquo;</a>
         <%} %>
      <%} %>
   </div>
   
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>