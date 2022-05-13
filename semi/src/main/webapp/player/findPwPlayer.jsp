<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String playerId = request.getParameter("playerId");
%>
    
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
	 <title>비밀번호 찾기</title>
    <style>
        .percent{
            background-color: #343b6a;
            height :10px;
            width:0%;
            /*스르륵*/
            transition:width 0.5s;
        }
        .box{
            padding:39px ,40px, 20px;
            font:12px;
            text-align:center;
            border:solid 1px black;
            width: 650px;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            
        }   
        .input-box{
            width: 300px;
            display: inline-block;
        }
        .last{
            display: none;
        }
        .btn-prev,
        .btn-next{
            width:110px;
        }
        .color{
            background-color: #343b6a;
            height: 50px;
        }
        .color img{
            padding-left: 1em;
            height:50px;
        }
    </style>
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
   $(function(){
            $("input[name=palyerId]").blur(regexCheckId);
            $("input[name=playerName]").blur(regexCheckName);
            $("input[name=playerPhone]").blur(regexCheckPhone);
            $(".join-form").submit(function(){
                //함수이름을 적고 call() 이라고 부르면 this 를 바꿔서 부를 수 있다
                var judge1 = regexCheckId.call(document.querySelector("input[name=playerId]"));
                var judge2 = regexCheckName.call(document.querySelector("input[name=playerName]"));
                var judge3 = regexCheckPhone.call(document.querySelector("input[name=playerPhone]"));

                return judge1 && judge2 && judge3;
            });  
            

                var index=0;

                //1. 처음 페이지를 제외하고 모두 숨김 처리
                // $(".page:gt(0)").hide();
                // $(".percent").css("width","25%");
                move(index); //첫 페이지이기 때문에 줄이거나 늘일필요 X

                //2. 다음 버튼을 누르면 다음 페이지가 나오도록 구현
                $(".btn-next").not(":last").click(function(){
                    index++;
                    move(index);
                    // move(++index);
                });
                //3. 이전 버튼을 누르면 이전 페이지가 나오도록 구현
                $(".btn-prev").not(":first").click(function(){
                    index--;
                    move(index);
                    // move(--index);
                });
                function move(index){

                    $(".page").hide(); //페이지 숨기기
                    $(".page").eq(index).show(); //페이지 나오기

                    //색 퍼센트바
                    var percent = (index+1) *100/3; //인덱스는 0-3까지이기 때문에 +1
                    $(".percent").css("width",percent+"%");
                }
            //아이디 정규표현식
            function regexCheckId(){
             //this==아이디 입력창
            var regex = /^[a-z][a-z0-9]{7,19}$/;
            var playerId =$(this).val();

            var judge = regex.test(playerId);
            if(judge){
                $(this).next().next("span").css("color","green")
                $(this).next().next("span").text("")
                return true;
            }else{
                $(this).next().next("span").css("color","red")
                $(this).next().next("span").text("영소문자 또는 숫자 8-20자이내만 사용가능합니다.");
                return false; 
            }
             
            }; 
            //전화번호 정규표현식
            function regexCheckPhone(){
             //this==전화번호 입력창
            var regex = /[0][1][0][1-9][0-9]{7}/;
            var playerPhone =$(this).val();

            var judge = regex.test(playerPhone);
            if(judge){
                $(this).next().next("span").css("color","green")
                $(this).next().next("span").text("")
                return true;
            }else{
                $(this).next().next("span").css("color","red")
                $(this).next().next("span").text("숫자 11자리를 입력하세요");
                return false;
            } 
            }; 
            //이름 정규표현식
            function regexCheckName(){
             //this==이름 입력창
            var regex = /[가-힣]{2,7}/;
            var playerName =$(this).val();

            var judge = regex.test(playerName);
            if(judge){
                $(this).next().next("span").css("color","green")
                $(this).next().next("span").text("")
                return true;
            }else{
                $(this).next().next("span").css("color","red")
                $(this).next().next("span").text("한글 2-7자 이내만 가능합니다.");
                return false;
            } 
            }; 
        });
    </script>
</head>
<body>
    <form action="findPw.player" class="join-form" method="post">
    <div class="container w650 m30">
        <div class="row">
            <div class="percent"></div>
        </div>
    </div>
    <div class="container w650 m30 page">
    <%if(playerId != null){ %>
        <div class="row left m30 ">
            <h4>비밀번호 찾기 (1/3)</h4>
        </div>
        <div class="box">
            <div class="input-box">
            	<label>아이디 : </label>
                <input type="text" name="playerId" autocomplete="off" class="form-input input-round full" value="<%=playerId%>" readonly>
                <br>
                <span></span>
            </div>
        </div>
        <%}else{ %>
        	<div class="row left m30 ">
            <h4>비밀번호 찾기 (1/3)</h4>
        </div>
        <div class="box">
            <div class="input-box">
            	<label>아이디 : </label>
                <input type="text" name="playerId" autocomplete="off" class="form-input input-round full" placeholder="아이디 입력" required>
                <br>
                <span></span>
            </div>
        </div>
        <%} %>
        <div class="row center">
            <button type="button" class="btn btn-prev">이전</button>
            <button type="button" class="btn btn-next">다음</button>
        </div>
    </div>
    <div class="container w650 m30 page">
        <div class="row left m30 ">
            <h4>비밀번호 찾기 (2/3)</h4>
        </div>
        <div class="box">
            <div class="input-box">
            	<label>이름 : </label>
                <input type="text" name="playerName" autocomplete="off" class="form-input input-round full" placeholder="이름 입력" required>
                <br>
                <span></span>
            </div>
        </div>
        <div class="row center">
            <button type="button" class="btn btn-prev">이전</button>
            <button type="button" class="btn btn-next">다음</button>
        </div>
    </div>
    <div class="container w650 m30 page">
        <div class="row left m30 ">
            <h4>비밀번호 찾기 (3/3)</h4>
        </div>
        <div class="box">
            <div class="input-box">
                <div class="row">
                	<label>생년월일 : </label>
                    <input type="date" name="playerBirth" autocomplete="off" class="form-input input-round full" placeholder="생년월일" required>
                </div>
                <div class="row">
                	<label>전화번호 : </label>
                    <input type="text" name="playerPhone" autocomplete="off" class="form-input input-round full" placeholder="전화번호" required>
                    <br>
                    <span></span>
                </div>
            </div>
        </div>
        <div class="row center">
            <button type="button" class="btn btn-prev last-btn">이전</button>
            <button type="button" class="btn btn-next last-btn last">다음</button>
            <button type="submit" class="btn btn-semi">비밀번호 찾기</button>
        </div>
        <div class="row center">
       		<%if(request.getParameter("error") != null){ %>
				<h3 style="color:red;">입력한 정보를 찾을 수 없습니다.</h3>
			<%} %>
		</div>
    </div>
</form>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>

