<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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