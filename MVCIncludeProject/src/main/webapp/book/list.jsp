<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <c:forEach var="vo" items="${list }">
     <div class="col-md-4">
	    <div class="thumbnail">
	      <a href="#">
	        <img src="${vo.poster }" alt="Lights" style="width:100%">
	        <div class="caption">
	          <p>${fn:substring(vo.title,0,15) }</p>
	        </div>
	      </a>
	    </div>
	  </div>
   </c:forEach>
</body>
</html>