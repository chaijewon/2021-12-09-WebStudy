<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%
    // 사용자가 요청한 데이터 (맛집 번호 전송)
    String no=request.getParameter("no");
    // 오라클 데이터 읽기 => FoodVO
    FoodDAO dao=new FoodDAO();
    FoodVO vo=dao.foodDetailData(Integer.parseInt(no));
    String addr=vo.getAddress();
    String addr1=addr.substring(0,addr.lastIndexOf("지"));
    String addr2=addr.substring(addr.lastIndexOf("지"));
    // 대구광역시
    // 
    String temp=addr.substring(addr.indexOf(" "));// 포함 
    // temp=중구 국채보상로 696-8
    System.out.println("temp="+temp);
    String gu=temp.trim().substring(0,temp.trim().indexOf(" "));// 제거
    System.out.println("gu="+gu);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
  /* 크기 결정 */
  margin: 0px auto; 
  width:1024px;
}
h3,h4{
  text-align: center;
}
p{
   font-size: 9pt;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <table class="table">
        <tr>
         <%
            StringTokenizer st=
              new StringTokenizer(vo.getPoster(),"^");
            while(st.hasMoreTokens())
            {
         %>
              <td class="text-center">
               <img src="<%=st.nextToken() %>" width=100%>
              </td>
         <%
            }
         %>
        </tr>
      </table>
    </div>
    <div style="height: 30px"></div>
    <div class="col-sm-7">
      <table class="table">
        <tr>
          <td colspan="2"><h2><%=vo.getName() %>&nbsp;<span style="color:orange"><%=vo.getScore() %></span></h2></td>
        </tr>
        <tr>
         <td width=15% style="color:gray">주소</td>
         <td width=85%><%=addr1 %>
          <br>
          <%=addr2 %>
         </td>
        </tr>
        <tr>
         <td width=15% style="color:gray">전화번호</td>
         <td width=85%><%=vo.getTel() %></td>
        </tr>
        <tr>
         <td width=15% style="color:gray">음식종류</td>
         <td width=85%><%=vo.getType() %></td>
        </tr>
        <%
           if(!vo.getPrice().equals("no"))
           {
        %>
        <tr>
         <td width=15% style="color:gray">가격대</td>
         <td width=85%><%=vo.getPrice() %></td>
        </tr>
        <%
           }
        %>
        <%
           if(!vo.getParking().equals("no"))
           {
        %>
        <tr>
         <td width=15% style="color:gray">주차</td>
         <td width=85%><%=vo.getParking() %></td>
        </tr>
        <%
           }
        %>
        <%
           if(!vo.getMenu().equals("no"))
           {
        %>
        <tr>
         <td width=15% style="color:gray">메뉴</td>
         <td width=85%>
           <ul>
             <%
                 st=new StringTokenizer(vo.getMenu(),"원");
                 while(st.hasMoreTokens())
                 {
             %>
                    <li><%=st.nextToken() %>원</li>
             <%
                 }
             %>
           </ul>
         </td>
        </tr>
        <%
           }
        %>
      </table>
      <div style="height: 20px"></div>
      <%
          String id=(String)session.getAttribute("id");
          if(id!=null) //로그인이 되었다면 
          {
      %>
		      <table class="table">
		       <tr>
		        <td>
		          <textarea rows="4" cols="60" name="msg" style="float:left"></textarea>
		          <button class="btn btn-sm btn-primary"
		          style="float:left;height: 82px">댓글쓰기</button>
		        </td>
		       </tr>
		      </table>
      <%
          }
      %>
    </div>
    <div class="col-sm-5">
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
		geocoder.addressSearch('<%=addr1%>', function(result, status) {
		
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
		            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=vo.getName()%></div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
		</script>
		<div style="height: 20px"></div>
		<h2 style="color:orange">주변 인기 식당</h2>
		<hr>
		
    </div>
  </div>
</body>
</html>





