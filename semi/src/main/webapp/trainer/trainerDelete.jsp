<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   String trainerId = (String)request.getSession().getAttribute("trainer");
    %>
    <jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴 안내</title>
    <style>  
        .box{
            padding:39px ,40px, 20px;
            font:12px;
            text-align:center;
            border:solid 1px black;
            width: 650px;
            height: 120px;
        }   
        .btn-danger{
            height:40px;
            border-radius:0.25em !important
        }
    </style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">

    </script>
</head>
<body>
    <div class="container w650 m50">
        <form action="<%=request.getContextPath()%>/trainer/delete.trainer" >
        <div class="row left">
            <h2>탈퇴 안내</h2>
        </div>
        <div class="row">
            <p class="contxt">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
        </div>
        <div class="row">
            <div class="box display-center left">
                <ul>
                    <li>
                        탈퇴시 회원님께서 보유하셨던 포인트, 회원정보, 거래정보 등은 모두 삭제됩니다.
                    </li>
                    <li>
                        탈퇴한 이후에는 해당 아이디를 다시 사용할 수 없으며 아이다와 데이터는 복구 할 수 없습니다.
                    </li>
                    <li>
                        게시판에 남아있는 글과 평점은 탈퇴후 삭제할 수 없습니다.
                    </li>
                </ul>
            </div>
            <div class="row">
                <input type="checkbox" name="trainerId" value="<%=trainerId%>" id="userid">
                <label for="userid">안내사항을 모두 확인하였으며 이에 동의합니다.</label>
            </div>
            <div class="row">
                <label>비밀번호 입력</label>
                <input type="password" name="trainerPw" class="form-input input-round fill">
            </div>
            <div class="row">
                   <%if(request.getParameter("error")!=null){ %>
         			<h3 style="color:red">비밀번호가 일치하지 않습니다.</h3>
         			<%} %>   
            </div>
            <div>
                <button type="submit" class="btn btn-danger fill">탈퇴</button>
            </div>
        </div>
    </form>
    </div>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>