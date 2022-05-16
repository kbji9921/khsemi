<%@page import="semi.servlet.DtoDao.AttachmentDto"%>
<%@page import="semi.servlet.DtoDao.AttachmentDao"%>
<%@page import="semi.servlet.DtoDao.TrainerAttachmentDto"%>
<%@page import="semi.servlet.DtoDao.TrainerAttachmentDao"%>
<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 준비 --%>
<%
//String trainerId = "testuser6";
String trainerId = (String) request.getSession().getAttribute("trainer");
%>

<%-- 처리 --%>
<%
TrainerDao trainerDao = new TrainerDao();
TrainerDto trainerDto = trainerDao.selectOne(trainerId);

//트레이너 아이디를 통해 trainerAttachment DB에서 번호 획득
TrainerAttachmentDao trainerAttachmentDao = new TrainerAttachmentDao();
int attach = trainerAttachmentDao.selectOne(trainerId);
//trainerAttachment에서 받은 번호를 attachmentDao에 넣어서 불러오기
AttachmentDao attachmentDao = new AttachmentDao();
AttachmentDto attachmentDto = attachmentDao.selectOne(attach);
boolean noPic = attachmentDto == null;
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mypage.css">
<style>
.flex-container {
	padding: 1em;
	background-color: #343b6a;
	color: white;
	border-radius: 0.3em;
}

.img-wrapper {
	width: 25%;
}

.contents-wrapper {
	flex-grow: 1; /*나머지 전부 다 라는 의미로 쓰임 */
}
/* .Container{
            /* border:1px solid black; 
        } */
.list-center-area {
	width: 60px;
}

.list-image-area {
	width: 200px;
	height: 200px;
}

.list-image-area img {
	width: 100%;
}

input:readonly {
	background-color: #F0F0F0;
}

.btn {
	height: 40px;
	border-radius: 0.25em;
}

.asdf {
	width: 100%;
	height: 100%;
}

#lnb {
	margin-top: -40px;
}

.top {
	position: fixed;
	bottom: 350px;
	right: 5px;
}

#lnb {
	background-color: #343b6a !important;
}

#lnb li a {
	font-weight: 500;
	height: 50px;
	line-height: 50px;
	color: #fff !important;
	font-size: 17px;
}

#lnb-right {
	display: flex;
	justify-content: space-around;
}

.menu, .menu li, .menu ul, .menu a {
	background-color: #343b6a !important;
	color: white !important;
	overflow: visible !important;
	text-overflow: visible !important;
	width: 2em important;
}

.mypage-nickname {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 50%;
	margin-left: 20px;
}

.hide {
	display: none !important;
}
#btn5{
	background-color:red !important;
	border:none !important;
	color:white !important;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
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
</script>
</head>
<body>
	<form class="join-form" method="post" action="Information.trainer">
		<div class="container w500 m30">
			<div class="flex-container flex-vertical">
				<div class="flex-container list-center-listbox">
					<!--강사 이미지-->
					<div class="row center list-image-area">
						<%
						if (!noPic) {
						%>
						<a
							href="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>">
							<img
							src="<%=request.getContextPath()%>/file/download.kh?attachmentNo=<%=attach%>"
							class="img img-circle asdf">
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
					<h3 class="mypage-nickname"><%=trainerDto.getTrainerName()%>님
					</h3>
				</div>

			</div>
			<div class="row">
				<%
				if (!noPic) {
				%>
				<a
					href="<%=request.getContextPath()%>/profile/trainerProfileDelete.jsp"
					class="link link-btn">프로필 삭제</a>
				<%
				} else {
				%>
				<a
					href="<%=request.getContextPath()%>/profile/trainerProfileInsert.jsp"
					class="link link-btn">프로필 등록</a>
				<%
				}
				%>
				<%
				if (trainerDto.getCenterId() == null) {
				%>
				<a href="<%=request.getContextPath()%>/center/write.jsp"
					class="link link-btn">센터등록</a> <a
					href="<%=request.getContextPath()%>/trainer/trainerJoinCenter.jsp"
					class="link link-btn">센터가입</a>
				<%
				} else {
				%>
				<a
					href="<%=request.getContextPath()%>/center/update.jsp?centerId=<%=trainerDto.getCenterId()%>"
					class="link link-btn">센터수정</a>
				<%
				}
				%>
			</div>
		</div>
		<!--  -->
		<div class="container w500 m30">
			<div class="row">
				<div class="row">
					<label>아이디</label> <input type="text"
						class="form-input input-round fill mypage-input"
						value="<%=trainerDto.getTrainerId()%>" readonly name="trainerId">
					<span></span>
				</div>
				<div class="row">
					<label>이름</label> <input type="text"
						class="form-input input-round fill input-dis mypage-input"
						value="<%=trainerDto.getTrainerName()%>" name="trainerName">
					<span></span>
				</div>
				<div class="row">
					<label>생년월일</label> <input type="date"
						class="form-input input-round fill input-dis mypage-input"
						value="<%=trainerDto.getTrainerBirth()%>" name="trainerBirth">
					<span></span>
				</div>
				<div class="row ">
					<label>전화번호</label> <input type="tel"
						class="form-input input-round fill input-dis mypage-input"
						value="<%=trainerDto.getTrainerPhone()%>" name="trainerPhone">
					<span></span>
				</div>
				<div class="row ">
					<label>이메일</label> <input type="email"
						class="form-input input-round fill input-dis mypage-input"
						value="<%=trainerDto.getTrainerEmail()%>" name="trainerEmail">
					<span></span>
					<div class="row ">
						<label>운동종목</label> <select
							class="form-input input-round fill input-dis mypage-input"
							name="trainerSports">
							<%
							if (trainerDto.getTrainerSports().equals("요가")) {
							%>
							<option value="요가" selected>요가</option>
							<%
							} else {
							%>
							<option value="요가">요가</option>
							<%
							}
							%>
							<%
							if (trainerDto.getTrainerSports().equals("필라테스")) {
							%>
							<option value="필라테스" selected>필라테스</option>
							<%
							} else {
							%>
							<option value="필라테스">필라테스</option>
							<%
							}
							%>
							<%
							if (trainerDto.getTrainerSports().equals("수영")) {
							%>
							<option value="수영" selected>수영</option>
							<%
							} else {
							%>
							<option value="수영">수영</option>
							<%
							}
							%>
							<%
							if (trainerDto.getTrainerSports().equals("테니스")) {
							%>
							<option value="테니스" selected>테니스</option>
							<%
							} else {
							%>
							<option value="테니스">테니스</option>
							<%
							}
							%>
							<%
							if (trainerDto.getTrainerSports().equals("헬스")) {
							%>
							<option value="헬스" selected>헬스</option>
							<%
							} else {
							%>
							<option value="헬스">헬스</option>
							<%
							}
							%>
						</select>
					</div>
					<div class="row ">
						<label>성별</label> <select
							class="form-input input-round fill input-dis mypage-input"
							name="trainerGender">
							<%
							if (trainerDto.getTrainerGender().equals("여자")) {
							%>
							<option value="여자" selected>여자</option>
							<%
							} else {
							%>
							<option value="여자">여자</option>
							<%
							}
							%>
							<%
							if (trainerDto.getTrainerGender().equals("남자")) {
							%>
							<option value="남자" selected>"남자"</option>
							<%
							} else {
							%>
							<option value="남자">남자</option>
							<%
							}
							%>
						</select>
					</div>
					<div class="row ">
						<label>Pt가격</label> <input type="text"
							class="form-input input-round fill input-dis mypage-input"
							value="<%=trainerDto.getTrainerPrice()%>" name="trainerPrice">
						<span></span>
					</div>
					<div class="row ">
						<label for="logindate">가입일</label> <input type="text"
							class="form-input input-round fill input-dis mypage-input"
							value="<%=trainerDto.getTrainerJoindate()%>" id="logindate">
						<span></span>
					</div>
					<div class="row ">
						<label>최근접속일</label> <input type="text"
							class="form-input input-round fill input-dis mypage-input"
							value="<%=trainerDto.getTrainerLogindate()%>"> <span></span>
					</div>
					<div class="row ">
						<label>비밀번호</label> <input type="password"
							class="form-input input-round fill input-dis mypage-input" name="trainerPw">
						<span></span>
					</div>
				</div>
			</div>
			<div class="row">
				<button class="btn btn-semi fill mypage-btn" id="btn">수정</button>
				<button class="btn btn-semi fill hide mypage-btn" id="btn2">변경완료</button>
			</div>
			<div class="row">
				<button type="button" class="btn btn-primary fill hide mypage-btn" id="btn3">취소</button>
			</div>
			<div class="row">
				<a
					href="<%=request.getContextPath()%>/trainer/trainerSetPw.jsp?trainerId=<%=trainerId%>"
					class="link link-btn fill hide mypage-btn" id="btn4">비밀번호 변경</a>
			</div>
			<div class="row">
				<a
					href="<%=request.getContextPath()%>/trainer/trainerDelete.jsp?trainerId=<%=trainerId%>"
					class="link link-btn  fill hide mypage-btn" id="btn5">탈퇴</a>
			</div>
			<div class="top">
				<a href="#top"> <img
					src="<%=request.getContextPath()%>/images/top.png" width="50px"
					title="위로 가기"></a>
			</div>
		</div>
	</form>
</body>
</html>
<jsp:include page="/jsp/template/footer.jsp"></jsp:include>