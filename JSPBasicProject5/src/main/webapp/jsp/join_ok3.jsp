<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.member.*"%>
<%-- 사용자로부터 전송된 데이터 받기  --%>
<%
    request.setCharacterEncoding("UTF-8"); // 한글 디코딩
%>
<%-- 객체 생성 MemberBean m=new MemberBean() --%>
<jsp:useBean id="m" class="com.sist.member.MemberBean">
  <%-- 값을 받는다 : setXxx에 값을 채워준다 --%>
  <jsp:setProperty name="m" property="*"/>
  <%-- 주의점 : HTML=>입력창의 name속성의 값 = 클래스멤버변수의 값이 동일 
       변수 :
             int  ==> Integer.parseInt()
             double => Double.parseDouble()
             boolean => Boolean.parseBoolean()
             => jsp액션태그에서 값을 대입할때 데이터형에 맞게 대입
  --%>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>사용자로부터 받은 요청 데이터</h1>
  이름:<%= m.getName() %><br>
  나이:<%= m.getAge() %><br>
  성별:<%= m.getSex() %><br>
  주소:<%= m.getAddr() %><br>
  전화:<%= m.getTel() %><br>
  <%--
        <jspUseBean id="m"/>
        id에 설정된 값은 => 일반 객체처럼 사용이 가능 
   --%>
</body>
</html>