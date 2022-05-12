<%@page import="semi.servlet.DtoDao.TrainerDto"%>
<%@page import="semi.servlet.DtoDao.TrainerDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String trainerSports = request.getParameter("trainerSport");
TrainerDao trainerDao = new TrainerDao();
List<TrainerDto> list = trainerDao.selectTrainerSportsList(trainerSports);

	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	boolean isSearch = type != null && !type.equals("") && keyword != null && !keyword.equals("");
	List<TrainerDto> trainerList;
 	if(isSearch){
 		trainerList = trainerDao.selectList(type, keyword);
 		//eocList = eocDao.selectList(centerId);
 	}
 	else{
 		trainerList = trainerDao.selectList();
 		//eocList = eocDao.selectList(centerId);
 	}
%>
<jsp:include page="/jsp/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/center.css">

	 <div class="container w650 m30">

        <div class="row center">
            <h1>살빠GYM CENTER</h1>
        </div>
        <!--검색창-->
        <div class="row center m30">
            <form action="/semi/center/list.jsp" method="get">
            <%if(type==null||type.equals("center_basic_address")){ %>
                <select name="type" class="form-input input-round">
                    <option value="center_basic_address" selected >운동종목</option>     
                    <option value="center_name">강사이름</option>
                </select>
                <%} else{%>
                 <select name="type" class="form-input input-round">
                    <option value="center_basic_address">운동종목</option>     
                    <option value="center_name" selected >강사이름</option>
                </select>
                <%} %>
                <%if(isSearch){ %>
                	<input type="text" name="keyword" class="form-input input-round" placeholder="센터명 또는 OO동으로 검색" value="<%=keyword%>">
                <%} else{ %>
                	<input type="text" name="keyword" class="form-input input-round" placeholder="센터명 또는 OO동으로 검색">
                <%} %>
                <button type="submit" class="btn btn-primary">검색</button>
            </form>
        </div>
	     <!--센터 목록-->
        <div class="flex-container flex-vertical">
        	<%for(TrainerDto trainerDto : list){ %>
            <div class="flex-container list-center-listbox">
                <!--센터이미지-->
                <div class="row center list-image-area">
                    <a href="/semi/center/detail.jsp?centerId=<%=trainerDto.getCenterId()%>">
                    <img src="http://via.placeholder.com/150x150" class="img img-hover img-round">
                    </a>
                </div>
                <div class="list-center-area">
                    <div class="row m30">
                    <a href="/semi/center/detail.jsp?centerId=<%=trainerDto.getCenterId()%>">
                        <h2><%=trainerDto.getTrainerName()%></h2>
                        </a>
                    </div>
                    <div class="row">
                        <h4><%=trainerDto.getTrainerSports()%>&nbsp;<%=trainerDto.getTrainerGender()%></h4>
                    </div>
                    <%--센터 담당 운동 
                    <%for(EocDto eocDto : eocList){ %>
                    <div class="row center list-exercise-kinds">
                        <h4><%=eocDto.getEocExerciseName() %></h4>
                    </div>
					<%} %>--%>
                    <!--좋아요 수-->
                    <div class="row right">
                        <h4>[10]</h4>
                    </div>
                </div>
      
            </div>
                    <%} %>
        </div>
    </div>

<jsp:include page="/jsp/template/footer.jsp"></jsp:include>