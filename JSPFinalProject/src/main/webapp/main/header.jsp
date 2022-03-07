<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="wrapper row1">
  <header id="header" class="clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="../main/main.do">맛집 & 레시피 & 여행</a></h1>
    </div>
    <div class="fl_right">
     <c:if test="${sessionScope.id==null }">
      <%--
          login.do ==> DispatcherServlet(Controller)
                            |위임(request) 
                          Model(RequestMapping())
          .do ==> Model
       --%>
      <form method="post" action="../member/login.do">
	      <ul class="inline">
	        <li>ID:<input type=text name=id size=15 class="input-sm"></li>
	        <li>PW:<input type=password name=pwd size=15 class="input-sm"></li>
	        <li><input type=submit value="로그인" class="btn btn-lg btn-danger"></li>
	      </ul>
      </form>
     </c:if>
     <c:if test="${sessionScope.id!=null }">
      <form method="post" action="../member/logout.do">
       <ul class="inline">
        <li>${sessionScope.name }(${sessionScope.admin=="y"?"관리자":"일반사용자" })님 로그인되었습니다!!</li>
        <li><input type=submit value="로그아웃" class="btn btn-lg btn-danger"></li>
       </ul>
      </form>
     </c:if>
    </div>
    <!-- ################################################################################################ --> 
  </header>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="mainav" class="clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li class="active"><a href="../main/main.do">Home</a></li>
      <li><a class="drop" href="#">회원관리</a>
        <c:if test="${sessionScope.id==null }">
         <ul>
          <li><a href="../member/join.do">회원가입</a></li>
          <li><a href="../member/idfind.do">아이디찾기</a></li>
          <li><a href="../member/pwdfind.do">비밀번호찾기</a></li>
         </ul>
        </c:if>
        <c:if test="${sessionScope.id!=null }">
         <ul>
          <li><a href="../member/join_update.do">회원수정</a></li>
          <li><a href="../member/join_delete.do">회원탈퇴</a></li>
         </ul>
        </c:if>
      </li>
      <li><a class="drop" href="#">맛집</a>
        <ul>
          <li><a href="../food/location.do">지역별 맛집찾기</a></li>
          <c:if test="${sessionScope.id!=null }">
            <li><a href="../food/reserve.do">맛집예약</a></li>
            <li><a href="../food/recommand.do">맛집추천</a></li>
          </c:if>
        </ul>
      </li>
      <li><a class="drop" href="#">레시피</a>
        <ul>
          <li><a href="pages/gallery.html">레시피목록</a></li>
          <li><a href="pages/full-width.html">쉐프목록</a></li>
          <c:if test="${sessionScope.id!=null }">
           <li><a href="pages/sidebar-left.html">레시피스토어</a></li>
           <li><a href="pages/sidebar-left.html">레시피만들기</a></li>
          </c:if>
        </ul>
      </li>
      <li><a class="drop" href="#">여행</a>
        <ul>
          <li><a href="../seoul/seoul_location.do">명소</a></li>
          <li><a href="../seoul/seoul_nature.do">자연/관광</a></li>
          <li><a href="../seoul/seoul_hotel.do">호텔</a></li>
          <li><a href="../seoul/seoul_weather.do">실시간 날씨 정보</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">커뮤니티</a>
        <ul>
          <li><a href="../freeboard/list.do">자유게시판</a></li>
          <li><a href="pages/full-width.html">묻고답하기</a></li>
          <li><a href="pages/sidebar-left.html">자료실</a></li>
        </ul>
      </li>
      <li><a href="../chat/chat.do">실시간 채팅</a></li>
      <c:if test="${sessionScope.id!=null }">
       <c:if test="${sessionScope.admin=='n' }">
        <li><a href="../main/mypage.do">마이페이지</a></li>
       </c:if>
       <c:if test="${sessionScope.admin=='y' }">
        <li><a href="#">어드민페이지</a></li>
       </c:if>
      </c:if>
    </ul>
    <!-- ################################################################################################ --> 
  </nav>
</div>
</body>
</html>