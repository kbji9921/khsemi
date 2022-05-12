<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <script type="text/javascript">
        $(function(){
        	 $("input[name=centerId]").blur(idCheck);
        	 var judge1 = idCheck.call(document.querySelector("input[name=centerId]"));
             //정규표현식 합쳐서 검사
             $(".regex-input").blur(regCheck);
             //form 전송
             $(".join-form").submit(function(){
                 judge1
                 var judge2 = regCheck.call(document.querySelector("input[name=centerPhone]"));
                 var judge3 = regCheck.call(document.querySelector("input[name=centerWeektime]"));
                 var judge4 = regCheck.call(document.querySelector("input[name=centerWkndtime]"));
                 
                 return judge1 && judge2 && judge3 && judge4;
             });
          
            //아이디 검사(형식,중복)
            function idCheck(){
                var regex= /[a-z][a-z0-9]{4,19}/;
                var centerId = $(this).val();
                var span = $(this).next("span");
                var judge = regex.test(centerId);

                if(!judge){
                    span.css("color","red");
                    span.text("아이디의 형식을 바르게 작성하세요");
                    return false;
                }

            var that =this;

            $.ajax({
                url:"http://localhost:8080/semi/ajax/center-id.kh",
                type: "post",
                data: {
                    centerId : centerId
                },
                success:function(resp){
                    if(resp==="YY"){
                        $(that).next("span").css("color","green");
                        $(that).next("span").text("사용 가능한 아이디입니다");
                        return true;
                    }
                    else if(resp==="NN"){
                        $(that).next("span").css("color","red");
                        $(that).next("span").text("이미 사용중인 아이디입니다");
                        return false;
                    }
                }
            });
            };


            //정규표현식 함수
            function regCheck(){
                var regex = new RegExp($(this).data("regex"));
                var value = $(this).val();
                span = $(this).next("span");

                var judge = regex.test(value);
                if(judge){
                    span.css("color","green");
                    span.text($(this).data("success-msg"));
					return true;
                }
                else{
                    span.css("color","red");
                    span.text($(this).data("fail-msg"));
                    return false;
                }
            }

        })
    </script>
    
	 <form action="write.kh" method="post" class="join-form">
        <div class="container w400 m30">
            <div class="row center">
                <h1>센터등록</h1>
            </div>

            <div class="row">
                <label for="centerid-input">센터아이디
                <input type="text" name="centerId" placeholder="영문소문자,숫자 5~20글자내로 입력하세요" autocomplete="off" class="form-input input-round fill">
                 <span></span> </label>
            </div>

            <div class="row">
                <label for="centername-input">센터이름
                <input type="text" name="centerName" autocomplete="off" class="form-input input-round fill"></label>
            </div>
            <div class="row">
                <label>전화번호
                <input type="text" name="centerPhone" autocomplete="off" placeholder="-포함하여 입력하세요" class="form-input input-round fill regex-input"
                data-regex="^0[0-6]{1,2}-[1-9][0-9]{2,3}-[0-9]{4}$" data-success-msg="올바른 전화번호 입니다" data-fail-msg="-를 포함하여 입력하세요">
                 <span></span></label>
            </div>
            <div class="row">
                <label>평일운영시간
                <input type="text" name="centerWeektime" placeholder="휴무 또는 00:00~00:00과 같이 입력하세요" autocomplete="off" class="form-input input-round fill regex-input"
               	data-regex="^[가-힣0-9:~]+$" data-success-msg="" data-fail-msg="입력하신 시간을 다시 확인해주세요">
               	<span></span></label>
            </div>
            <div class="row">
                <label>주말운영시간
                <input type="text" name="centerWkndtime" placeholder="휴무 또는 00:00~00:00과 같이 입력하세요" autocomplete="off" class="form-input input-round fill regex-input"
                data-regex="^[가-힣0-9:~]+$" data-success-msg="" data-fail-msg="입력하신 시간을 다시 확인해주세요">
                <span></span></label>
            </div>
            <div class="row">
                <label>주소</label><br>
                <input type="text" name="centerPost" class="form-input input-round">

                <a href="#" class="link link-btn">검색</a>
            </div>
            <div class="row">
                <input type="text" name="centerBasicAddress" autocomplete="off" class="form-input input-round fill">
            </div>
            <div class="row">
                <input type="text" name="centerDetailAddress" autocomplete="off" class="form-input input-round fill">
            </div>
            <div class="row">
                <label>운동종목</label>
				<select name="exerciseName" class="form-input input-round fill">
					<option selected disabled>주종목 외 운동은 내 정보에서 추가 가능합니다</option>
					<option>헬스</option>
					<option>필라테스</option>
					<option>요가</option>
					<option>테니스</option>
					<option>수영</option>
				</select>
            </div>
            <div class="row">
                <label for="introduction-input">
                    <textarea name="centerIntroduction" class="form-input input-round fill" rows="7" autocomplete="off" 
                    placeholder="센터소개 또는 비용 등에 대하여 작성해주세요"></textarea>
                </label>
            </div>
            <div class="row">
                <label>센터대표사진</label>
                <input type="file" name="centerPics" class="form-input input-round fill">
            </div>
            <div class="row right">
                <button type="submit" class="btn btn-semi">등록</button>
                <a href="#" class="link link-btn">취소</a>
            </div>
        </div>
    </form>
    
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>