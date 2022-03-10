<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $( function() {
	$('.ends').click(function(){
		 let no=$(this).attr("data-no")
		 let name=$('#name'+no).text();
		 let day=$('#day'+no).text();
		 let time=$('#time'+no).text();
		 let inwon=$('#inwon'+no).text();
		 
		 $('#a').text(no);
		 $('#b').text(name);
		 $('#c').text(day);
		 $('#d').text(time);
		 $('#e').text(inwon);
		 $( "#dialog" ).dialog();
	})
  } );
  </script>
</head>
<body>
  <div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>마이 페이지</li>
    </ul>
    <!-- ################################################################################################ --> 
   </div>
  </div>
  <div class="wrapper row3">
   <main class="container clear">
   <h2 class="sectiontitle">예약목록</h2>
   <table class="table">
    <tr class="danger">
     <th class="text-center" style="color:black">번호</th>
     <th class="text-center"></th>
     <th class="text-center" style="color:black">업체명</th>
     <th class="text-center" style="color:black">예약일</th>
     <th class="text-center" style="color:black">예약시간</th>
     <th class="text-center" style="color:black">인원</th>
     <th class="text-center" style="color:black">등록일</th>
     <th class="text-center" style="color:black">비고</th>
    </tr>
    <c:forEach var="vo" items="${rList }">
      <tr>
        <td class="text-center" id="no${vo.no }">${vo.no }</td>
        <td class="text-center">
         <img src="${vo.poster }" style="width:30px;height:30px">
        </td>
        <td class="text-center" id="name${vo.no }">${vo.name }</td>
        <td class="text-center" id="day${vo.no }">${vo.day }</td>
        <td class="text-center" id="time${vo.no }">${vo.time }</td>
        <td class="text-center" id="inwon${vo.no }">${vo.inwon }</td>
        <td class="text-center">
         <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
        </td>
        <td class="text-center">
          <c:if test="${vo.ok==0 }">
           <span class="btn btn-sm btn-warning">예약대기</span>
          </c:if>
          <c:if test="${vo.ok==1 }">
           <span class="btn btn-sm btn-danger ends" data-no="${vo.no }">예약완료</a>
          </c:if>
        </td>
      </tr>
      <tr>
        <td>
            <div id="dialog" title="예약정보" style="display:none">
			  <p>예약번호:<span id="a"></span></p>
			  <p>업체명:<span id="b"></span></p>
			  <p>예약일:<span id="c"></span></p>
			  <p>예약시간:<span id="d"></span></p>
			  <p>예약인원:<span id="e"></span></p>
			</div>
        </td>
      </tr>
    </c:forEach>
   </table>
   <h2 class="sectiontitle">구매내역</h2>
   <table class="table">
    <tr class="into">
      <th class="text-center" style="color:black">번호</th>
      <th class="text-center"></th>
      <th class="text-center" style="color:black">상품명</th>
      <th class="text-center" style="color:black">금액</th>
      <th class="text-center" style="color:black">수량</th>
      <th class="text-center" style="color:black">총금액</th>
      <th class="text-center" style="color:black">구매일</th>
      <th class="text-center" style="color:black">비고</th>
    </tr>
    <c:forEach var="vo" items="${cList }">
      <tr>
        <td class="text-center">${vo.cart_id }</td>
        <td class="text-center">
          <img src="${vo.poster }" style="width:30px;height:30px">
        </td>
        <td>${vo.title }</td>
        <td class="text-center">${vo.price }</td>
        <td class="text-center">${vo.amont }</td>
        <td class="text-center">${vo.price*vo.amont }</td>
        <td class="text-center">
         <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
        </td>
        <td class="text-center">
         <c:if test="${vo.ischeck==0 }">
          <a href="#" class="btn btn-sm btn-danger">구매</a>
          <a href="../cart/cart_delete.do?no=${vo.cart_id }" class="btn btn-sm btn-warning">취소</a>
         </c:if>
         <c:if test="${vo.ischeck==1 }">
          <span class="btn btn-sm btn-success">구매완료</span>
         </c:if>
        </td>
      </tr>
    </c:forEach>
   </table>
   <h2 class="sectiontitle">찜목록</h2>
   <table class="table">
    <tr class="success">
      <th class="text-center" style="color:black">번호</th>
      <th class="text-center"></th>
      <th class="text-center" style="color:black">업체명</th>
      <th class="text-center" style="color:black">비고</th>
    </tr>
    <c:forEach var="jvo" items="${list }">
      <tr>
       <td class="text-center">${jvo.no }</td>
       <td class="text-center">
        <img src="${jvo.poster }" style="width:30px;height:30px">
       </td>
       <td class="text-center">${jvo.name }</td>
       <td class="text-center">
         <a href="../jjim/jjim_delete.do?no=${jvo.no }" class="btn btn-sm btn-primary">취소</a>
       </td>
      </tr>
    </c:forEach>
   </table>
   </main>
  </div>
</body>
</html>










