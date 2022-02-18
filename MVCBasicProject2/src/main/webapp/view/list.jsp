<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <center>
     <h1>${msg }</h1>
     <a href="Controller?cmd=insert">추가</a><br>
     <a href="Controller?cmd=update">수정</a><br>
     <a href="Controller?cmd=delete">삭제</a>
   </center>
</body>
</html>