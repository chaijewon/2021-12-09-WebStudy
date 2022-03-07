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
      <li>마이 페이지</li>
    </ul>
    <!-- ################################################################################################ --> 
   </div>
  </div>
  <div class="wrapper row3">
   <main class="container clear">
   <h2 class="sectiontitle">예약목록</h2>
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










