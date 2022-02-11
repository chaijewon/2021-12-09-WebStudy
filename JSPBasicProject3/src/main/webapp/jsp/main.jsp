<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id=request.getParameter("id");
    String pwd=request.getParameter("pwd");
    // 파일을 이동할때마다 request는 초기화 (이전 데이터를 받아 볼수 없다)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  ID:<%=id %><br>
  PWD:<%=pwd %>
</body>
</html>