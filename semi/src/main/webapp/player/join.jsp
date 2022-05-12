<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/commons.css">
<%
String error = request.getParameter("error");
boolean type1 = error != null && error.equals("1");
boolean type2 = error != null && error.equals("2");
%>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript">
        $(function(){
        	var status = {
                    //이름 : 값
                    id : false , 
                    pw : false,
                    name : false,
               		gender : false,
               		email : false,
                    phone : false
                };
            $("input[name=playerId]").blur(function(){
                //1. 형식 검사 ---> 2. 중복 검사
                var regex = /[a-zA-Z][a-z0-9]{7,20}/;
                var playerId = $(this).val();

                var judge = regex.test(playerId);
                if(!judge) {
                    $(this).next("span").text("아이디를 형식에 맞게 작성하세요");
                    status.id = false;
                    return;
                }

                var that = this;

                $.ajax({
                    url:"http://localhost:8080/semi/ajax/player.id?playerId="+playerId,
                    type:"get",
                    success:function(resp) {
                        //resp는 "NNNNN" 또는 "NNNNY"일 것이다
                        if(resp == "NNNNN"){
                            $(that).next("span").text("이미 사용중인 아이디입니다");
                            status.id = false;
                        }
                        else if(resp == "NNNNY"){
                            $(that).next("span").text("사용 가능한 아이디입니다");
                            status.id = true;
                        }
                    }
                });
            });
			
            $("input[name=playerPw]").blur(function(){
                //1. 형식 검사 ---> 2. 중복 검사
                var regex = /[a-zA-Z][a-zA-Z0-9]{7,15}/;
                var playerPw = $(this).val();

                var judge = regex.test(playerPw);
                if(!judge) {
                    $(this).next("span").text("비밀번호를 형식에 맞게 작성하세요");
                    status.pw = false;
                    return;
                }else{
                	 $(this).next("span").text("");
                     status.pw = true;
                     return;
                } 
            });
            
            $("input[name=playerName]").blur(function(){
                var regex = /[가-힣ㄱ-ㅎ]{2,7}/;
                var playerName = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(playerName);
                if(!judge){
                    span.text("형식에 맞지 않는 이름을 입니다.");
                    status.name = false;
                    return;
                }else{
                	 span.text("");
                     status.name = true;
                     return;
                }
            });
            
            
            $("input[name=playerGender]").blur(function(){
                var regex = /[남여]{1}/;
                var playerGender = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(playerGender);
                if(!judge){
                    span.text("잘못된 입력입니다.");
                    status.gender = false;
                    return;
                }else{
                	 span.text("");
                     status.gender = true;
                     return;
                }
            });
            
            $("input[name=playerEmail]").blur(function(){
                var regex = /[a-zA-z][a-zA-Z0-9@]{9,49}/;
                var playerEmail = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(playerEmail);
                if(!judge){
                    span.text("잘못된 입력입니다.");
                    status.email = false;
                    return;
                }else{
                	 span.text("");
                     status.email = true;
                     return;
                }
            });
            
            $("input[name=playerPhone]").blur(function(){
                var regex = /[010][0-9]{8}/;
                var playerPhone = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(playerPhone);
                if(!judge){
                    span.text("- 제외 숫자 11자리 만 입력하세요");
                    status.phone = false;
                    return;
                }
                
                var checkphone = this;

                $.ajax({
                    url:"http://localhost:8080/semi/ajax/player.phone?playerPhone="+playerPhone,
                    type:"get",
                    success:function(resp) {
                        //resp는 "NNNNN" 또는 "NNNNY"일 것이다
                        if(resp == "NNNNN"){
                            $(checkphone).next("span").text("이미 등록된 전화번호입니다");
                            status.phone = false;
                        }
                        else if(resp == "NNNNY"){
                            $(checkphone).next("span").text("등록 가능한 전화번호입니다");
                            status.phone = true;
                        }
                    }
                });
            });
            
        });
</script>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
    <form action="insert.player" method="post">
   	<div class="container w450 m30 center">
   		<div class="row center m30">
   			<h2>일반 회원가입</h2>
        </div>
        <div class="row">
            <label>아이디</label>
            	<input type="text" name="playerId" required autocomplete="off" class="form-input fill input-round" >
            	<span></span>
        </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="playerPw" required class="form-input fill input-round">
            <span></span>
        </div>
        
        <div class="row">
        <label>이름</label>
            <input type="text" name="playerName" required autocomplete="off"class="form-input fill input-round">
        	<span></span>
        </div>
        <div class="row">
            <label>생년월일</label><br>
            <input type="date" name="playerBirth" required class="form-input input-round" autocomplete="off" placeholder="YYYY-MM-DD">
        </div>
        <div class="row ">
            <label>성별</label>
           	<input type="text" name="playerGender"  class="form-input fill input-round" autocomplete="off" placeholder="남/여">
        	<span></span>
        </div>
        <div class="row">
            <label>이메일</label>
            <input type="text" name="playerEmail"  class="form-input fill input-round" autocomplete="off">
            <span></span>
        </div>
        <div class="row">
            <label>전화번호</label>
            <input type="text" name="playerPhone" required class="form-input fill input-round" autocomplete="off" placeholder="-제외하고 입력">
       		<span></span>
        </div>
        
        <div class="row m40">
            <input type="submit" class="btn btn-semi btn-round fill" value="가입하기">
        </div>
      </div>  
      <%if(type1){ %>
			<h3 style="color:red;">전화번호를 잘못 입력하였습니다. 다시 시도해주세요</h3>
		<%} %>
		<%if(type2){ %>
			<h3 style="color:red;">입력된 값이 잘 못 되었습니다. 다시 시도해주세요</h3>
		<%} %>
    </form>
    
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
