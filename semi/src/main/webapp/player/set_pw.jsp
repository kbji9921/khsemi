<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String playerId = request.getParameter("playerId");

	String error = request.getParameter("error");
	boolean type1 = error != null && error.equals("1");
	boolean type2 = error != null && error.equals("2");
%>

<script type="text/javascript">
        $(function(){
        	var status = {
                    //이름 : 값
                    pw : false,
                    checkpw : false
                };
            
            $("input[name=changePw]").blur(function(){
                var regex = /[a-zA-Z][a-zA-z0-9]{7,15}/;
                var changePw = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(changePw);
                if(!judge){
                    span.text("형식에 맞지 않는 이름을 입니다.");
                    status.pw = false;
                    return;
                }else{
                	 span.text("");
                     status.pw = true;
                     return;
                }
            });
            
            $("input[name=checkPw]").blur(function(){
                var regex = /[a-zA-Z][a-zA-z0-9]{7,15}/;
                var checkPw = $(this).val();
                var span = $(this).next("span");

                var judge = regex.test(checkPw);
                if(!judge){
                    span.text("형식에 맞지 않는 이름을 입니다.");
                    status.checkpw = false;
                    return;
                }else{
                	 span.text("");
                     status.checkpw = true;
                     return;
                }
            });
        });
</script>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	<form action="set_pw.player" method="post">
		<input type="hidden" name="playerId" value="<%=playerId %>">
		<div class="container w450 m30 center">
	        <div class="row">
	            <label>새 비밀번호</label>
	            	<input type="password" name="changePw" required autocomplete="off" class="form-input fill input-round" >
	        		<span></span>
	        </div>
	        <div class="row">
	            <label>비밀번호 확인</label>
	            	<input type="password" name="checkPw" required autocomplete="off" class="form-input fill input-round" >
	            	<span></span>
	        </div>
	        <div class="row">
				 <input type="submit" class="btn btn-semi btn-round fill" value="변경하기">
	        </div>
        </div>
        <div class="row center">
			<%if(type1){ %>
				<h3 style="color:red;">기본에 사용한 비밀번호입니다.</h3>
			<%} %>
				<%if(type2){ %>
				<h3 style="color:red;">입력한 비밀번호가 다릅니다.</h3>
			<%} %>
	</div>
	</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
