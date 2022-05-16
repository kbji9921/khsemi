<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //로그인확인
  String playerId = (String)session.getAttribute("login");
  String trainerId = (String)session.getAttribute("trainer");
  boolean playerLogin = playerId != null;
  boolean trainerLogin = trainerId != null;
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>살빠GYM</title>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/layout.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/commons.css">
</head>
<script type="text/javascript">
function loginCheck(){ 
        var playerId = '<%=(String)session.getAttribute("login")%>';
        var trainerId = '<%=(String)session.getAttribute("trainer")%>';
        
         if(playerId=="null" && trainerId == 'null'){								//비로그인상태
        	 swal("일반회원 로그인이 필요한 항목입니다","로그인 후 이용해주세요", "warning")
        	 .then(function(){
            	location.replace("/semi/player/login.jsp");
			})	
         }else{																		//일반회원로그인			
       	  	if(playerId != 'null'){
       	  	location.replace("<%=request.getContextPath()%>/board/boardList.jsp");	
       	  	}else{
       	  	swal("강사회원 문의하기","살빠Gym을 이용해주셔서 감사합니다.\n salbbagym@co.kr 으로 문의바랍니다.", "info")	//강사로그인
//        	 location.replace("/semi/board/boardList.jsp");	
       	  	}
         }
}
</script>
<body>
   <main>
      <header>
         <a href="<%=request.getContextPath()%>" id="logo">
            <img src="/semi/images/ci_main_logo.png" width="320px" alt="살빠짐 홈으로 가기">
         </a>
         <nav>
            <ul id="gnb">
               <li><a href="<%=request.getContextPath()%>">Home</a></li>
<%--                <%if(!trainerLogin){ %>강사에게 보이지 않게 --%>
              	 <li><a href="javascript:void(0)" onclick="loginCheck()">문의하기</a></li>
<%--                <%} %> --%>
               <%--강사 로그인 후 --%>
                     <%if(trainerLogin){ %>
                  <li><a href="<%=request.getContextPath()%>/player/allMatchingList.jsp?trainerId=<%=trainerId%>">나의 회원</a></li>
                  <li><a href="<%=request.getContextPath()%>/reservation/reservationListTrainer.jsp?trainerId=<%=trainerId%>">나의 일정</a></li>
                  <li class="gnb-right">
                     <a href="<%=request.getContextPath()%>/trainer/trainerMyPage.jsp">마이페이지</a>
                     <span class="partition">|</span>
                     <a href="<%=request.getContextPath()%>/trainer/logout.trainer">로그아웃</a>
                  </li>
               <%-- 사용자 로그인 후 --%>
                     <%}else if(playerLogin){ %>
                  <li><a href="<%=request.getContextPath()%>/player/matchingList.jsp">나의 매칭</a></li>
                  <li><a href="<%=request.getContextPath()%>/reservation/reservationListPlayer.jsp?playerId=<%=playerId%>">나의 일정</a></li>
                  <li class="gnb-right">
                     <a href="<%=request.getContextPath()%>/player/mypage.jsp?playerId=<%=playerId%>">마이페이지</a>
                     <span class="partition">|</span>
                     <a href="<%=request.getContextPath()%>/player/logout.player">로그아웃</a>
                  </li>
            <%-- 로그인 전 --%>
               <%}else{ %>
               <li></li>
               <li></li>
               <li class="gnb-right">
                  <a href="<%=request.getContextPath()%>/player/selectLogin.jsp">로그인</a>
                     <span class="partition">|</span>
                  <a href="<%=request.getContextPath()%>/player/selectJoin.jsp">회원가입</a>
               </li>
               <%} %>
               
               <%-- 관리자 로그인 후
               <li class="gnb-right">
                  <a href="#">관리자페이지</a>
                  <span class="partition">|</span>
                  <a href="#">로그아웃</a>
               </li>
               --%>
               
            </ul>
         </nav>
      </header>
   <%-- header end --%>
   
      

   <section class="wrap">