<%@page import="semi.servlet.DtoDao.EocDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.servlet.DtoDao.EocDao"%>
<%@page import="semi.servlet.DtoDao.CenterDto"%>
<%@page import="semi.servlet.DtoDao.CenterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%--준비 --%>
 <%
 	String centerId = request.getParameter("centerId");
 %>
  <%--처리 --%>
  <%
  	CenterDao centerDao = new CenterDao();
  	CenterDto centerDto = centerDao.selectOne(centerId);
  %>
   <%--출력 --%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">

 <!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">
$(function(){

    $(".regex-input").blur(regCheck);
    $(".edit-form").submit(function(){
        var judge1 = regCheck.call(document.querySelector("input[name=centerPhone]"));
        var judge2 = regCheck.call(document.querySelector("input[name=centerWeektime]"));
        var judge3 = regCheck.call(document.querySelector("input[name=centerWkndtime]"));

        return judge1 && judge2 && judge3;
    });

    function regCheck(){
        var regex = new RegExp($(this).data("regex"));
        var value = $(this).val();
        var judge = regex.test(value);

        if(!judge){
            $(this).next().css("color","red");
            $(this).next().text($(this).data("fail-msg"));
            return false;
        }
        else{
            $(this).next().text("");
            return true;
        }
    };
});
    </script>

	 <form action="update.kh" method="post" class="edit-form"> 
        <div class="container w400 m30">
            <div class="row center">
                <h1>센터정보 수정</h1>
            </div>
            
			 <div class="row">
			 	<label>센터아이디
            	<input type="text" name="centerId" value="<%=centerId%>" class="form-input inpur-round fill" readonly>
			 	</label>
            </div>
            
            <div class="row">
                <label>센터이름
                <input type="text" name="centerName" value="<%=centerDto.getCenterName() %>" autocomplete="off" class="form-input inpur-round fill" id="centername-input">
            	</label>
            </div>
            <div class="row">
                <label>전화번호
                <input type="text" name="centerPhone" value="<%=centerDto.getCenterPhone() %>" autocomplete="off" class="form-input input-round fill regex-input" 
                placeholder="-포함하여 입력하세요" data-regex="^0[0-6]{1,2}-[1-9][0-9]{2,3}-[0-9]{4}$" data-fail-msg="입력하신 내용이 올바르지 않습니다">
            	<span></span></label>
            </div>
            <div class="row">
                <label>평일운영시간
                <input type="text" name="centerWeektime" value="<%=centerDto.getCenterWeektime() %>" autocomplete="off" class="form-input input-round fill regex-input" 
                placeholder="휴무 또는 00:00~00:00과 같이 입력하세요" data-regex="^[가-힣0-9:~]+$" data-fail-msg="입력하신 내용이 올바르지 않습니다">
            	<span></span></label>
            </div>
            <div class="row">
                <label>주말운영시간
                <input type="text" name="centerWkndtime" value="<%=centerDto.getCenterWkndtime() %>" autocomplete="off" class="form-input input-round fill regex-input" 
                placeholder="휴무 또는 00:00~00:00과 같이 입력하세요" data-regex="^[가-힣0-9:~]+$" data-fail-msg="입력하신 내용이 올바르지 않습니다">
            	<span></span></label>
            </div>
            <div class="row">
                <label>주소</label><br>
                <input type="text" name="centerPost" value="<%=centerDto.getCenterPost() %>" autocomplete="off" class="form-input input-round">
                <a href="#" class="link link-btn">검색</a>
            </div>
            <div class="row">
                <input type="text" name="centerBasicAddress" value="<%=centerDto.getCenterBasicAddress() %>" autocomplete="off" class="form-input input-round fill">
            </div>
            <div class="row">
                <input type="text" name="centerDetailAddress" value="<%=centerDto.getCenterDetailAddress() %>" autocomplete="off" class="form-input input-round fill">
            </div>
          
            <div class="row">
                <label>센터소개</label>
                <textarea name="centerIntroduction" class="form-input input-round fill" rows="7" placeholder="센터소개 또는 비용 등에 대하여 작성해주세요"><%=centerDto.getCenterIntroduction() %></textarea>
            </div>
            <div class="row">
                <label>센터대표사진</label>
                <%-- <input type="file" name="centerPics" value="?" accept=".jpg,.png" class="form-input input-round fill">--%>
				</div>
            <div class="row right">
                <button type="submit" class="btn btn-semi">수정</button>
                <a href="/semi/center/detail.jsp?centerId=<%=centerDto.getCenterId() %>" class="link link-btn">취소</a>
            </div>
        </div>
    </form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>