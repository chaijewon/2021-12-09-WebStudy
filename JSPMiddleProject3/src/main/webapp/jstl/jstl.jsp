<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
     태그 사용시에 속성 , 여는 태그 / 닫는 태그  => XML
     태그의 순서 
     1. 속성값은 반드시 ""
     2. <c:if></c:if> <c:set />
     3. <c:forEach>
          <c:if>
         </c:forEach>
         </c:if> (X)
     4. 대소문자를 구분한다 
     5. 속성은 지정된 것만 사용한다 
     core => 변수 선언 <c:set var="" value="">
             제어문    <c:forEach>
                     <c:if>
                     <c:choose>
                     <c:forTokens>
             화면 이동 <c:redirect>
             
     변수 선언 
     -------
     <c:set var="a" value="Hello"/>
      => request.setAttribute("a","Hello");
 --%>
<c:set var="name" value="홍길동"/>
<c:set var="sex" value="남자"/>
<!-- 색상 변경 , 스타일 변경 , 값을 누적  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 이름:${name }<br><%-- request.getAttribute("name") --%>
 성별:${sex }
</body>
</html>





