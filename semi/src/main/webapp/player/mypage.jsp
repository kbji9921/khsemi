<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String playerId = (String)session.getAttribute("login");
%> 

<%
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto = playerDao.selectOne(playerId);
%>
  
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<style>
        .flex-container{
            padding: 1em;
            background-color: #343b6a;
            color: white;
        }
        .img-wrapper{
            width:25%;
        }
        .contents-wrapper{
            flex-grow:1; /*나머지 전부 다 라는 의미로 쓰임 */
        }
       
        .list-center-area{
        	width:100%;
        }
        #con{
        	border: 1px solid black;
        }
 </style>    
<body>  

      <div class="container w700 m30" id="con">
            <div class="flex-container flex-vertical">
	            <div class="flex-container list-center-listbox">
	                <!--센터이미지-->
	                <div class="row center list-image-area">
	                    <img src="http://via.placeholder.com/150x150" class="img img-hover img-round">
	                </div>
	                <div class="list-center-area ">
	               		<div class="row center m40">
	               			<h2><%=playerDto.getPlayerName()%> 님   </h2>
	               		</div>
	               		<div class="row center m40">
	              		 	<h2>등급: <%=playerDto.getPlayerGrade() %></h2>
	               		</div>
	              	</div>
	            </div>
       	 	</div>
        <!--  -->
        <div class="row">
                <div class="row">
                    <label>아이디</label>
                    <input type="text" class="form-input input-round fill" value="<%=playerDto.getPlayerId() %>" disabled>
                </div>
                 <div class="row">
                    <label>생년월일</label>
                    <input type="date" class="form-input input-round fill" value="<%=playerDto.getPlayerBirth() %>" disabled>
                </div>
                <div class="row">
                    <label>전화번호</label>
                    <input type="text" class="form-input input-round fill" value="<%=playerDto.getPlayerPhone() %>" disabled>
                </div>
              <div class="row">
                    <label>이메일</label>
                    <input type="text" class="form-input input-round fill" value="<%=playerDto.getPlayerEmail() %>" disabled>
                <div class="row">
                    <label>포인트</label>
                    <input type="text" class="form-input input-round fill" value="<%=playerDto.getPlayerPoint() %>" disabled>
                </div>
                 <div class="row">
                    <label>성별</label>
                    <input type="text" class="form-input input-round fill" value="<%=playerDto.getPlayerGender() %>" disabled>
                </div>
              <div class="row">
                    <label>가입일</label>
                    <input type="text" class="form-input input-round fill" value="<%=playerDto.getPlayerJoindate()%>" disabled>
                </div>
                  <div class="row">
                    <label>최근접속일</label>
                    <input type="text" class="form-input input-round fill" value="<%=playerDto.getPlayerLogindate()%>" disabled>
                </div>
        	</div>
    	</div>
    </div>
    <div class="container w700 m30" >
    	<div class="row m50 center">
        	<a href="changePw.jsp">비밀번호 변경</a><span>  / </span>
			<a href="changeInformation.jsp">개인정보 변경</a><span> / </span>
	    	<a href="point.jsp">포인트 충전</a>
        </div>
        
        <div class="right m30">
        	<a href="deletePlayer.jsp">탈퇴하기</a>
		</div>
	</div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
