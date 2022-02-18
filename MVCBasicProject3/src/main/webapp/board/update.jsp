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
     <%-- request.setAttribute("msg","Update") 
          자바로 받아서 출력 : String msg=request.getAttribute("msg");
          JSP 출력 : ${msg} => ${requestScope.msg}
                                ------------
                                 getAttribute()
          ${msg} == <%=request.getAttribute("msg")%>
     --%>
     <a href="Controller?cmd=detail">상세보기</a>
   </center>
</body>
</html>