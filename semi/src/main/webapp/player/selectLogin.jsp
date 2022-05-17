<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sports.css">
    <section class="container">
        <div class="flex-container">
            <div class="content-box">
                <div class="content">                   
                  	<a href="<%=request.getContextPath()%>/player/login.jsp">
						<img src="<%=request.getContextPath() %>/images/asdfff.png"  width = "200px"alt="일반">
					</a>
                </div>
                  <span>회원 로그인</span>
                </div>

            <div class="content-box">
                <div class="content">         
  						<a href="<%=request.getContextPath()%>/trainer/trainerLogin.jsp">
							<img src="<%=request.getContextPath() %>/images/asdfff.png" width = "200px"alt="강사">
						</a>
               	</div>
                <span>강사 로그인</span>
          </div> 
      </div>              
    </section>
<jsp:include page="<%=request.getContextPath() %>/jsp/template/footer.jsp"></jsp:include>