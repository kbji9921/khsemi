<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sports.css">
    <section class="container">
        <div class="flex-container">
            <div class="content-box">
                <div class="content">                   
                  	<a href="<%=request.getContextPath()%>/player/join.jsp">
						<img src="../images/asdfff.png"  width = "200px"alt="일반">
					</a>
                </div>
                  <span>일반 회원가입</span>
                </div>

            <div class="content-box">
                <div class="content">         
  						<a href="<%=request.getContextPath()%>/trainer/trainerJoin.jsp">
							<img src="../images/asdfff.png" width = "200px"alt="강사">
						</a>
               	</div>
                <span>강사 회원가입</span>
          </div> 
      </div>              
    </section>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>