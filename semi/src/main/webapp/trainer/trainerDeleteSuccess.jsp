<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

        <%-- 준비 --%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 변경</title>
    <style>
        .container{
            height: 1000px;
            
        }
        .btn{
            width:200px;
            height:50px;
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
    <div class="container w800 m30">
        <div class="row center">
            <div class="row center">
                <h1>회원 탈퇴가 완료되었습니다.</h1>
            </div>
            <div class="row center m30">
                <h2>그동안 살빠Gym을 이용해주셔서 감사합니다.</h2>
            </div>
        </div>
        <div class="row center">
            <a herf="<%=request.getContextPath()%>/trainer/trainerDeleteSuccess.jsp" class="link link-btn">홈으로</a>
        </div>
    </div>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>