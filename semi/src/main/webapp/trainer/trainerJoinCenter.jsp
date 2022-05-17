<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String trainerId = (String)request.getSession().getAttribute("trainer"); %>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입 화면</title>
    <!-- 구글 폰트 CDN -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/commons.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->
<script>
	var context = <%=request.getContextPath()%>;
</script>
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <style>
    html{
        background-color: #F5F6F7;
    }
        .pw-btn{
            height: 40px !important;
            border-radius:0.25em !important;
        }
    </style>
      <script type="text/javascript">
        $(function(){
			
        	$("input[name=centerId]").blur(idCheck);

        	
        	var judgeObject = {
        			id:false,
        	};
        	
        	$(".join-form").submit(function(){
                return judgeObject.id;
			})
        	
            //아이디 검사(형식,중복)
            function idCheck(){
            	var regex= /[a-z][a-z0-9]{4,19}/;
                var centerId = $(this).val();
                var span = $(this).next("span");
                var judge = regex.test(centerId);
                
                console.log("judge="+judge);

                if(!judge){
                	span.css("color","red");
                	span.text($(this).data("fail-msg"));
                	judgeObject.id = false;
                	return;
                }
	            var that =this;
	
	            $.ajax({
	                url: context+"/ajax/trainer-center.join",
	                type: "post",
	                data: {
	                    centerId : centerId
	                },
	                success:function(resp){
	                    if(resp==="YY"){
	                        $(that).next("span").css("color","green");
	                        $(that).next("span").text("가입 가능한 센터입니다.");
	                        judgeObject.id = true;
	                    }
	                    else if(resp==="NN"){
	                        $(that).next("span").css("color","red");
	                        $(that).next("span").text("존재하지 않는 센터입니다.");
	                        judgeObject.id = false;
	                    }
	                }
	            });
            }
            
        });
    </script>
</head>
<body>
    <form action="join.center" class="join-form" method="post">
    <div class="container w450 m30">
        <div class="row">
        	<input type="hidden" name="trainerId" value="<%=trainerId%>">
            <label>센터아이디</label>
            <input type="text" name="centerId"  autocomplete="off" class="form-input fill input-round" >
            <span></span>
        <div class="row m20">
            <button type="submit" class="btn btn-semi btn-round fill pw-btn">가입하기</button>
        </div>
        <div class="row center">
            <a href="#" class="link">이용약관</a>|
            <a href="#" class="link">개인정보 처리방침</a>|
            <a href="#" class="link">회원정보 고객센터</a>
            <p>Copyright 살빠짐 Corp. All Rights Reserved.</p>
            
        </div>
    </div>
    </div>
</form>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>