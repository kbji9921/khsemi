<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.TrainerAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    String playerId = request.getParameter("playerId");
    	PlayerDao playerDao = new PlayerDao();
    	PlayerDto playerDto = playerDao.selectOne(playerId);
	    ReservationDao reservationDao = new ReservationDao();
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
 <%
 int count = reservationDao.countByPagingPlayer(playerId);

   //마지막 페이지 번호 계산
   int lastPage = (count + s - 1) / s;
   
   //블록 크기
   int blockSize = 5;
   
   int endBlock = (p + blockSize - 1) / blockSize * blockSize;
   int startBlock = endBlock - (blockSize - 1);
   
   if(endBlock > lastPage){
      endBlock = lastPage;
   }
%>
 <%--처리 --%>
 <%
  
    List<ReservationDto> reservationList = reservationDao.selectListByPagingPlayer(p, s, playerId);

    
 %>    
<title>회원 예약 리스트</title>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<<<<<<< HEAD
<jsp:include page="/jsp/template/reservationHeader.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/matching.css">
=======
<style>
.list-center-area{
width:100%;
}
.reservation-box{
    border: 1px solid #333;}
.c-pagination {
       text-align: center;
       white-space: nowrap;
       overflow: hidden;            
  }
   
 .c-pagination > a {
     color: #95a5a6;
     text-decoration: none;
     display: inline-block;
     min-width:1.7em;
     padding: 0.25em;
     text-align: center;
     border:1px solid #95a5a6;
 }
 
 .c-pagination > a:hover,
 .c-pagination > a.active {
     color: #343B6A;
     border-color: #343B6A;
 }


</style>
>>>>>>> refs/remotes/origin/main

<body>
	<div class="container w600 m30">
  <div class="flex-container flex-vertical">
        	<%for(ReservationDto reservationDto : reservationList){ %>
        	<%
        	TrainerDao trainerDao = new TrainerDao(); 
            TrainerDto trainerDto = trainerDao.selectOne(reservationDto.getTrainerId());
        	TrainerAttachmentDao trainerAttachmentDao = new TrainerAttachmentDao();
        	int attach = trainerAttachmentDao.selectOne(playerDto.getPlayerId());
        	//trainerAttachment에서 받은 번호를 attachmentDao에 넣어서 불러오기
        	AttachmentDao attachmentDao = new AttachmentDao();
        	AttachmentDto attachmentDto = attachmentDao.selectOne(attach);
        	boolean noPic = attachmentDto==null;
        	
        	
        	%>
            <div class="flex-container list-center-listbox reservation-box">
                <!--센터이미지-->
                <div class="center list-image-area">
              <%if(!noPic){ %>            
                  <img src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>" class="img img-circle asdf" style="width:170px"></a>
            <%}else{ %>
                <img src="<%=request.getContextPath()%>/images/profile.png" width="170px" class="img img-round">
            <%} %>
                </div>
                <div class="list-center-area">
                    <div class="row m20 center reservation-title">
                        <h3><%=reservationDto.getReservationDate()%></h3>
                        <h3><%=reservationDto.getReservationTime()%></h3>
                    </div>
                    <div class="row center">
                        <h4 class="reservation-info">강사명 : <%=trainerDto.getTrainerName()%></h4>
                        <h4 class="reservation-info">회원명 : <%=playerDto.getPlayerName()%></h4>
                        <h4 class="reservation-info">운동종목 : <%=trainerDto.getTrainerSports()%></h4>
                    </div>
                </div>
      			<form action="reservation.Delete" method="post">
      				<input type="hidden" name="playerId" value="<%=reservationDto.getPlayerId()%>">
      				<input type="hidden" name="trainerId" value="<%=reservationDto.getTrainerId() %>">
      				<input type="hidden" name="reservationDate" value="<%=reservationDto.getReservationDate() %>">
      				<input type="hidden" name="reservationTime" value="<%=reservationDto.getReservationTime() %>">
      				<button type="submit">X</button>
      			</form>
      			<% if(request.getParameter("error") != null){ %>
					<h2 style="color:red;">오류가 발생했습니다. 게시판에 문의해주세요</h2>
				<%} %>
            </div>
         <%} %>
        </div>
    </div>
           <!-- 페이지네이션 링크 -->
       
      <div class="row center c-pagination">
      <!-- 이전 버튼 -->
      <%if(p > 1){ %>

         <a href="reservationListPlayer.jsp?p=1&s=<%=s%>&playerId=<%=playerId%>">&laquo;</a>

      <%} %>
      
      <%if(startBlock > 1){ %>

         <a href="reservationListPlayer.jsp?p=<%=startBlock-1%>&s=<%=s%>&playerId=<%=playerId%>">&lt;</a>
    <%} %>
      
      <!-- 숫자 링크 영역 -->
      <%for(int i=startBlock; i <= endBlock; i++){ %>
            <%if(i == p){ %>
            <a class="active" href="reservationListPlayer.jsp?p=<%=i%>&s=<%=s%>&playerId=<%=playerId%>"><%=i%></a>   
            <%} else { %>
            <a href="reservationListPlayer.jsp?p=<%=i%>&s=<%=s%>&playerId=<%=playerId%>"><%=i%></a>
            <%} %>
         <%} %>

      
      <!-- 다음 버튼 영역 -->
      <%if(endBlock < lastPage){ %>

         <a href="reservationListPlayer.jsp?p=<%=endBlock+1%>&s=<%=s%>&playerId=<%=playerId%>">&gt;</a>

      <%} %>
      
      <%if(p < lastPage){ %>

         <a href="reservationListPlayer.jsp?p=<%=lastPage%>&s=<%=s%>&playerId=<%=playerId%>">&raquo;</a>

      <%} %>
   </div>
    </body>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>