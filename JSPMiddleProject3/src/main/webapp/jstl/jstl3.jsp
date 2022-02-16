<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>자바로 1~10까지 출력 (짝수만 출력)</h1>
  <%
      for(int i=1;i<=10;i++)
      {
    	  if(i%2==0)
    	  {
  %>
             <%=i %>&nbsp;
  <%
    	  }
      }
  %>
  <h1>JSTL로 1~10까지 출력 (짝수만 출력)</h1>
  <c:forEach var="i" begin="1" end="10" step="1">
    <c:if test="${i%2==0 }">
      ${i }&nbsp;
    </c:if>
  </c:forEach>
  <h1>Java로 다중 조건문</h1>
  <%
      int star=4;
      if(star==1)
      {
  %>
          ★☆☆☆☆
  <%
      }
      else if(star==2)
      {
  %>
          ★★☆☆☆
  <%	  
      }
      else if(star==3)
      {
  %>
          ★★★☆☆
  <%
      }
      else if(star==4)
      {
  %>
          ★★★★☆
  <% 	  
      }
      else if(star==5)
      {
  %>
         ★★★★★
  <%	  
      }
      else
      {
  %>
         ☆☆☆☆☆
  <%
      }
  %>
  <h1>JSTL 다중조건문 처리 </h1>
  <c:set var="star" value="3"/>
  <c:choose>
    <c:when test="${star==1 }">★☆☆☆☆</c:when>
    <c:when test="${star==2 }">★★☆☆☆</c:when>
    <c:when test="${star==3 }">★★★☆☆</c:when>
    <c:when test="${star==4 }">★★★★☆</c:when>
    <c:when test="${star==5 }">★★★★★</c:when>
    <c:otherwise>☆☆☆☆☆</c:otherwise>
  </c:choose>
</body>
</html>








