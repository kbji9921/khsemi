<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
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
        }}
        .box{
            padding:39px ,40px, 20px;
            font:12px;
            text-align:center;
            border:solid 1px black;
            width: 650px;
            height: 120px;
        }   
        .btn-prev,
        .btn-next{
            width:110px;
        }
    </style>
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">
        $(function(){
            $("input[name=playerName]").blur(regexCheckName);
            $("input[name=playerPhone]").blur(regexCheckPhone);
            $("input[name=playerEmail]").blur(regexCheckEmail);
            $(".join-form").submit(function(){
                //함수이름을 적고 call() 이라고 부르면 this 를 바꿔서 부를 수 있다
                var judge1 = regexCheckName.call(document.querySelector("input[name=playerName]"));
                var judge2 = regexCheckPhone.call(document.querySelector("input[name=playerPhone]"));
                var judge3 = regexCheckEmail.call(document.querySelector("input[name=playerEmail]"));

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
            //이름 정규표현식
            function regexCheckName(){
             //this==이름 입력창
            var regex = /^[가-힣]{2,7}$/;
            var playerName =$(this).val();

            var judge = regex.test(playerName);
            if(judge){
                $(this).next("span").css("color","green")
                $(this).next("span").text("")
                return true;
            }else{
                $(this).next("span").css("color","red")
                $(this).next("span").text("한글 2-7자 이내만 가능합니다.");
                return false; 
            }
             
            }; 
            //전화번호 정규표현식
            function regexCheckPhone(){
             //this==전화번호 입력창
            var regex = /^[0][1][0][1-9][0-9]{7}$/;
            var trainerPhone =$(this).val();

            var judge = regex.test(playerPhone);
            if(judge){
                $(this).next("span").css("color","green")
                $(this).next("span").text("")
                return true;
            }else{
                $(this).next("span").css("color","red")
                $(this).next("span").text("숫자 11자리를 입력하세요");
                return false;
            } 
            }; 
            //이메일 정규표현식
            function regexCheckEmail(){
             //this==이메일 입력창
            var regex = /[a-zA-z][a-zA-Z0-9@]{9,49}/;
            var playerEmail =$(this).val();

            var judge = regex.test(playerEmail);
            if(judge){
                $(this).next("span").css("color","green")
                $(this).next("span").text("")
                return true;
            }else{
                $(this).next("span").css("color","red")
                $(this).next("span").text("이메일주소를 다시 확인하세요");
                return false;
            } 
            }; 
        });
    </script>
</head>
<body>
<form class="join-form" action="findId.player" method="post">
    <div class="container w650 m30">
        <div class="row">
            <div class="percent"></div>
        </div>
    </div>
    <div class="container w650 m30 page">
        <div class="row left m30 ">
            <h4>아이디 찾기 (1/3)</h4>
        </div>
        <div class="box">
            <div class="input-box">
                <input type="text" name="playerName" autocomplete="off" class="form-input input-round " placeholder="이름 입력">
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
            <h4>아이디 찾기 (2/3)</h4>
        </div>
        <div class="box">
            <div class="input-box">
                <input type="text" name="playerPhone" autocomplete="off" class="form-input input-round " placeholder="전화번호 입력">
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
            <h4>아이디 찾기 (3/3)</h4>
        </div>
        <div class="box">
            <div class="input-box">
                <div class="row center">
                    <input type="text" name="playerEmail" autocomplete="off" class="form-input input-round " placeholder="이메일">
                    <span></span>
                </div>
            </div>
        </div>
        <div class="row center">
            <button type="button" class="btn btn-prev last-btn">이전</button>
            <button type="button" class="btn btn-next last-btn last">다음</button>
            <button type="submit" class="btn btn-semi">아이디 찾기</button>
        </div>
    </div>
        <div class="row center">
	       	<%if(request.getParameter("error") != null){ %>
				<h3 style="color:red;">정보가 일치하는 아이디가 존재하지 않습니다</h3>
			<%} %>
		</div>
</form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>
