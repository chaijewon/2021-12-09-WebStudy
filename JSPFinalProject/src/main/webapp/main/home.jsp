<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      JSP => 링크 , 입력 
      Model => 입력 받기
      FoodDAO => 
      JSP로 전송 
 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <div id="slider" class="clear"> 
    <!-- ################################################################################################ -->
    <div class="flexslider basicslider">
      <ul class="slides">
        <li><a href="#"><img class="radius-10" src="../images/demo/slides/food.png" style="width:978px;height:400px"></a></li>
        <li><a href="#"><img class="radius-10" src="../images/demo/slides/recipe.jpg" style="width:978px;height:400px"></a></li>
        <li><a href="#"><img class="radius-10" src="../images/demo/slides/seoul.png" style="width:978px;height:400px"></a></li>
      </ul>
    </div>
    <!-- ################################################################################################ --> 
  </div>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <!-- ################################################################################################ -->
    <ul class="nospace group btmspace-80">
      <li class="one_third first">
        <article class="service"><i class="icon fa fa-ambulance"></i>
          <h6 class="heading"><a href="#">서울 명소</a></h6>
          <p>놓칠 수 없는 서울의 명소</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
      <li class="one_third">
        <article class="service"><i class="icon fa fa-h-square"></i>
          <h6 class="heading"><a href="#">서울 자연/관광</a></h6>
          <p>멀리 가지 않아도 도심 속에서 느낄 수 있는 자연의 힐링</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
      <li class="one_third">
        <article class="service"><i class="icon fa fa-hospital-o"></i>
          <h6 class="heading"><a href="#">서울 호텔</a></h6>
          <p>잠드는 순간에도 특별한 경험을 원하는 여행객 모두를 위한 서울의 호텔</p>
          <footer><a href="#">Read More &raquo;</a></footer>
        </article>
      </li>
    </ul>
    <!-- ################################################################################################ -->
    <h2 class="sectiontitle">믿고 보는 맛집 리스트</h2>
    <!-- ################################################################################################ -->
    <div class="flexslider carousel basiccarousel btmspace-80">
      <ul class="slides">
       <%--
           믿고 보는 맛집 리스트 cno => 1~12
           지역별 13~18
           메뉴별 19~30 
        --%>
        <%--
            varStatus => list의 index번호 가지고 온다 
         --%>
       <c:forEach var="vo" items="${list }" varStatus="s">
        <c:if test="${s.index>=0 && s.index<12 }">
         <li>
          <figure><img class="radius-10 btmspace-10" style="width:320px;height:185px" src="${vo.poster }" alt="">
            <figcaption><a href="../food/category_list.do?cno=${vo.cno }">${vo.title }</a></figcaption>
          </figure>
         </li>
        </c:if>
       </c:forEach>
      </ul>
    </div>
    <h2 class="sectiontitle">지역별 맛집 리스트</h2>
    <!-- ################################################################################################ -->
    <div class="flexslider carousel basiccarousel btmspace-80">
      <ul class="slides">
        <c:forEach var="vo" items="${list }" varStatus="s">
        <c:if test="${s.index>=12 && s.index<18 }">
         <li>
          <figure><img class="radius-10 btmspace-10" style="width:320px;height:185px" src="${vo.poster }" alt="">
            <figcaption><a href="../food/category_list.do?cno=${vo.cno }">${vo.title }</a></figcaption>
            <%-- 
                 link => Controller - Model에서 처리 <==> DAO 
                 ----사용자 요청 |
                              | Controller
                              실행 결과를 JSP로 전송 (request)
                 link(jsp) ===> Model <====> DAO
                                  |
                                 JSP (request)
                                 
                 ../food/category_list.do => Model <==> DAO
                                               |
                                            화면 출력할 JSP로 전송 
                              
            --%>
          </figure>
         </li>
        </c:if>
       </c:forEach>
      </ul>
    </div>
    <h2 class="sectiontitle">메뉴별 인기 맛집</h2>
    <!-- ################################################################################################ -->
    <div class="flexslider carousel basiccarousel btmspace-80">
      <ul class="slides">
        <c:forEach var="vo" items="${list }" varStatus="s">
        <c:if test="${s.index>=18 && s.index<30 }">
         <li>
          <figure><img class="radius-10 btmspace-10" style="width:320px;height:185px" src="${vo.poster }" alt="">
            <figcaption><a href="../food/category_list.do?cno=${vo.cno }">${vo.title }</a></figcaption>
          </figure>
         </li>
        </c:if>
       </c:forEach>
      </ul>
    </div>
    <!-- ################################################################################################ -->
    <h2 class="sectiontitle">최신 방문 맛집</h2>
    <!-- ################################################################################################ -->
    <ul class="nospace group">
      <li class="one_half first">
        <article><img class="imgl radius-10" src="../images/demo/100x100.gif" alt="">
          <h6 class="heading"><a href="#">Lorem Ipsum Dolor</a></h6>
          <p>Aenean semper elementum tellus, ut placerat leo. Quisque vehicula, urna sit amet.</p>
        </article>
      </li>
      <li class="one_half">
        <article><img class="imgl radius-10" src="../images/demo/100x100.gif" alt="">
          <h6 class="heading"><a href="#">Lorem Ipsum Dolor</a></h6>
          <p>Aenean semper elementum tellus, ut placerat leo. Quisque vehicula, urna sit amet.</p>
        </article>
      </li>
    </ul>
    <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
</body>
</html>