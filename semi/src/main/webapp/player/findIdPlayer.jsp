<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript">
        $(function(){
        	var status = {
                    //이름 : 값
                    name : false,
                    phone : false
                };
            
            $("input[name=playerName]").blur(function(){
                var regex = /[가-힣]{2,7}/;
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
            
            
            $("input[name=playerPhone]").blur(function(){
                var regex = /[010][0-9]{8}/;
                var playerPhone = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(playerPhone);
                if(!judge){
                    span.text("- 제외 숫자 11자리 만 입력하세요");
                    status.phone = false;
                    return;
                }else{
                	span.text("");
                    status.phone = true;
                    return;
                }
            });
        });
</script>    
<jsp:include page="/jsp/template/header.jsp"></jsp:include>

	<form action = "findId.player" method="post">
	
	<div class="container w450 m30 center">
        <div class="row m30">
            <label>이름</label>
            	<input type="text" name="playerName" required autocomplete="off" class="form-input fill input-round" >
        		<span></span>
        </div>
        <div class="row m30">
            <label>전화번호</label>
            	<input type="text" name="playerPhone" required autocomplete="off" class="form-input fill input-round" >
        		<span></span>
        </div>
        <div class="row m30">
            <label>생년월일</label>
            	<input type="date" name="playerBirth" required autocomplete="off" class="form-input fill input-round" >
        </div>
        
	       <div class="row m40">
	           <input type="submit" class="btn btn-semi btn-round fill" value="아이디 찾기">
	       </div>
     </div>
		<div class="row center">
			<%if(request.getParameter("error") != null){ %>
				<h3 style="color:red;">정보가 일치하는 아이디가 존재하지 않습니다</h3>
			<%} %>
		</div>
	</form>
<div class="container w450 m30 center">
	<div class="row m40">
      	<a href="findPwPlayer.jsp">
      		<button class="btn btn-semi btn-round fill">비밀번호 찾기</button>
      	</a>
    </div>
 </div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
