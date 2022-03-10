<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
      <li>관리자 페이지</li>
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
     <th class="text-center">아이디</th>
     <th class="text-center" style="color:black">업체명</th>
     <th class="text-center" style="color:black">예약일</th>
     <th class="text-center" style="color:black">예약시간</th>
     <th class="text-center" style="color:black">인원</th>
     <th class="text-center" style="color:black">등록일</th>
     <th class="text-center" style="color:black">비고</th>
    </tr>
    <c:forEach var="vo" items="${rList }">
      <tr>
        <td class="text-center">${vo.no }</td>
        <td class="text-center">
         <img src="${vo.poster }" style="width:30px;height:30px">
        </td>
        <td class="text-center">${vo.id }</td>
        <td class="text-center">${vo.name }</td>
        <td class="text-center">${vo.day }</td>
        <td class="text-center">${vo.time }</td>
        <td class="text-center">${vo.inwon }</td>
        <td class="text-center">
         <fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
        </td>
        <td class="text-center">
          <c:if test="${vo.ok==0 }">
           <a href="../reserve/adminok.do?no=${vo.no }" class="btn btn-sm btn-warning">승인대기</a>
          </c:if>
          <c:if test="${vo.ok==1 }">
           <span class="btn btn-sm btn-danger">승인완료</a>
          </c:if>
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
           <a href="../cart/cart_adminOk.do?no=${vo.cart_id }" class="btn btn-sm btn-danger">승인대기</a>
         </c:if>
         <c:if test="${vo.ischeck!=0 }">
           <span class="btn btn-sm btn-warning">승인완료</span>
         </c:if>
        </td>
      </tr>
    </c:forEach>
   </table>
  </div>
</body>
</html>