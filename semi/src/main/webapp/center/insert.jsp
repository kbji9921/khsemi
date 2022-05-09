<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">

	 <form action="insert.kh" method="post">
        <div class="container w400 m30">
            <div class="row center">
                <h1>센터등록</h1>
            </div>

            <div class="row">
                <label for="centerid-input">센터아이디</label>
                <input type="text" name="centerId" placeholder="영문소문자,숫자 5~20글자" autocomplete="off" class="form-input input-round fill"
                 id="centerid-input"> 
            </div>

            <div class="row">
                <label for="centername-input">센터이름</label>
                <input type="text" name="centerName" autocomplete="off" class="form-input input-round fill" id="centername-input">
            </div>
            <div class="row">
                <label for="centerphone-input">전화번호</label>
                <input type="text" name="centerPhone" autocomplete="off" placeholder="-포함하여 입력하세요" class="form-input input-round fill"
                id="centerphone-input">
            </div>
            <div class="row">
                <label for="week-input">평일운영시간</label>
                <input type="text" name="centerWeektime" placeholder="휴무 또는 00:00~00:00과 같이 입력하세요" autocomplete="off" class="form-input input-round fill"
                id="week-input">
            </div>
            <div class="row">
                <label for="wkndtime-input">주말운영시간</label>
                <input type="text" name="centerWkndtime" placeholder="휴무 또는 00:00~00:00과 같이 입력하세요" autocomplete="off" class="form-input input-round fill"
                id="wkndtime-input">
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
                <label for="exercise-input">운동종목</label>

                <input type="text" name="exerciseName" autocomplete="off" placeholder="2개 이상의 종목 추가는 마이페이지에서 가능합니다" class="form-input input-round fill"
                id="exercise-input">
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
                <button type="submit" class="btn btn-primary">등록</button>
                <a href="#" class="link link-btn">취소</a>
            </div>
        </div>
    </form>
    
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>