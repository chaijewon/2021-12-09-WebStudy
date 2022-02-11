<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>클라이언트가 요청한 Request값</h1>
  <h3>ID:<%= request.getParameter("id")%></h3>
</body>
</html>