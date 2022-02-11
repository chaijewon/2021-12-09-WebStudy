<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.member.*"%>
<%
    // 한글 변환 
    request.setCharacterEncoding("UTF-8");
%>
<%-- 객체 생성 : MemberBean --%>
<%-- 사용자가 보내준 데이터 받기 --%>
<jsp:useBean id="m" class="com.sist.member.MemberBean">
  <jsp:setProperty name="m" property="*"/><%--property=>setXxx --%>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>사용자가 보내준 요청데이터 받기</h1>
  <!-- name : 객체명(useBean의 id)  property: getName() -->
  <!-- 속성에 값을 대입시는 반드시 "" 반드시 닫는 태그 설정 -->
  이름:<jsp:getProperty property="name" name="m"/><%-- m.getName() --%><br>
  성별:<jsp:getProperty property="sex" name="m"/><br><%--m.getSex() --%>
  나이:<jsp:getProperty property="age" name="m"/><br><%-- m.getAge() --%>
  주소:<jsp:getProperty property="addr" name="m"/><br><%--m.getAddr() --%>
  전화:<jsp:getProperty property="tel" name="m"/><%--m.getTel() --%>
</body>
</html>