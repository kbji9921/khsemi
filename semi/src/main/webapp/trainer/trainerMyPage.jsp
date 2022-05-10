<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%-- 준비 --%>
<%
String trainerId = "testuser6";
//String trainerId= (String)request.getSession().getAttribute("login2");
%>    
    
    <%-- 처리 --%>
<%
TrainerDao trainerDao = new TrainerDao();
TrainerDto trainerDto = trainerDao.selectOne(trainerId);
%>    
    <jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
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
        }
        .img-wrapper{
            width:25%;
        }
        .contents-wrapper{
            flex-grow:1; /*나머지 전부 다 라는 의미로 쓰임 */
        }
        .container{
            border:1px solid black;
        }
    </style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <link rel="stylesheet" type="text/css" href="../css/sidebar.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">

    </script>
</head>
<body>  
    <div class="row m30">
        <label for ="tg" class="toggle-label"><img src="../images/menu.png" width="30"></label>
        <input type="checkbox" class="toggle-sidebar" id="tg">
        <div class="sidebar">
            <div class="row m50">
            </div>
            <div class="row">
                <button class="btn btn-round fill">홈으로</button>
            </div>
            <div class="row">
                <button class="btn btn-round fill">정보 수정</button>
            </div>
            <div class="row">
            <button class="btn btn-round fill btn-danger">스케쥴</button>
        </div>
            <div class="row">
                <button class="btn btn-round fill">비밀번호 변경</button>
            </div>
        <div class="row">
            <button class="btn btn-round fill btn-danger">회원 탈퇴</button>
        </div>
    </div>
</div>

<form>
    <div class="container w600 m30">
        <div class="flex-container flex-vertical">
            <div class="flex-container">
            <div class="img-wrapper display-center">
                <img src="../images/trainer_dummy/trainer_1.jpg" width="150px" height="150px" class="img img-circle">
            </div>
            <div class="contents-wrapper">
                <div class="row center">
                    <h2><%=trainerDto.getTrainerName()%>님</h2>
                </div>
            </div>
            <div>
            </div>
        </div>
        </div>
        <div class="row">
            <table class="table">
            	 <tr>
                    <th>아이디</th>
                    <td >
                        <%=trainerDto.getTrainerId()%>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td >
                        <%=trainerDto.getTrainerName()%>
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <%=trainerDto.getTrainerBirth() %>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <%=trainerDto.getTrainerPhone()%>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td>
                       <%=trainerDto.getTrainerEmail() %>
                    </td>
                </tr>
                    <th>종목</th>
                    <td>
                      <%=trainerDto.getTrainerSports() %>
                    </td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <%=trainerDto.getTrainerGender() %>
                    </td>
                </tr>
                <tr>
                    <th>회원가입일</th>
                    <td>
                       <%=trainerDto.getTrainerJoindate()%>
                    </td>
                </tr>
                <tr>
                    <th>최근접속일</th>
                    <td>
                        <%=trainerDto.getTrainerLogindate()%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</form>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>