<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="model" class="com.sist.model.DataBoardModel"/>
<%
     model.databoardListData(request); // JSP가 가지고 있는 request에
     // 데이터를 담아 달라 
     // 해당 자동 호출이 가능하게 만든다 => Controller (MV=>MVC)
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
   width:900px;
   margin: 0px auto; /*가운데 정렬*/
}
h1{
    text-align: center;
}
.table td{
  font-size: 9pt;
}
</style>
</head>
<body>
   <div class="container">
     <h1>MV방식을 이용한 자료실(계층형 게시판)</h1>
     <div class="row">
       <table class="table">
         <tr class="danger">
           <th class="text-center" width=10%>번호</th>
           <th class="text-center" width=45%>제목</th>
           <th class="text-center" width=15%>이름</th>
           <th class="text-center" width=20%>작성일</th>
           <th class="text-center" width=10%>조회수</th>
         </tr>
         <c:forEach var="vo" items="${list }">
           <tr>
	           <td class="text-center" width=10%>${vo.no }</td>
	           <td width=45%>${vo.subject }</td>
	           <td class="text-center" width=15%>${vo.name }</td>
	           <td class="text-center" width=20%>${vo.regdate }</td>
	           <td class="text-center" width=10%>${vo.hit }</td>
	         </tr>
         </c:forEach>
       </table>
     </div>
   </div>
</body>
</html>
















