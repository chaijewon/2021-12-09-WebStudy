<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
$(function(){
	$('.ups').hide();//table => 닫기 => 더보기 
	$('.updates').click(function(){ // span => 수정버튼 클릭 
		$('.ups').hide(); // 수정창 닫기 
		let no=$(this).attr("data-no");
		if(i==0)
		{
			$('#m'+no).show();
			i=1;
			$(this).text("취소");
		}
		else
		{
			$('#m'+no).hide();
			i=0;
			$(this).text("수정");
		}
	})
});
</script>
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
        <h2>리뷰(댓글)</h2>
        <ul>
         <c:forEach var="rvo" items="${rList }">
	          <li>
	            <article>
	              <header>
	                <figure class="avatar">
	                 <c:if test="${sessionScope.id==rvo.id}">
	                   <span class="btn btn-xs btn-success updates" data-no="${rvo.no }" style="color:black">수정</span>
	                   <a href="../reply/reply_delete.do?no=${rvo.no }&rno=${rvo.rno}&tp=1" class="btn btn-xs btn-warning" style="color:black">삭제</a>
	                 </c:if>
	                </figure>
	                <address>
	                By <a href="#">${rvo.name}(${rvo.dbday })</a>
	                </address>
	              </header>
	              <div class="comcont">
	                <p><pre style="white-space:pre-wrap;background-color:white;border:none">${rvo.msg }</pre></p>
	              </div>
	            </article>
	            <table class="table ups" id="m${rvo.no }" style="display:none">
	             <tr>
	               <td>
	                 <form method=post action="../reply/reply_update.do">
	                     <input type="hidden" name=rno value="${vo.no }">
	                     <input type=hidden name=no value="${rvo.no}">
	                     <input type=hidden name=tp value="1">
		                 <textarea rows="5" name="msg" cols="48" style="float:left">${rvo.msg }</textarea>
		                  <input type=submit value="댓글수정" class="btn btn-primary"
		                  style="height: 30px">
	                 </form>
	               </td>
	             </tr>
	           </table>
	          </li>
	         
          </c:forEach>
          </ul>
        </div>
        <c:if test="${sessionScope.id!=null }"><%--로그인이 된 상태 --%>
	        <table class="table">
	             <tr>
	               <td>
	                 <form method=post action="../reply/reply_insert.do">
	                     <input type="hidden" name=rno value="${vo.no }">
	                     <input type=hidden name="type" value="1">
		                 <textarea rows="5" name="msg" cols="48" style="float:left"></textarea>
		                  <input type=submit value="댓글쓰기" class="btn btn-primary"
		                  style="height: 105px">
	                 </form>
	               </td>
	             </tr>
	           </table>
        </c:if>
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












