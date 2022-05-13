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

 //현재 접속한 사용자가 로그인 상태인지 아닌지를 판정하는 코드


 //1. 세션에 login이라는 이름으로 저장된 데이터를 꺼낸다.
 String playerId = (String)session.getAttribute("login");
 String trainerId = (String)session.getAttribute("trainer");

 //2. memberId가 있으면 로그인 상태라고 판정하고, 없으면 로그아웃 상태라고 판정한다.
 boolean playerLogin = playerId != null;
 boolean trainerLogin = trainerId != null;

 //권한
 String auth = (String)session.getAttribute("auth");
 boolean admin = auth!=null&& auth.equals("관리자");
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
     
     EocDao eocDao = new EocDao();
     List<EocDto> list = eocDao.selectList(centerId);


  	
	TrainerDao trainerDao = new TrainerDao();
  	List<TrainerDto> trainerList = trainerDao.centerTrainerByPaging(p, s, centerId);
  	
  	//강사 본인의 센터인지 판정 강사로 로그인 되어 있으면서 현재 로그인 된 강사가 소속된 센터의 아이디가 같다면
  	TrainerDto trainerDto = trainerDao.selectOne(trainerId);
  	boolean isOwnerCenter = trainerDto!=null && trainerDto.getCenterId().equals(centerDto.getCenterId());

  %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">

 <!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
        $(function(){
            $("#delete").click(function(){
                return confirm("정말 삭제하시겠습니까?");
            });
        });
    </script>

	 <div class="c-container w650 m30">
        <!--제목-->
        
        <!--센터 정보-->
        <div class="flex-c-container flex-c-vertical m30">
            <div class="flex-c-container">
               <div class="row image-c-area">
                    <img src="https://placeimg.com/250/250/tech/grayscale" class="c-img img-round">
                </div>
                <div class="content-c-area">
                    <div class="row center">
                        <h1 class="m20"><%=centerDto.getCenterName() %></h1>
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
                    <!--버튼-->
                </div>

            </div>
            <!--센터 소개글-->
            <div class="row center-introbox">
                <h4><%=centerDto.getCenterIntroduction() %></h4>
            </div>
        </div>

        <!--해당 센터 강사 목록-->
        <span>우리 센터의 강사</span>
        <div class="flex-c-container m10">
		 <%for(TrainerDto trainerDTo : trainerList){ %>
           <div class="flex-c-container flex-c-vertical layer-3">
               <div class="row center">
                  <a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId() %>&trainerId=<%=trainerDTo.getTrainerId() %>">
                  <img src="https://placeimg.com/150/150/people" class="c-img img-circle img-hover">
                  </a>
               </div>
               <div class="center">
                   <a href="<%=request.getContextPath() %>/trainer/trainerDetail.jsp?centerId=<%=centerDto.getCenterId()%>&trainerId=<%=trainerDTo.getTrainerId() %>" class="trainer-nameBox">
                   
                   <%=trainerDTo.getTrainerName() %>
                   </a>
               </div>
           </div>
        <%} %>
        <%--<div class="flex-c-container flex-c-vertical layer-3">
            <div class="row center">
                <a href="#"><img src="https://placeimg.com/150/150/people" class="c-img img-circle img-hover"></a>
            </div>
            <div class="center">
                <a href="#" class="trainer-nameBox">황인빈 강사님</a>
            </div>
        </div> 
        <div class="flex-c-container flex-c-vertical layer-3">
            <div class="row center">
                <a href="#"><img src="https://placeimg.com/150/150/people" class="c-img img-circle img-hover"></a>
            </div>
            <div class="center">
                <a href="#" class="trainer-nameBox">황인빈 강사님</a>
            </div>
        </div> 
        <div class="flex-c-container flex-c-vertical layer-3">
            <div class="row center">
                <a href="#"><img src="https://placeimg.com/150/150/people" class="c-img img-circle img-hover"></a>
            </div>
            <div class="center">
                <a href="#" class="trainer-nameBox">황인빈 강사님</a>
            </div>
        </div> --%>

        </div>
		
        <!--더보기 기능 구현해야함-->
        <div class="row m10">
            <button class="btn btn-semi fill">더보기</button>
        </div>
        
        <div class="row right">
            <!--강사 본인의 센터인지 판정
  			관리자이거나 강사로 로그인 되어 있으면서 현재 로그인 된 강사가 소속된 센터의 아이디가 같다면 -->
  			<%if(admin||(trainerLogin&&isOwnerCenter)){ %>
			<a href="<%=request.getContextPath() %>/center/update.jsp?centerId=<%=centerDto.getCenterId()%>" class="link link-btn m10" width="30%">수정</a>
			<a href="<%=request.getContextPath() %>/center/delete.kh?centerId=<%=centerDto.getCenterId()%>" class="link link-btn m10" width="30%" id="delete">삭제</a>
   			<%}%>
   			<a href="<%=request.getContextPath() %>/center/list.jsp" class="link link-btn m10" width="30%">목록</a>
		</div>    
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>