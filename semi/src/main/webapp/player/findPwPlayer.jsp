<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playerId = request.getParameter("playerId");
%>    

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script type="text/javascript">
        $(function(){
        	var status = {
                    //이름 : 값
                    id : false , 
                    name : false,
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
                }else{
                	  $(this).next("span").text("");
                      status.id = true;
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
            
            
            $("input[name=playerEmail]").blur(function(){
                var regex = /[a-zA-z][a-zA-Z0-9@]{9,49}/;
                var playerEmail = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(playerEmail);
                if(!judge){
                    span.text("형식에 맞지 않습니다. 다시 입력해주세요");
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
                }else{
                	 span.text("");
                     status.phone = true;
                     return;
                }
            });
        });
</script>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<form action="findPw.player" method="post">
		<div class="container w450 m30 center">
			<div class="row center m30">
				<h2>비밀번호 찾기</h2>
			</div>
			<%if(playerId == null){ %>
		        <div class="row">
		            <label>아이디</label>
		            	<input type="text" name="playerId" required autocomplete="off" class="form-input fill input-round" >
		            	<span></span>
		        </div>
		    <%}else{ %>
	        	<div class="row">
		            <label>아이디</label>
		            	<input type="text" name="playerId" required autocomplete="off" class="form-input fill input-round" value="<%=playerId%>"  readonly>
		        		<span></span>
		        </div>
	        <%} %>
	        <div class="row">
	            <label>이름</label>
	            	<input type="text" name="playerName" required autocomplete="off" class="form-input fill input-round" >
	            	<span></span>
	        </div>
	        
	        <div class="row">
	            <label>전화번호</label>
	            	<input type="text" name="playerPhone" required autocomplete="off" class="form-input fill input-round" >
	            	<span></span>
	        </div>
	        
	        <div class="row m40">
            	<input type="submit" class="btn btn-semi btn-round fill" value="비밀번호 찾기">
       	 	</div>
        </div>
		<div class="row center">
       		<%if(request.getParameter("error") != null){ %>
				<h3 style="color:red;">입력한 정보를 찾을 수 없습니다.</h3>
			<%} %>
		</div>
	</form>
	<div class="container w450 m30 center">
	<div class="row m40">
      	<a href="findIdPlayer.jsp">
      		<button class="btn btn-semi btn-round fill">아이디 찾기</button>
      	</a>
    </div>
 </div>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
