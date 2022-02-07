<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      일반 자바 코딩 : 지역변수 , 제어문 , 화면 출력 => <% 자바 코딩을 한다%>
      <% %> : 스크립트릿 
      *** JSP는 클래스를 만든 것이 아니라 
          _jspServcie()에 들어가는 코딩 => 메모리 할당을 할 수 없다 
          변수선언 => 다른 JSP에서 사용 할 수 없다 
          basic5 b=new basic5() (X) => 톰캣에 의해서 메모리 할당 
                                       클래스 변경 => 컴파일 
                                       톰캣을 JSP엔진(웹 컨테이너)
          jsp를 실행하기 위해서는 반드시 톰캣 , 레진...
          => 자바문법이 그대로 적용 
             명령이 끝나면 ;을 사용한다 
             주석 => 한줄 // , 여러줄 /* */
          => JSP는 최근에 사용이 => 데이터를 읽어와서 출력 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>일반 자바 코딩 => 출력</h1>
   <%
       // 지역변수 선언 
       String name="홍길동";
       // 브라우저에 출력 
       //out.println(name); /*&lt;%= %gt;*/
   %>
   <%= name %>
</body>
</html>









