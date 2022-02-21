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
  <div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>맛집 상세보기</li>
    </ul>
    <!-- ################################################################################################ --> 
   </div>
  </div>
  <div class="wrapper row3">
   <main class="container clear">
     <div class="content">
	   <table class="table">
	     <tr>
	      <c:forTokens var="poster" items="${vo.poster }" delims="^">
	        <td class="text-center">
	         <img src="${poster }" width=100%>
	        </td>
	      </c:forTokens>
	     </tr>
	   </table>
	  </div>
    <div class="clear"></div>
    <div class="content two_quarter first"> 
	 <table class="table">
	  <tr>
	   <td colspan="2">
	    <h3>${vo.name }&nbsp;<span style="color:orange">${vo.score }</span></h3>
	   </td>
	  </tr>
	  <tr>
	    <th width=15%>주소</th>
	    <td width=85%>${vo.addr1 }<br>
	       ${vo.addr2 }
	    </td>
	  </tr>
	  <tr>
	    <th width=20%>전화</th>
	    <td width=80%>${vo.tel }</td>
	  </tr>
	  <tr>
	    <th width=20%>음식종류</th>
	    <td width=80%>${vo.type }</td>
	  </tr>
	  <tr>
	    <th width=20%>가격대</th>
	    <td width=80%>${vo.price }</td>
	  </tr>
	  <tr>
	    <th width=20%>주차</th>
	    <td width=80%>${vo.parking }</td>
	  </tr>
	  <tr>
	    <th width=20%>영업시간</th>
	    <td width=80%>${vo.time }</td>
	  </tr>
	  <c:if test="${vo.menu!='no' }">
		  <tr>
		    <th width=20%>메뉴</th>
		    <td width=80%>
		      <ul>
		       <c:forTokens items="${vo.menu }" delims="원" var="m">
		         <li>${m }원</li> 
		       </c:forTokens>
		      </ul>
		    </td>
		  </tr>
	  </c:if>
	  <tr>
	    <td colspan="2" class="text-right">
	     <a href="#" class="btn btn-xs btn-danger">찜하기</a>
	     <a href="#" class="btn btn-xs btn-success">예약하기</a>
	     <a href="javascript:history.back()" class="btn btn-xs btn-primary">목록</a>
	    </td>
	  </tr>
	 </table>
	 <div id="comments">
        <h2>Comments</h2>
        <ul>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
          </ul>
        </div>
	</div>
	<div class="content two_quarter second">
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
		geocoder.addressSearch('${vo.addr1}', function(result, status) {
		
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
	</div>
	
   </main>
   </div>

  
</body>
</html>












