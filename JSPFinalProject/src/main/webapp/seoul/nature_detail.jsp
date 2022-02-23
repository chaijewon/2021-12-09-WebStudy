<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>${vo.title } 상세보기</li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
 </div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
 <div class="wrapper row3">
  <main class="container clear">
    <h1 class="text-center">${vo.title }</h1>
    <table class="table">
      <tr>
        <td>
         <img src="${vo.poster }" style="width:978px;height:400px">
        </td>
      </tr>
      <tr>
        <td>${vo.msg }</td>
      </tr>
      <tr>
        <td>${vo.address }</td>
      </tr>
      <tr>
        <td>
         <div id="map" style="width:100%;height:350px;"></div>

		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=676eb5fa2637b234997b24dd7566e9ba&libraries=services"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${vo.address}', function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
        </td>
      </tr>
    </table>
    <h2 class="sectiontitle">인근 맛집</h2>
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
         <li>
          <figure><img class="radius-10 btmspace-10" style="width:320px;height:185px" src="${vo.poster }" alt="">
            <figcaption><a href="../food/food_detail.do?no=${vo.no }&type=1">${vo.name }</a></figcaption>
          </figure>
         </li>
       </c:forEach>
      </ul>
    </div>
  </main>
 </div>
</body>
</html>
