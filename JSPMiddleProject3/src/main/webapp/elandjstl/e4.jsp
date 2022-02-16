<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 데이터 추가해서 재전송 
   request.setAttribute("name","홍길동"); // ${requestScope.name}
   session.setAttribute("name", "박문수");// ${sessionScope.name}
   application.setAttribute("name", "심청이");//${applicationScope.name}
   // ${name}
   /*
       EL => 화면 출력 
             1. 연산처리 
             2. 내장객체 (request,session)
                        ------- --------
                         
             3. 메소드 호출 
             ---------------------------
             System.out.println(10) => 10.0 , 10+20
                                s.getName()
             <%= 연산 메소드%&gt
             
             ==> 비교연산자,논리연산자 ==> 조건문 
                 <c:if test="${a<b}">
   */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%--
      1. request
      2. session
      3. application
  --%>
  request에 있는 이름 출력:${requestScope.name }<br>
  ${name}<br><%-- requestScope는 생략이 가능 --%>
  session에 있는 이름 출력:${sessionScope.name }<br>
  ${name}<br>
  application에 있는 이름 출력:${applicationScope.name }<br>
  ${name}
</body>
</html>