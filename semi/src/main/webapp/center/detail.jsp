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

 String playerId = (String)session.getAttribute("login");
 String trainerId = (String)session.getAttribute("trainer");

 boolean playerLogin = playerId != null;
 boolean trainerLogin = trainerId != null;

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
              var playerId = $("#playerId").val();
              var trainerImage = $("#trainerImg").val();
              
              likeLoad(centerId);
              trainerLoad(p,s,centerId);
              checkedLike(centerId,playerId);
				              
				//강사 더보기 버튼 클릭 시
              $("#m-btn").click(function(){
                  p++;
                  trainerLoad(p,s,centerId)
              });
				
            //좋아요 버튼 클릭 시 추가 제거
              $("#like-btn").click(function(){
            		  
                  $.ajax({
                      url: "http://localhost:8080/semi/ajax/likecheck.kh",
                      type: "post",   
                      data: {
                          centerId : centerId,
                          playerId : playerId
                      },
                      success: function(resp){
                          likeLoad();
                          if(resp==1){
                              $("#like-btn > img").attr("src","/semi/images/center_dummy/dislike1.png").addClass("c-btn");
                          }
                          else{
                              $("#like-btn > img").attr("src","/semi/images/center_dummy/like1.png").addClass("c-btn");
                          }
                      }
                  })
              })

              //좋아요 수 조회
              function likeLoad(){
                  $.ajax({
                      url: "http://localhost:8080/semi/ajax/center-like.kh",
                      type: "post",
                      data: {
                          centerId : centerId
                      },
                      success:function(resp){
                          $("#like-count").text(resp);
                      }
                  })
              }

              //이미 좋아요를 누른 사람이라면
              function checkedLike(){
                  $.ajax({
                      url: "http://localhost:8080/semi/ajax/likechecked.kh",
                      type: "post",   
                      data: {
                          centerId : centerId,
                          playerId : playerId
                      },
                      success:function(resp){
                          if(resp==1){
                              $("#like-btn > img").attr("src","/semi/images/center_dummy/like1.png").addClass("c-btn");
                          }else{
                              $("#like-btn > img").attr("src","/semi/images/center_dummy/dislike1.png").addClass("c-btn");
                          }
                      }
                  })
              }	
              
				
            //센터 소속 강사 리스트 조회
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
                      
                      success:function(resp){
                          if(resp.length < s) {
                              $("#m-btn").remove();
                          }

                          for(var i=0; i < resp.length; i++) {

                              var tName = $("<a>").text(resp[i].trainerName).attr("href","/semi/trainer/trainerDetail.jsp?centerId="+centerId+"&trainerId="+resp[i].trainerId).addClass("trainer-nameBox");

                              
                              var nameLink = $("<div>").addClass("row display-c-center trainer-imgArea");
                              var subArea = $("<div>").addClass("flex-c-container display-c-center layer-3");
                              
                             nameLink.append(tName);
                             subArea.append(nameLink);
                             
                             $("#trainerFBox").append(subArea);
                          }
                      }
                  });

              };

             
          });
    </script>

    <div class="c-container w650 m30">
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
                    <%if(playerLogin){ %>
                        <div style="margin-left: auto;">
                           <button type="button" class="c-btn" id="like-btn"><img src="<%=request.getContextPath() %>/images/center_dummy/dislike1.png" width="30px" height="30px" ></button>
                        </div>
                        <div style="margin-top: 6px;">
                            <span id="like-count"><%=centerDto.getCenterLikeCount() %></span>
                        </div>
                        <%}else{ %>
                        <div style="margin-left: auto;">
                        	<a href="<%=request.getContextPath()%>/player/login.jsp"><img src="<%=request.getContextPath() %>/images/center_dummy/dislike1.png" width="30px" height="30px" ></a>
                        </div>
                        	<div style="margin-top: 6px;">
                            <span id="like-count"><%=centerDto.getCenterLikeCount() %></span>
                        </div>
                        <%} %>
                        <input type="hidden" name="likeCheck" value="?" id="like-check">
                    </div>
                    
                    <div class="row center">
                    <input type="hidden" name="centerId" value="<%=centerDto.getCenterId() %>" id="centerId">
                    <input type="hidden" name="playerId" value="<%=playerId%>" id="playerId">
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
           <div class="row center-introbox"><pre><%=centerDto.getCenterIntroduction() %></pre></div>
        </div>

        <!--해당 센터 강사 목록-->
        <span>우리 센터의 강사</span>
        <div class="flex-c-container m10" id="trainerFBox">
       
        </div>
      
       
        <div class="row m10">
            <button class="btn btn-semi fill" id="m-btn">더보기</button>
        </div>
        
        <div class="row right">
            <a href="#" class="link link-btn m10 top" width="30%">top</a>
      </div>    
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>