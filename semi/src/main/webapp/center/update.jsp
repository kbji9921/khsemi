<%@page import="semi.servlet.DtoDao.CenterAttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.CenterAttachmentDao"%>
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
     
     CenterAttachmentDao centerAttachmentDao = new CenterAttachmentDao();
     int attachmentNo = centerAttachmentDao.selectOne(centerId);
     
     AttachmentDao attachmentDao = new AttachmentDao();
     AttachmentDto attachmentDto = attachmentDao.selectOne(attachmentNo);
   boolean noPic = attachmentDto==null;
  %>
   <%--출력 --%>

<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center1.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mypage.css">
<style>
.hide{
display:none !important;}
.mypage-nickname {
   display: flex;
   align-items: center;
   justify-content: center;
   width: 50%;
   margin-left: 0px;
}
</style>
 <!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">
$(function(){
   $(function() {
      //수정
      $(".input-dis").attr("disabled", true);
      $("#btn").click(function(event) {
         $(".input-dis").attr("disabled", false);
         $("#btn").addClass("hide")
         $('#btn2').removeClass("hide")
         $('#btn3').removeClass("hide")
         $('#btn4').removeClass("hide")
         $('#btn5').removeClass("hide")
         event.preventDefault();
      });
      $('#btn3').click(function(event) {
         $(".input-dis").attr("disabled", true);
         $("#btn").removeClass("hide")
         $('#btn2').addClass('hide')
         $('#btn3').addClass('hide')
         $('#btn4').addClass("hide")
         $('#btn5').addClass("hide")
      });
   })
      $("input[name=centerPhone]").blur(phoneCheck);
      $("input[name=centerWeektime]").blur(weekCheck);
      $("input[name=centerWkndtime]").blur(wkndCheck);
      
      var judgeObject = {
            phone:false,
            week:false,
            wknd:false
      };
      
      $(".edit-form").submit(function(){
         return confirm("정말 수정하시겠습니까?")
      })
   
    

       //전화번호 정규표현식
       function phoneCheck(){
          var regex = /0[0-6]{1,2}-[1-9][0-9]{2,3}-[0-9]{4}/;
           var value = $(this).val();
           span = $(this).next("span");
   
           var judge = regex.test(value);
           if(judge){
              span.text("");
               judgeObject.phone = true;
           }
           else{
               span.css("color","red");
               span.text($(this).data("fail-msg"));
               judgeObject.phone = false;
           }
       }
       
       //평일운영시간 검사
       function weekCheck(){
          var regex = /^[가-힣0-9:~]+$/;
          var value = $(this).val();
          var span = $(this).next("span");
          var judge = regex.test(value);
          
          if(judge){
             span.text("");
             judgeObject.week = true;
          }
          else{
             span.css("color","red");
             span.text($(this).data("fail-msg"));
             judgeObject.week = false;
          }
       }
    
       
      //주말운영시간 검사
      function wkndCheck(){
         var regex = /^[가-힣0-9:~]+$/;
         var value = $(this).val();
         var span = $(this).next("span");
         var judge = regex.test(value);
         
         if(judge){
            span.text("");
            judgeObject.wknd = true;
         }
         else{
            span.css("color","red");
            span.text($(this).data("fail-msg"));
            judgeObject.wknd = false;
         }
      }
      $(function() {
         $(".input-dis").attr("disabled", true);
         $("#btn").click(function(event) {
            $(".input-dis").attr("disabled", false);
            $("#btn").addClass("hide")
            $('#btn2').removeClass("hide")
            $('#btn3').removeClass("hide")
            $('#btn4').removeClass("hide")
            $('#btn5').removeClass("hide")
            event.preventDefault();
         });
         $('#btn3').click(function(event) {
            $(".input-dis").attr("disabled", true);
            $("#btn").removeClass("hide")
            $('#btn2').addClass('hide')
            $('#btn3').addClass('hide')
            $('#btn4').addClass("hide")
            $('#btn5').addClass("hide")
         });
      })
});
    </script>

    <form action="update.kh" method="post"  class="edit-form"> 
        <div class="container w400 m30">
            <div class="row center">
                <h1>센터정보 수정</h1>
            </div>
                  <div class="container w500 m30">
         <div class="flex-container flex-vertical">
            <div class="flex-container list-center-listbox">
               <!--센터 이미지-->
               <div class="row center list-image-area">
                  <%
                  if (!noPic) {
                  %>
                  <a
                     href="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attachmentNo%>">
                     <img
                     src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attachmentNo%>"
                     class="img img-circle asdf" width="200px">
                  </a>
                  <%
                  } else {
                  %>
                  <img src="<%=request.getContextPath()%>/images/profile.png"
                     width="200px" class="img img-round">
                  <%
                  }
                  %>
               </div>
               <h3 class="mypage-nickname"><%=centerDto.getCenterName()%></h3>
            </div>
         </div>
         <div class="row">
            <%
            if (!noPic) {
            %>
            <a
               href="<%=request.getContextPath()%>/profile/centerProfileDelete.jsp"
               class="link link-btn">센터이미지 삭제</a>
            <%
            } else {
            %>
            <a
               href="<%=request.getContextPath()%>/profile/centerProfileInsert.jsp"
               class="link link-btn">센터이미지 등록</a>
            <%
            }
            %>
         </div>
      </div>
          <div class="row">
             <label>센터아이디
               <input type="text" name="centerId" value="<%=centerId%>" class="form-input inpur-round fill mypage-input" readonly>
             </label>
            </div>
            
            <div class="row">
                <label>센터이름
                <input type="text" name="centerName" value="<%=centerDto.getCenterName() %>" autocomplete="off" class="form-input inpur-round fill mypage-input input-dis" id="centername-input">
               </label>
            </div>
            <div class="row">
                <label>전화번호
                <input type="text" name="centerPhone" value="<%=centerDto.getCenterPhone()%>" autocomplete="off" class="form-input input-round fill regex-input mypage-input input-dis" 
                placeholder="-포함하여 입력하세요" data-fail-msg="입력하신 내용이 올바르지 않습니다">
               <span></span></label>
            </div>
            <div class="row">
                <label>평일운영시간
                <input type="text" name="centerWeektime" value="<%=centerDto.getCenterWeektime() %>" autocomplete="off" class="form-input input-round fill regex-input mypage-input input-dis" 
                placeholder="휴무 또는 00:00~00:00과 같이 입력하세요" data-fail-msg="입력하신 내용이 올바르지 않습니다">
               <span></span></label>
            </div>
            <div class="row">
                <label>주말운영시간
                <input type="text" name="centerWkndtime" value="<%=centerDto.getCenterWkndtime() %>" autocomplete="off" class="form-input input-round fill regex-input mypage-input input-dis" 
                placeholder="휴무 또는 00:00~00:00과 같이 입력하세요" data-fail-msg="입력하신 내용이 올바르지 않습니다">
               <span></span></label>
            </div>
            <div class="row">
                <label>주소</label><br>
                <input type="text" name="centerPost" value="<%=centerDto.getCenterPost() %>" autocomplete="off" class="form-input input-round  input-dis">
                <a href="#" class="link link-btn">검색</a>
            </div>
            <div class="row">
                <input type="text" name="centerBasicAddress" value="<%=centerDto.getCenterBasicAddress() %>" autocomplete="off" class="form-input input-round fill  input-dis">
            </div>
            <div class="row">
                <input type="text" name="centerDetailAddress" value="<%=centerDto.getCenterDetailAddress() %>" autocomplete="off" class="form-input input-round fill  input-dis">
            </div>
          
            <div class="row">
                <label>센터소개</label>
                <textarea name="centerIntroduction" class="form-input input-round center-introbox fill input-dis"  placeholder="센터소개 또는 비용 등에 대하여 작성해주세요"><%=centerDto.getCenterIntroduction() %></textarea>
            </div>
           
            <div class="row right">
                <button type="button" class="btn btn-semi fill mypage-btn update-btn " id="btn">수정</button>
                <button type="submit" class="btn btn-semi fill mypage-btn hide" id="btn4">변경완료</button>
                <a href="<%=request.getContextPath()%>/center/update.jsp?centerId=<%=centerDto.getCenterId() %>" class="link link-btn fill mypage-btn hide" id="btn3" style="margin-top: 10px;">취소</a>
            </div>
            <div class="row right">
                <a href="<%=request.getContextPath()%>/eoc/detail.jsp?centerId=<%=centerDto.getCenterId() %>" class="link link-btn fill mypage-btn hide" id="btn2">운동종목</a>
            </div>
        </div>
    </form>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>