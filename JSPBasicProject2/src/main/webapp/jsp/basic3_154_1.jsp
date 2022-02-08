<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    // 자바로 데이터 읽기 (데이터베이스 , 파일 , Open Api , Web크롤링)
    // List를 선언 
    List<String> names=new ArrayList<String>();
    names.add("홍길동");
    names.add("심청이");
    names.add("박문수");
    names.add("이순신");
    names.add("강감찬");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>자바 이용(1~10 =>짝수만 출력)</h1>
   <ul>
   <%
      for(int i=1;i<=10;i++)
      {
    	  if(i%2==0)
    	  {
   %>
             <li><%=i %></li>
   <%
    	  }
      }
   %>
   </ul>
   <h1>TagLib를 이용한 출력(1~10 => 짝수만 출력)</h1>
   <ul>
    <%-- JSP에서 자바를 사용하지 않는다(실무,스프링) --%>
    <core:forEach var="i" begin="1" end="10" step="1">
      <core:if test="${i%2==0 }">
       <li>${i }</li>
      </core:if>
    </core:forEach>
   </ul>
</body>
</html>









 