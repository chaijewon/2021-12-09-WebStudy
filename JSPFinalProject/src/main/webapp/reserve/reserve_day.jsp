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
  <table class="table">
    <caption class="text-center">${year }년 ${month }월</caption>
    <tr>
     <c:forEach var="w" items="${strWeek }">
      <th class="text-center">${w }</th>
     </c:forEach>
    </tr>
  </table>
</body>
</html>