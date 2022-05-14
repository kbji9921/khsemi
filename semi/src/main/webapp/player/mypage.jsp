<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.PlayerAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.PlayerDto"%>
<%@page import="semi.servlet.DtoDao.PlayerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%-- 준비 --%>
<%
	//String trainerId = "testuser6";
	String playerId = (String)request.getSession().getAttribute("login");
%>    
    
    <%-- 처리 --%>
<%
	PlayerDao playerDao = new PlayerDao();
	PlayerDto playerDto =playerDao.selectOne(playerId);
	
	PlayerAttachmentDao playerAttachmentDao = new PlayerAttachmentDao();
	int attach = playerAttachmentDao.selectOne(playerId);
	
	AttachmentDao attachmentDao = new AttachmentDao();
	AttachmentDto attachmentDto = attachmentDao.selectOne(attach);
	
	boolean noPic = attachmentDto==null;
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 변경</title>
    <style>
        .flex-container{
            padding: 1em;
            background-color: #343b6a;
            color: white;
            border-radius: 0.3em;
        }
        .img-wrapper{
            width:25%;
        }
        .contents-wrapper{
            flex-grow:1; /*나머지 전부 다 라는 의미로 쓰임 */
        }
        /* .Container{
            /* border:1px solid black; 
        } */
        .list-center-area{
        width:60px;}
        .list-image-area{
        width:200px;
        height:200px;   }
        .list-image-area img{
        width:100%;
        }
        .hide {
            display:none !important;
        }
        input:readonly{
            background-color: #F0F0F0;
        }
        .btn{
            height:40px;
            border-radius: 0.25em;
        }
        #btn5{
        background-color:red !important;
        color:white !important;
        border: none !important;
        }
        .asdf{
           width:100%;
           height:100%;
        }
        #lnb{
        margin-top:-40px;
        }
            .top{
            position: fixed; bottom: 350px; right: 5px;
        }
        #lnb {
       background-color: #343b6a !important;
      }
      #lnb li a {
          font-weight: 500;
       height: 50px;
       line-height: 50px;
       color: #fff !important;
       font-size: 17px;
       }

      #lnb-right{
      display:flex;
      justify-content: space-around;
      }
      .menu, .menu li, .menu ul, .menu a{
      background-color: #343b6a !important;
      color:white !important;
      overflow:visible !important;
      text-overflow:visible !important;
      width:2em important;
      }
    </style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
     <link rel="stylesheet" type="text/css" href="../css/mypage.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->
   
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
    $(function(){
        $(".input-dis").attr("disabled", true);
       $("#btn").click(function(event){
            $(".input-dis").attr("disabled", false);
            $("#btn").addClass("hide")
            $('#btn2').removeClass("hide")
            $('#btn3').removeClass("hide")
            $('#btn4').removeClass("hide")
            $('#btn5').removeClass("hide")
            event.preventDefault();
       });
        $('#btn3').click(function(event){
            $(".input-dis").attr("disabled", true);
            $("#btn").removeClass("hide")
            $('#btn2').addClass('hide')
            $('#btn3').addClass('hide')
            $('#btn4').addClass("hide")
            $('#btn5').addClass("hide")
        });
    })
    </script>
</head>

<body>  
<form class="join-form" method="post" action="chageinformation.player">
    <div class="container w500 m30">
            <div class="flex-container flex-vertical">
            <div class="flex-container list-center-listbox">
                <!--센터이미지-->
                <div class="row center list-image-area">
                <%if(!noPic){ %>
                    <a href="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>"></a>
                    <img src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>" class="img img-circle asdf">
            <%}else{ %>
                <img src="<%=request.getContextPath()%>/images/profile.png" width="200px" class="img img-round">
            <%} %>
                </div>
               		<h3 class="mypage-nickname"><%=playerDto.getPlayerName()%>님   </h3>
<!--                 <div class="list-center-area "> -->
<!--                <div class="row right"> -->
<!--                </div> -->
<!--                </div> -->
                </div>
      
            </div>
                     <div class="row">
                <%if(!noPic){ %>
            <a href="<%=request.getContextPath()%>/profile/playerProfileDelete.jsp?playerId=<%=playerId %>" class="link link-btn">프로필 삭제</a>
            <%}else{ %>
            <a href="<%=request.getContextPath()%>/profile/playerProfileInsert.jsp?playerId=<%=playerId %>" class="link link-btn">프로필 등록</a>
            <%} %>
            </div>
        </div>
        <!--  -->
  <div class="container w500 m30">
        <div class="row">
                <div class="row">
                    <label>아이디</label>
                    <input type="text" class="form-input input-round fill" value="<%=playerDto.getPlayerId()%>" readonly name="playerId">
                    <span></span>
                </div>
                <div class="row">
                    <label>이름</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=playerDto.getPlayerName()%>" name="playerName">
                    <span></span>
                </div>
                 <div class="row">
                    <label>생년월일</label>
                    <input type="date" class="form-input input-round fill input-dis" value="<%=playerDto.getPlayerBirth()%>" name="playerBirth">
                    <span></span>
                </div>
                <div class="row ">
                    <label>전화번호</label>
                    <input type="tel" class="form-input input-round fill input-dis" value="<%=playerDto.getPlayerPhone()%>" name="playerPhone">
                    <span></span>
                </div>
              <div class="row ">
                    <label>이메일</label>
                    <input type="email" class="form-input input-round fill input-dis" value="<%=playerDto.getPlayerEmail()%>" name="playerEmail">
                    <span></span>
                
                 <div class="row ">
                    <label>성별</label>
                    <select class="form-input input-round fill input-dis" name="playerGender">
                             <%if(playerDto.getPlayerGender().equals("여")){%>
                     <option value="여" selected>여자</option>
                     <%}else{ %>
                     <option value="여">여자</option>
                     <%} %>
                     <%if(playerDto.getPlayerGender().equals("남")){%>
                     <option value="남" selected>남자</option>
                     <%}else{ %>
                     <option value="남">남자</option>
                     <%} %>
                    </select>
                </div>
               
              <div class="row ">
                    <label for="logindate">가입일</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=playerDto.getPlayerJoindate()%>" id="logindate" readonly>
                    <span></span>
                </div>
                  <div class="row ">
                    <label>최근접속일</label>
                    <input type="text" class="form-input input-round fill input-dis" value="<%=playerDto.getPlayerLogindate()%>" readonly>
                    <span></span>   
                </div>
                      <div class="row ">
                    <label>비밀번호</label>
                    <input type="password" class="form-input input-round fill input-dis" name="playerPw" required>
                    <span></span>   
                </div>
        </div>
    </div>
    <div class="row">
        <button class="btn btn-semi fill" id="btn">수정</button>
        <button class="btn btn-semi fill hide" id="btn2" >변경완료</button>
    </div>
    <div class="row">
        <button  type="button"class="btn btn-primary fill hide" id="btn3">취소</button>
        </div>
    <div class="row">
        <a href="change.jsp?playerId=<%=playerId %>" class="link link-btn fill hide"  id="btn4" >비밀번호 변경</a>
        </div>
    <div class="row">
        <a href="<%=request.getContextPath()%>/deletePlayer.jsp" class="link link-btn  fill hide"  id="btn5" >탈퇴</a>
    </div>
    <div class="top">
    <a href="#top">
    <img src="<%=request.getContextPath()%>/images/top.png"  width="50px"title="위로 가기"></a>
    </div>
    </div>
    </form>
    <div class="row center">
		<%if(request.getParameter("error") != null){ %>
			<h3 style="color:red;">비밀번호가 일치하지 않습니다.</h3>
		<%} %>
	</div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
