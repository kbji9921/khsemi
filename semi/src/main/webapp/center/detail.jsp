<%@page import="semi.servlet.DtoDao.TrainerAttachmentDto"%>
<%@page import="semi.servlet.DtoDao.CenterAttachmentDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@page import="semi.servlet.DtoDao.TrainerAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.CenterAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%--준비 --%>
 <%

    String centerId = request.getParameter("centerId");
    String exerciseName =request.getParameter("exerciseName");

 //현재 접속한 사용자가 로그인 상태인지 아닌지를 판정하는 코드
 //1. 세션에 login이라는 이름으로 저장된 데이터를 꺼낸다.
 String playerId = (String)session.getAttribute("login");
 String trainerId = (String)session.getAttribute("trainer");

 //2. memberId가 있으면 로그인 상태라고 판정하고, 없으면 로그아웃 상태라고 판정한다.
 boolean playerLogin = playerId != null;
 boolean trainerLogin = trainerId != null;

 //권한
 String playerGrade = (String)session.getAttribute("auth");
 boolean admin = playerLogin && playerGrade.equals("관리자");
 %> 
<%--페이징 관련 파라미터 수신 --%>
<%
   int p;
   try{
      p = Integer.parseInt(request.getParameter("p"));
      throw new Exception();
   }
   catch(Exception e){
      p = 1;
   }
   
   int s;
   try{
      s = Integer.parseInt(request.getParameter("s"));
      throw new Exception();
   }
   catch(Exception e){
      s = 3;
   }
%>
  <%

     CenterDao centerDao = new CenterDao();
     CenterDto centerDto = centerDao.selectOne(centerId);
    //운동종목 상세 정보
     EocDao eocDao = new EocDao();
     List<EocDto> list = eocDao.selectList(centerId);

	//센터 소속 강사 정보(이름)
	TrainerDao trainerDao = new TrainerDao();
	List<TrainerDto> trainerList = trainerDao.centerTrainerByPaging(p, s, centerId);
	//센터 첨부파일 번호 조회
 	CenterAttachmentDao centerAttachmentDao = new CenterAttachmentDao();
	int attachmentNo = centerAttachmentDao.selectOne(centerId);
	//센터 상세페이지 이미지 
	AttachmentDao attachmentDao = new AttachmentDao();
	AttachmentDto attachmentDto1 = attachmentDao.selectOne(attachmentNo);
  	
	boolean noPic = attachmentDto1==null;
  	//강사 본인의 센터인지 판정 강사로 로그인 되어 있으면서 현재 로그인 된 강사가 소속된 센터의 아이디가 같다면
  	//TrainerDto trainerDto = trainerDao.selectOne(trainerId);
  	//boolean isOwnerCenter = trainerDto!=null && trainerDto.getCenterId().equals(centerDto.getCenterId());

   
  %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">

 <!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
      	$(function(){
              var p = 1;
              var s = 3;
              var centerId = $("#centerId").val();
              var trainerId = $("#trainerId").val();
              var trainerImage = $("#trainerImg").val();
              
              trainerLoad(p,s,centerId);
				
              $("#m-btn").click(function(){
                  p++;
                  trainerLoad(p,s,centerId)
              });

              function trainerLoad(p,s,centerId){
                  $.ajax({
                      url: "http://localhost:8080/semi/ajax/center-trainer.kh",
                      type: "post",
                      dataType: "json",               
                      data: {
                          p : p,
                          s : s,
                          centerId : centerId
                      },
                      
                      // $("div#append").append("<p>Bye!!</p>");
                      success:function(resp){
                          if(resp.length < s) {
                              $("#m-btn").remove();
                          }

                          for(var i=0; i < resp.length; i++) {
                              var tImg = $("<img>").attr("src", "/semi/file/download.kh?attachmentNo="+trainerImage).addClass("c-img img-circle img-hover center-tImg");
                              //var tImg = $("<img>").attr("src", "/semi/file/download.kh?attachmentNo="+trainerImage).addClass("c-img img-circle img-hover center-tImg");
                              var tImgA = $("<a>").attr("href","/semi/trainer/trainerDetail.jsp?centerId="+centerId+"&trainerId="+trainerId);
                              var tName = $("<a>").text(resp[i].trainerName).attr("href","/semi/trainer/trainerDetail.jsp?centerId="+centerId+"&trainerId="+trainerId).addClass("trainer-nameBox");
                              
                              var imgLink = $("<div>").addClass("row center");
                              var nameLink = $("<div>").addClass("center");
                              var subArea = $("<div>").addClass("flex-c-container flex-c-vertical layer-3");
                              
                             tImgA.append(tImg);
                             imgLink.append(tImgA);
                             nameLink.append(tName);
                             subArea.append(imgLink).append(nameLink);
                             
                             $("#trainerFBox").append(subArea);
                          }
                      }
                  });

              };

              //삭제 기능
              //$("#delete").click(function(){
                  //return confirm("정말 삭제하시겠습니까?");
              //});
          });
    </script>

    <div class="c-container w650 m30">
        <!--제목-->
        
        <!--센터 정보-->
        <div class="flex-c-container flex-c-vertical m30">
            <div class="flex-c-container">
               <div class="row image-c-area">
               <%if(noPic){ %>
                    <img src="/semi/images/center_dummy/location.png" class="c-img img-round" width="250px" height="250px">
                    <%} else { %>
                    <img src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attachmentDto1.getAttachmentNo()%>" class="c-img img-round" width="250px" height="250px">
                    <%} %>
                </div>
                <div class="content-c-area">
                    <!--좋아요-->
                    <div class="row flex-c-container">
                        <div style="margin-left: auto;">
                            <img src="<%=request.getContextPath() %>/images/center_dummy/dislike.png"
                            style="width:30px; height:30px" id="like-img">
                        </div>
                        <div style="margin-top: 6px;">
                            <h4 id="like-count">[<%=centerDto.getCenterLikeCount() %>]</h4>
                        </div>
                        <input type="hidden" name="likeCheck" value="?" id="like-check">
                    </div>
                    
                    <div class="row center">
                    <input type="hidden" name="centerId" value="<%=centerDto.getCenterId() %>" id="centerId">
                        <h1><%=centerDto.getCenterName() %></h1>
                    </div><hr>
                    <div class="row">
                        <h4>[주 소] :&nbsp;<%=centerDto.getCenterBasicAddress() %>&nbsp;<%=centerDto.getCenterDetailAddress() %></h4>
                    </div>
                    <div class="row">
                        <h4>[전화번호] :&nbsp;<%=centerDto.getCenterPhone() %></h4>
                    </div><hr>
                    <div class="row">
                        <h4>[평 일] :&nbsp;<%=centerDto.getCenterWeektime() %> </h4>
                    </div>
                    <div class="row">
                        <h4>[주 말] :&nbsp;<%=centerDto.getCenterWkndtime() %> </h4>
                    </div><hr>
                    <%for(EocDto eocDto : list){ %>
                    <div class="center exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
                    <%} %>
                </div>

            </div>
            <!--센터 소개글-->
           <div class="row center-introbox">
                <pre><h4><%=centerDto.getCenterIntroduction() %></h4></pre>
            </div>
        </div>

        <!--해당 센터 강사 목록-->
        <span>우리 센터의 강사</span>
        <div class="flex-c-container m10" id="trainerFBox">
        <%--강사 이름 출력 --%>
        <%int zero = 0;%>
		 <%for(TrainerDto trainerDto : trainerList){ %>
		 	<input type="hidden" name="trainerId" value=<%=trainerDto.getTrainerId()%> id="trainerId">
		 	<%-- 강사 이미지 조회--%>
		 	<%TrainerAttachmentDao trainerAttachmentDao = new TrainerAttachmentDao(); 
		 	 attachmentNo = trainerAttachmentDao.selectOne(trainerDto.getTrainerId());
		 	AttachmentDto attachmentDto2 = attachmentDao.selectOne(attachmentNo);%>
		 	
		 	<input type="hidden" name="attachmentNo" value="<%=attachmentDto2.getAttachmentNo()%>" id="trainerImg">
		 	<%if(attachmentDto2==null){ %>
		 		<%=response.sendError(405)%>
		 	<%} %>
		 	
		 <%} %>
		  	
			<%--<%boolean nonPic = attachmentDto2==null;
		 	--%>
          <%-- <div class="flex-c-container flex-c-vertical layer-3">
               <%--강사 이미지 출력--%>
               <%-- <div class="row center">
               		<%if(nonPic){ %>
	                  	<a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId() %>&trainerId=<%=trainerDto.getTrainerId() %>">
	                  	<img src="https://placeimg.com/150/150/tech/grayscale" class="c-img img-circle img-hover"></a>
                  	<%} else {%>
                  		<a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId() %>&trainerId=<%=trainerDto.getTrainerId() %>">
                  		<img src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attachmentDto2.getAttachmentNo()%>" class="c-img img-circle img-hover" width="150px" height="150px"></a>
                  	<%} %>
               </div>--%>
               <%--강사 이름 
               <div class="center">
                   <a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId()%>&trainerId=<%=trainerDto.getTrainerId() %>" class="trainer-nameBox">
                   <%=trainerDto.getTrainerName() %>
                   </a>
               </div>
               
           </div>
        <%} %>--%>
        </div>
      
        <!--더보기 기능 구현해야함-->
        <div class="row m10">
            <button class="btn btn-semi fill" id="m-btn">더보기</button>
        </div>
        
        <div class="row right">
            <!--강사 본인의 센터인지 판정
           관리자이거나 강사로 로그인 되어 있으면서 현재 로그인 된 강사가 소속된 센터의 아이디가 같다면 -->
           <%--<%if(admin||trainerLogin&&isOwnerCenter){ %>
         <a href="<%=request.getContextPath() %>/center/update.jsp?centerId=<%=centerDto.getCenterId()%>" class="link link-btn m10" width="30%">수정</a>
         <a href="<%=request.getContextPath() %>/center/delete.kh?centerId=<%=centerDto.getCenterId()%>" class="link link-btn m10" width="30%" id="delete">삭제</a>
            <%}%> --%>
            <a href="<%=request.getContextPath() %>/center/list.jsp?exerciseName=<%=exerciseName%>" class="link link-btn m10" width="30%">목록</a>
      </div>    
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>