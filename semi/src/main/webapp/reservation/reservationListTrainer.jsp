<%@page import="semi.servlet.DtoDao.PlayerAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.TrainerAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.ReservationDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    String trainerId = (String)request.getSession().getAttribute("trainer");
	    ReservationDao reservationDao = new ReservationDao();
	    List<ReservationDto> list = reservationDao.selectTrainer(trainerId);
    %>
    <%
TrainerDao trainerDao = new TrainerDao();
TrainerDto trainerDto = trainerDao.selectOne(trainerId);


//트레이너 아이디를 통해 trainerAttachment DB에서 번호 획득

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
 int count = reservationDao.countByPagingTrainer(trainerId);

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
  
    List<ReservationDto> reservationList = reservationDao.selectListByPagingTrainer(p, s, trainerId);

    
 %>    
    <jsp:include page="/jsp/template/header.jsp"></jsp:include>

<title>Insert title here</title>
<style>
.list-center-area{
width:100%;
}
.reservation-box{
    border: 1px solid #333;
}.c-pagination {
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
</head>
<body>
	<div class="container w500 m30">
		<div class="row center">
			<h2>스케쥴 목록</h2>
		</div>
	        <div class="flex-container flex-vertical">
        	<%for(ReservationDto reservationDto : reservationList){ %>
        	<%
        	PlayerDao playerDao = new PlayerDao(); 
            PlayerDto playerDto = playerDao.selectOne(reservationDto.getPlayerId());
        	PlayerAttachmentDao playerAttachmentDao = new PlayerAttachmentDao();
        	int attach = playerAttachmentDao.selectOne(playerDto.getPlayerId());
        	//trainerAttachment에서 받은 번호를 attachmentDao에 넣어서 불러오기
        	AttachmentDao attachmentDao = new AttachmentDao();
        	AttachmentDto attachmentDto = attachmentDao.selectOne(attach);
        	boolean noPic = attachmentDto==null;
        	
        	
        	%>
            <div class="flex-container list-center-listbox reservation-box">
                <!--센터이미지-->
                <div class="row center list-image-area">
              <%if(!noPic){ %>            
                  <img src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>" class="img img-circle asdf" style="width:170px"></a>
            <%}else{ %>
                <img src="<%=request.getContextPath()%>/images/profile.png" width="170px" class="img img-round">
            <%} %>
                </div>
                <div class="list-center-area">
                    <div class="row m30 center">
                        <h2><%=reservationDto.getReservationDate()%></h2>
                        <h2><%=reservationDto.getReservationTime()%></h2>

                    </div>
                    <div class="row center">
                        <h4>강사명:<%=trainerDto.getTrainerName()%></h4>
                        <br>
                        
                        <h4>회원명:<%=playerDto.getPlayerName()%></h4>
                    </div>
                </div>
      
            </div>
         <%} %>
        </div>
    </div>
               <!-- 페이지네이션 링크 -->
       
      <div class="row center c-pagination">
      <!-- 이전 버튼 -->
      <%if(p > 1){ %>

         <a href="reservationListTrainer.jsp?p=1&s=<%=s%>&trainerId=<%=trainerId%>">&laquo;</a>

      <%} %>
      
      <%if(startBlock > 1){ %>

         <a href="reservationListTrainer.jsp?p=<%=startBlock-1%>&s=<%=s%>&trainerId=<%=trainerId%>">&lt;</a>
    <%} %>
      
      <!-- 숫자 링크 영역 -->
      <%for(int i=startBlock; i <= endBlock; i++){ %>
            <%if(i == p){ %>
            <a class="active" href="reservationListTrainer.jsp?p=<%=i%>&s=<%=s%>&trainerId=<%=trainerId%>"><%=i%></a>   
            <%} else { %>
            <a href="reservationListTrainer.jsp?p=<%=i%>&s=<%=s%>&trainerId=<%=trainerId%>"><%=i%></a>
            <%} %>
         <%} %>

      
      <!-- 다음 버튼 영역 -->
      <%if(endBlock < lastPage){ %>

         <a href="reservationListTrainer.jsp?p=<%=endBlock+1%>&s=<%=s%>&trainerId=<%=trainerId%>">&gt;</a>

      <%} %>
      
      <%if(p < lastPage){ %>

         <a href="reservationListTrainer.jsp?p=<%=lastPage%>&s=<%=s%>&trainerId=<%=trainerId%>">&raquo;</a>

      <%} %>
   </div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>